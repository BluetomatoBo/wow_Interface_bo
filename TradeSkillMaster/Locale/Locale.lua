-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
TSM.L = {}



do
	local locale = GetLocale()
	if locale == "enUS" or locale == "enGB" then
		TSM.L["%d Groups"] = "%d Groups"
		TSM.L["%d Items"] = "%d Items"
		TSM.L["%d Operations"] = "%d Operations"
		TSM.L["%d Posted Auctions"] = "%d Posted Auctions"
		TSM.L["%d Sold Auctions"] = "%d Sold Auctions"
		TSM.L["%d auctions"] = "%d auctions"
		TSM.L["%d of %d"] = "%d of %d"
		TSM.L["%d |4Group:Groups; Selected (%d |4Item:Items;)"] = "%d |4Group:Groups; Selected (%d |4Item:Items;)"
		TSM.L["%s (%s bags, %s bank, %s AH, %s mail)"] = "%s (%s bags, %s bank, %s AH, %s mail)"
		TSM.L["%s (%s player, %s alts, %s guild, %s AH)"] = "%s (%s player, %s alts, %s guild, %s AH)"
		TSM.L["%s (%s profit)"] = "%s (%s profit)"
		TSM.L["%s Crafts"] = "%s Crafts"
		TSM.L["%s ago"] = "%s ago"
		TSM.L["%s in guild vault"] = "%s in guild vault"
		TSM.L["%s is a valid custom price but %s is an invalid item."] = "%s is a valid custom price but %s is an invalid item."
		TSM.L["%s is a valid custom price but did not give a value for %s."] = "%s is a valid custom price but did not give a value for %s."
		TSM.L["%s is not a valid custom price and gave the following error: %s"] = "%s is not a valid custom price and gave the following error: %s"
		TSM.L["%s previously had the max number of operations, so removed %s."] = "%s previously had the max number of operations, so removed %s."
		TSM.L["%s removed."] = "%s removed."
		TSM.L["%s sent you %s"] = "%s sent you %s"
		TSM.L["%s sent you %s and %s"] = "%s sent you %s and %s"
		TSM.L["%s sent you a COD of %s for %s"] = "%s sent you a COD of %s for %s"
		TSM.L["%s sent you a message: %s"] = "%s sent you a message: %s"
		TSM.L["%s total"] = "%s total"
		TSM.L["%s |4operation:operations;"] = "%s |4operation:operations;"
		TSM.L["%sDrag%s to move this button"] = "%sDrag%s to move this button"
		TSM.L["%sLeft-Click%s to open the main window"] = "%sLeft-Click%s to open the main window"
		TSM.L["'%s' is an invalid operation! Min restock of %d is higher than max restock of %d."] = "'%s' is an invalid operation! Min restock of %d is higher than max restock of %d."
		TSM.L["(%d/500 Characters)"] = "(%d/500 Characters)"
		TSM.L["(New group(s) will be created)"] = "(New group(s) will be created)"
		TSM.L["(max %d)"] = "(max %d)"
		TSM.L["(max 200)"] = "(max 200)"
		TSM.L["(max 5000)"] = "(max 5000)"
		TSM.L["(min %d - max %d)"] = "(min %d - max %d)"
		TSM.L["(min 0 - max 10000)"] = "(min 0 - max 10000)"
		TSM.L["(minimum 0 - maximum 20)"] = "(minimum 0 - maximum 20)"
		TSM.L["(minimum 0 - maximum 2000)"] = "(minimum 0 - maximum 2000)"
		TSM.L["(minimum 0 - maximum 905)"] = "(minimum 0 - maximum 905)"
		TSM.L["(minimum 0.5 - maximum 10)"] = "(minimum 0.5 - maximum 10)"
		TSM.L["/tsm help|r - Shows this help listing"] = "/tsm help|r - Shows this help listing"
		TSM.L["/tsm|r - opens the main TSM window."] = "/tsm|r - opens the main TSM window."
		TSM.L["1 Group"] = "1 Group"
		TSM.L["1 Item"] = "1 Item"
		TSM.L["12 hr"] = "12 hr"
		TSM.L["24 hr"] = "24 hr"
		TSM.L["48 hr"] = "48 hr"
		TSM.L["A custom price of %s for %s evaluates to %s."] = "A custom price of %s for %s evaluates to %s."
		TSM.L["A maximum of 1 convert() function is allowed."] = "A maximum of 1 convert() function is allowed."
		TSM.L["A profile with that name already exists on the target account. Rename it first and try again."] = "A profile with that name already exists on the target account. Rename it first and try again."
		TSM.L["A profile with this name already exists."] = "A profile with this name already exists."
		TSM.L["A scan is already in progress. Please stop that scan before starting another one."] = "A scan is already in progress. Please stop that scan before starting another one."
		TSM.L["ADD %d ITEMS"] = "ADD %d ITEMS"
		TSM.L["ADD NEW CUSTOM PRICE SOURCE"] = "ADD NEW CUSTOM PRICE SOURCE"
		TSM.L["ADD OPERATION"] = "ADD OPERATION"
		TSM.L["ADD TO MAIL"] = "ADD TO MAIL"
		TSM.L["AH"] = "AH"
		TSM.L["AH (Crafting)"] = "AH (Crafting)"
		TSM.L["AH (Disenchanting)"] = "AH (Disenchanting)"
		TSM.L["AH BUSY"] = "AH BUSY"
		TSM.L["AH Frame Options"] = "AH Frame Options"
		TSM.L["AMOUNT"] = "AMOUNT"
		TSM.L["APPLY FILTERS"] = "APPLY FILTERS"
		TSM.L["AUCTION DETAILS"] = "AUCTION DETAILS"
		TSM.L["Above max expires."] = "Above max expires."
		TSM.L["Above max price. Not posting."] = "Above max price. Not posting."
		TSM.L["Above max price. Posting at max price."] = "Above max price. Posting at max price."
		TSM.L["Above max price. Posting at min price."] = "Above max price. Posting at min price."
		TSM.L["Above max price. Posting at normal price."] = "Above max price. Posting at normal price."
		TSM.L["Accepting these item(s) will cost"] = "Accepting these item(s) will cost"
		TSM.L["Accepting this item will cost"] = "Accepting this item will cost"
		TSM.L["Account Syncing"] = "Account Syncing"
		TSM.L["Account sync removed. Please delete the account sync from the other account as well."] = "Account sync removed. Please delete the account sync from the other account as well."
		TSM.L["Accounting"] = "Accounting"
		TSM.L["Accounting Tooltips"] = "Accounting Tooltips"
		TSM.L["Activity Type"] = "Activity Type"
		TSM.L["Add / Remove Items"] = "Add / Remove Items"
		TSM.L["Add Player"] = "Add Player"
		TSM.L["Add Subject / Description"] = "Add Subject / Description"
		TSM.L["Add Subject / Description (Optional)"] = "Add Subject / Description (Optional)"
		TSM.L["Added %s to %s."] = "Added %s to %s."
		TSM.L["Added '%s' profile which was received from %s."] = "Added '%s' profile which was received from %s."
		TSM.L["Additional error suppressed"] = "Additional error suppressed"
		TSM.L["Adjust the settings below to set how groups attached to this operation will be auctioned."] = "Adjust the settings below to set how groups attached to this operation will be auctioned."
		TSM.L["Adjust the settings below to set how groups attached to this operation will be cancelled."] = "Adjust the settings below to set how groups attached to this operation will be cancelled."
		TSM.L["Adjust the settings below to set how groups attached to this operation will be priced."] = "Adjust the settings below to set how groups attached to this operation will be priced."
		TSM.L["Advanced Item Search"] = "Advanced Item Search"
		TSM.L["Advanced Options"] = "Advanced Options"
		TSM.L["Alarm Clock"] = "Alarm Clock"
		TSM.L["All Auctions"] = "All Auctions"
		TSM.L["All Characters and Guilds"] = "All Characters and Guilds"
		TSM.L["All Item Classes"] = "All Item Classes"
		TSM.L["All Professions"] = "All Professions"
		TSM.L["All Subclasses"] = "All Subclasses"
		TSM.L["Allow partial stack?"] = "Allow partial stack?"
		TSM.L["Alt Guild Bank"] = "Alt Guild Bank"
		TSM.L["Alts"] = "Alts"
		TSM.L["Alts AH"] = "Alts AH"
		TSM.L["Amount"] = "Amount"
		TSM.L["Amount of Bag Space to Keep Free"] = "Amount of Bag Space to Keep Free"
		TSM.L["Apply operation to group:"] = "Apply operation to group:"
		TSM.L["Are you sure you want to clear old accounting data?"] = "Are you sure you want to clear old accounting data?"
		TSM.L["Are you sure you want to delete this group?"] = "Are you sure you want to delete this group?"
		TSM.L["Are you sure you want to delete this operation?"] = "Are you sure you want to delete this operation?"
		TSM.L["Are you sure you want to reset all operation settings?"] = "Are you sure you want to reset all operation settings?"
		TSM.L["At above max price and not undercut."] = "At above max price and not undercut."
		TSM.L["At normal price and not undercut."] = "At normal price and not undercut."
		TSM.L["Auction"] = "Auction"
		TSM.L["Auction Bid"] = "Auction Bid"
		TSM.L["Auction Buyout"] = "Auction Buyout"
		TSM.L["Auction Duration"] = "Auction Duration"
		TSM.L["Auction Sale Sound"] = "Auction Sale Sound"
		TSM.L["Auction Window Close"] = "Auction Window Close"
		TSM.L["Auction Window Open"] = "Auction Window Open"
		TSM.L["Auction has been bid on."] = "Auction has been bid on."
		TSM.L["AuctionDB - Market Value"] = "AuctionDB - Market Value"
		TSM.L["Auctionator - Auction Value"] = "Auctionator - Auction Value"
		TSM.L["Auctioneer - Appraiser"] = "Auctioneer - Appraiser"
		TSM.L["Auctioneer - Market Value"] = "Auctioneer - Market Value"
		TSM.L["Auctioneer - Minimum Buyout"] = "Auctioneer - Minimum Buyout"
		TSM.L["Auctioning"] = "Auctioning"
		TSM.L["Auctioning 'POST'/'CANCEL' Button"] = "Auctioning 'POST'/'CANCEL' Button"
		TSM.L["Auctioning Log"] = "Auctioning Log"
		TSM.L["Auctioning Operation"] = "Auctioning Operation"
		TSM.L["Auctions"] = "Auctions"
		TSM.L["Auto Quest Complete"] = "Auto Quest Complete"
		TSM.L["Average Earned Per Day:"] = "Average Earned Per Day:"
		TSM.L["Average Prices:"] = "Average Prices:"
		TSM.L["Average Profit Per Day:"] = "Average Profit Per Day:"
		TSM.L["Average Spent Per Day:"] = "Average Spent Per Day:"
		TSM.L["Avg Buy Price"] = "Avg Buy Price"
		TSM.L["Avg Resale Profit"] = "Avg Resale Profit"
		TSM.L["Avg Sell Price"] = "Avg Sell Price"
		TSM.L["BACK TO LIST"] = "BACK TO LIST"
		TSM.L["BID"] = "BID"
		TSM.L["BUSY"] = "BUSY"
		TSM.L["BUY"] = "BUY"
		TSM.L["BUY GROUPS"] = "BUY GROUPS"
		TSM.L["BUYBACK ALL"] = "BUYBACK ALL"
		TSM.L["BUYOUT"] = "BUYOUT"
		TSM.L["BUYS"] = "BUYS"
		TSM.L["Back to List"] = "Back to List"
		TSM.L["Bag"] = "Bag"
		TSM.L["Bags"] = "Bags"
		TSM.L["Banks"] = "Banks"
		TSM.L["Base Group"] = "Base Group"
		TSM.L["Base Item"] = "Base Item"
		TSM.L["Below are your currently available price sources organized by module. The %skey|r is what you would type into a custom price box."] = "Below are your currently available price sources organized by module. The %skey|r is what you would type into a custom price box."
		TSM.L["Below custom price:"] = "Below custom price:"
		TSM.L["Below min price. Posting at max price."] = "Below min price. Posting at max price."
		TSM.L["Below min price. Posting at min price."] = "Below min price. Posting at min price."
		TSM.L["Below min price. Posting at normal price."] = "Below min price. Posting at normal price."
		TSM.L["Below, you can manage your profiles which allow you to have entirely different sets of groups."] = "Below, you can manage your profiles which allow you to have entirely different sets of groups."
		TSM.L["Bid %d / %d"] = "Bid %d / %d"
		TSM.L["Bid (item)"] = "Bid (item)"
		TSM.L["Bid (stack)"] = "Bid (stack)"
		TSM.L["Bid Price"] = "Bid Price"
		TSM.L["Bid Sniper Paused"] = "Bid Sniper Paused"
		TSM.L["Bid Sniper Running"] = "Bid Sniper Running"
		TSM.L["Bidding Auction"] = "Bidding Auction"
		TSM.L["Blacklisted players:"] = "Blacklisted players:"
		TSM.L["Bought"] = "Bought"
		TSM.L["Bought %d of %s from %s for %s"] = "Bought %d of %s from %s for %s"
		TSM.L["Bought %sx%d for %s from %s"] = "Bought %sx%d for %s from %s"
		TSM.L["Bound Actions"] = "Bound Actions"
		TSM.L["Buy"] = "Buy"
		TSM.L["Buy %d / %d"] = "Buy %d / %d"
		TSM.L["Buy %d / %d (Confirming %d / %d)"] = "Buy %d / %d (Confirming %d / %d)"
		TSM.L["Buy Options"] = "Buy Options"
		TSM.L["Buy from AH"] = "Buy from AH"
		TSM.L["Buy from Vendor"] = "Buy from Vendor"
		TSM.L["Buyer/Seller"] = "Buyer/Seller"
		TSM.L["Buyout (item)"] = "Buyout (item)"
		TSM.L["Buyout (stack)"] = "Buyout (stack)"
		TSM.L["Buyout Confirmation Alert"] = "Buyout Confirmation Alert"
		TSM.L["Buyout Price"] = "Buyout Price"
		TSM.L["Buyout Sniper Paused"] = "Buyout Sniper Paused"
		TSM.L["Buyout Sniper Running"] = "Buyout Sniper Running"
		TSM.L["By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."] = "By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."
		TSM.L["CANCELS"] = "CANCELS"
		TSM.L["CHARACTER"] = "CHARACTER"
		TSM.L["CLEAR DATA"] = "CLEAR DATA"
		TSM.L["COD"] = "COD"
		TSM.L["CONTACTS"] = "CONTACTS"
		TSM.L["CRAFT"] = "CRAFT"
		TSM.L["CRAFT ALL"] = "CRAFT ALL"
		TSM.L["CRAFT NEXT"] = "CRAFT NEXT"
		TSM.L["CRAFTER"] = "CRAFTER"
		TSM.L["CRAFTING"] = "CRAFTING"
		TSM.L["CREATE MACRO"] = "CREATE MACRO"
		TSM.L["CREATE NEW PROFILE"] = "CREATE NEW PROFILE"
		TSM.L["CURRENT SEARCH"] = "CURRENT SEARCH"
		TSM.L["CUSTOM POST"] = "CUSTOM POST"
		TSM.L["Can't load TSM tooltip while in combat"] = "Can't load TSM tooltip while in combat"
		TSM.L["Cancel Scan"] = "Cancel Scan"
		TSM.L["Cancel auctions with bids"] = "Cancel auctions with bids"
		TSM.L["Cancel to repost higher?"] = "Cancel to repost higher?"
		TSM.L["Cancel undercut auctions?"] = "Cancel undercut auctions?"
		TSM.L["Canceling"] = "Canceling"
		TSM.L["Canceling %d / %d"] = "Canceling %d / %d"
		TSM.L["Canceling %d Auctions..."] = "Canceling %d Auctions..."
		TSM.L["Canceling Settings"] = "Canceling Settings"
		TSM.L["Canceling all auctions."] = "Canceling all auctions."
		TSM.L["Canceling auction which you've undercut."] = "Canceling auction which you've undercut."
		TSM.L["Canceling disabled."] = "Canceling disabled."
		TSM.L["Canceling to repost at higher price."] = "Canceling to repost at higher price."
		TSM.L["Canceling to repost at reset price."] = "Canceling to repost at reset price."
		TSM.L["Canceling to repost higher."] = "Canceling to repost higher."
		TSM.L["Canceling undercut auctions and to repost higher."] = "Canceling undercut auctions and to repost higher."
		TSM.L["Canceling undercut auctions."] = "Canceling undercut auctions."
		TSM.L["Cancelled"] = "Cancelled"
		TSM.L["Cancelled Since Last Sale"] = "Cancelled Since Last Sale"
		TSM.L["Cancelled auction of %sx%d"] = "Cancelled auction of %sx%d"
		TSM.L["Cannot repair from the guild bank!"] = "Cannot repair from the guild bank!"
		TSM.L["Cash Register"] = "Cash Register"
		TSM.L["Character"] = "Character"
		TSM.L["Chat Tab"] = "Chat Tab"
		TSM.L["Cheapest auction below min price."] = "Cheapest auction below min price."
		TSM.L["Clear"] = "Clear"
		TSM.L["Clear All"] = "Clear All"
		TSM.L["Clear Filters"] = "Clear Filters"
		TSM.L["Clear Old Data"] = "Clear Old Data"
		TSM.L["Clear Old Data Confirmation"] = "Clear Old Data Confirmation"
		TSM.L["Clear Queue"] = "Clear Queue"
		TSM.L["Clear Selection"] = "Clear Selection"
		TSM.L["Coins (%s)"] = "Coins (%s)"
		TSM.L["Combine Partial Stacks"] = "Combine Partial Stacks"
		TSM.L["Combining..."] = "Combining..."
		TSM.L["Configuration Scroll Wheel"] = "Configuration Scroll Wheel"
		TSM.L["Confirm"] = "Confirm"
		TSM.L["Confirm Complete Sound"] = "Confirm Complete Sound"
		TSM.L["Confirming %d / %d"] = "Confirming %d / %d"
		TSM.L["Connected to %s"] = "Connected to %s"
		TSM.L["Connecting to %s"] = "Connecting to %s"
		TSM.L["Contacts Menu"] = "Contacts Menu"
		TSM.L["Cooldown"] = "Cooldown"
		TSM.L["Cooldowns"] = "Cooldowns"
		TSM.L["Cost"] = "Cost"
		TSM.L["Could not apply %s operation to group %s because the group does not exist"] = "Could not apply %s operation to group %s because the group does not exist"
		TSM.L["Could not create macro as you already have too many. Delete one of your existing macros and try again."] = "Could not create macro as you already have too many. Delete one of your existing macros and try again."
		TSM.L["Could not deserialize input"] = "Could not deserialize input"
		TSM.L["Could not find enchanted item from"] = "Could not find enchanted item from"
		TSM.L["Could not find pet"] = "Could not find pet"
		TSM.L["Could not find profile '%s'. Possible profiles: '%s'"] = "Could not find profile '%s'. Possible profiles: '%s'"
		TSM.L["Could not sell items due to not having free bag space available to split a stack of items."] = "Could not sell items due to not having free bag space available to split a stack of items."
		TSM.L["Craft"] = "Craft"
		TSM.L["Craft (Unprofitable)"] = "Craft (Unprofitable)"
		TSM.L["Craft (When Profitable)"] = "Craft (When Profitable)"
		TSM.L["Craft All"] = "Craft All"
		TSM.L["Craft Name"] = "Craft Name"
		TSM.L["Craft value method:"] = "Craft value method:"
		TSM.L["Crafting"] = "Crafting"
		TSM.L["Crafting 'CRAFT NEXT' Button"] = "Crafting 'CRAFT NEXT' Button"
		TSM.L["Crafting Cost"] = "Crafting Cost"
		TSM.L["Crafting Queue"] = "Crafting Queue"
		TSM.L["Crafting Tooltips"] = "Crafting Tooltips"
		TSM.L["Crafts"] = "Crafts"
		TSM.L["Crafts %d"] = "Crafts %d"
		TSM.L["Create New Operation"] = "Create New Operation"
		TSM.L["Crystals"] = "Crystals"
		TSM.L["Current Profiles"] = "Current Profiles"
		TSM.L["Custom Price"] = "Custom Price"
		TSM.L["Custom Price Source"] = "Custom Price Source"
		TSM.L["Custom Sources"] = "Custom Sources"
		TSM.L["DEPOSIT REAGENTS"] = "DEPOSIT REAGENTS"
		TSM.L["DISENCHANT SEARCH"] = "DISENCHANT SEARCH"
		TSM.L["DOWN"] = "DOWN"
		TSM.L["Database Sources"] = "Database Sources"
		TSM.L["Default Craft Value Method:"] = "Default Craft Value Method:"
		TSM.L["Default Material Cost Method:"] = "Default Material Cost Method:"
		TSM.L["Default Price"] = "Default Price"
		TSM.L["Default Price Configuration"] = "Default Price Configuration"
		TSM.L["Define what priority Gathering gives certain sources."] = "Define what priority Gathering gives certain sources."
		TSM.L["Delete Profile Confirmation"] = "Delete Profile Confirmation"
		TSM.L["Delete this record?"] = "Delete this record?"
		TSM.L["Deposit Cost"] = "Deposit Cost"
		TSM.L["Deposit Price"] = "Deposit Price"
		TSM.L["Deselect All Groups"] = "Deselect All Groups"
		TSM.L["Deselect All Items"] = "Deselect All Items"
		TSM.L["Destroy Next"] = "Destroy Next"
		TSM.L["Destroy Value"] = "Destroy Value"
		TSM.L["Destroy Value Source"] = "Destroy Value Source"
		TSM.L["Destroying"] = "Destroying"
		TSM.L["Destroying 'DESTROY NEXT' Button"] = "Destroying 'DESTROY NEXT' Button"
		TSM.L["Destroying Tooltips"] = "Destroying Tooltips"
		TSM.L["Destroying..."] = "Destroying..."
		TSM.L["Details"] = "Details"
		TSM.L["Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."] = "Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."
		TSM.L["Did not cancel %s because your maximum price (%s) is invalid. Check your settings."] = "Did not cancel %s because your maximum price (%s) is invalid. Check your settings."
		TSM.L["Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."
		TSM.L["Did not cancel %s because your minimum price (%s) is invalid. Check your settings."] = "Did not cancel %s because your minimum price (%s) is invalid. Check your settings."
		TSM.L["Did not cancel %s because your normal price (%s) is invalid. Check your settings."] = "Did not cancel %s because your normal price (%s) is invalid. Check your settings."
		TSM.L["Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."
		TSM.L["Did not cancel %s because your undercut (%s) is invalid. Check your settings."] = "Did not cancel %s because your undercut (%s) is invalid. Check your settings."
		TSM.L["Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."] = "Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."
		TSM.L["Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."] = "Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."
		TSM.L["Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."] = "Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."
		TSM.L["Did not post %s because your maximum price (%s) is invalid. Check your settings."] = "Did not post %s because your maximum price (%s) is invalid. Check your settings."
		TSM.L["Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."
		TSM.L["Did not post %s because your minimum price (%s) is invalid. Check your settings."] = "Did not post %s because your minimum price (%s) is invalid. Check your settings."
		TSM.L["Did not post %s because your normal price (%s) is invalid. Check your settings."] = "Did not post %s because your normal price (%s) is invalid. Check your settings."
		TSM.L["Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."
		TSM.L["Did not post %s because your undercut (%s) is invalid. Check your settings."] = "Did not post %s because your undercut (%s) is invalid. Check your settings."
		TSM.L["Disable invalid price warnings"] = "Disable invalid price warnings"
		TSM.L["Disenchant Search"] = "Disenchant Search"
		TSM.L["Disenchant Search Options"] = "Disenchant Search Options"
		TSM.L["Disenchant Value"] = "Disenchant Value"
		TSM.L["Disenchanting Options"] = "Disenchanting Options"
		TSM.L["Display Operation Names"] = "Display Operation Names"
		TSM.L["Display auctioning values"] = "Display auctioning values"
		TSM.L["Display cancelled since last sale"] = "Display cancelled since last sale"
		TSM.L["Display crafting cost"] = "Display crafting cost"
		TSM.L["Display detailed destroy info"] = "Display detailed destroy info"
		TSM.L["Display disenchant value"] = "Display disenchant value"
		TSM.L["Display expired auctions"] = "Display expired auctions"
		TSM.L["Display global historical price"] = "Display global historical price"
		TSM.L["Display global market value avg"] = "Display global market value avg"
		TSM.L["Display global min buyout avg"] = "Display global min buyout avg"
		TSM.L["Display global sale avg"] = "Display global sale avg"
		TSM.L["Display group name"] = "Display group name"
		TSM.L["Display historical price"] = "Display historical price"
		TSM.L["Display market value"] = "Display market value"
		TSM.L["Display mill value"] = "Display mill value"
		TSM.L["Display min buyout"] = "Display min buyout"
		TSM.L["Display prospect value"] = "Display prospect value"
		TSM.L["Display purchase info"] = "Display purchase info"
		TSM.L["Display region historical price"] = "Display region historical price"
		TSM.L["Display region market value avg"] = "Display region market value avg"
		TSM.L["Display region min buyout avg"] = "Display region min buyout avg"
		TSM.L["Display region sale avg"] = "Display region sale avg"
		TSM.L["Display region sale rate"] = "Display region sale rate"
		TSM.L["Display region sold per day"] = "Display region sold per day"
		TSM.L["Display sale info"] = "Display sale info"
		TSM.L["Display sale rate"] = "Display sale rate"
		TSM.L["Display shopping max price"] = "Display shopping max price"
		TSM.L["Display total money recieved in chat?"] = "Display total money recieved in chat?"
		TSM.L["Display transform value"] = "Display transform value"
		TSM.L["Display vendor buy price"] = "Display vendor buy price"
		TSM.L["Display vendor sell price"] = "Display vendor sell price"
		TSM.L["Doing so will also remove any sub-groups attached to this group."] = "Doing so will also remove any sub-groups attached to this group."
		TSM.L["Don't Post Items"] = "Don't Post Items"
		TSM.L["Don't post after this many expires:"] = "Don't post after this many expires:"
		TSM.L["Don't prompt to record trades"] = "Don't prompt to record trades"
		TSM.L["Done Canceling"] = "Done Canceling"
		TSM.L["Done Posting"] = "Done Posting"
		TSM.L["Done Scanning"] = "Done Scanning"
		TSM.L["Done rebuilding item cache."] = "Done rebuilding item cache."
		TSM.L["Drag Item(s) Into Box"] = "Drag Item(s) Into Box"
		TSM.L["Drag in Additional Items (%d/%d Items)"] = "Drag in Additional Items (%d/%d Items)"
		TSM.L["Duplicate"] = "Duplicate"
		TSM.L["Duplicate Profile Confirmation"] = "Duplicate Profile Confirmation"
		TSM.L["Dust"] = "Dust"
		TSM.L["EMPTY BAGS"] = "EMPTY BAGS"
		TSM.L["EXPENSES"] = "EXPENSES"
		TSM.L["EXPIRES"] = "EXPIRES"
		TSM.L["Elevate your gold-making!"] = "Elevate your gold-making!"
		TSM.L["Embed TSM tooltips"] = "Embed TSM tooltips"
		TSM.L["Empty parentheses are not allowed"] = "Empty parentheses are not allowed"
		TSM.L["Empty price string."] = "Empty price string."
		TSM.L["Enable TSM Tooltips"] = "Enable TSM Tooltips"
		TSM.L["Enable automatic stack combination"] = "Enable automatic stack combination"
		TSM.L["Enable buying?"] = "Enable buying?"
		TSM.L["Enable inbox chat messages"] = "Enable inbox chat messages"
		TSM.L["Enable restock?"] = "Enable restock?"
		TSM.L["Enable selling?"] = "Enable selling?"
		TSM.L["Enable sending chat messages"] = "Enable sending chat messages"
		TSM.L["Enable tweet enhancement"] = "Enable tweet enhancement"
		TSM.L["Enchant Vellum"] = "Enchant Vellum"
		TSM.L["Ensure both characters are online and try again."] = "Ensure both characters are online and try again."
		TSM.L["Enter Filter"] = "Enter Filter"
		TSM.L["Enter Keyword"] = "Enter Keyword"
		TSM.L["Enter a name for the new profile"] = "Enter a name for the new profile"
		TSM.L["Enter name of logged-in character from other account"] = "Enter name of logged-in character from other account"
		TSM.L["Enter player name"] = "Enter player name"
		TSM.L["Essences"] = "Essences"
		TSM.L["Establishing connection to %s. Make sure that you've entered this character's name on the other account."] = "Establishing connection to %s. Make sure that you've entered this character's name on the other account."
		TSM.L["Estimated Cost:"] = "Estimated Cost:"
		TSM.L["Estimated Profit:"] = "Estimated Profit:"
		TSM.L["Exact Match Only?"] = "Exact Match Only?"
		TSM.L["Exclude crafts with cooldowns"] = "Exclude crafts with cooldowns"
		TSM.L["Expenses"] = "Expenses"
		TSM.L["Expired"] = "Expired"
		TSM.L["Expired Since Last Sale"] = "Expired Since Last Sale"
		TSM.L["Expires"] = "Expires"
		TSM.L["Expires Since Last Sale"] = "Expires Since Last Sale"
		TSM.L["Exploration"] = "Exploration"
		TSM.L["Export"] = "Export"
		TSM.L["Export List"] = "Export List"
		TSM.L["FILTER BY KEYWORD"] = "FILTER BY KEYWORD"
		TSM.L["Failed Auctions"] = "Failed Auctions"
		TSM.L["Failed Since Last Sale (Expired/Cancelled)"] = "Failed Since Last Sale (Expired/Cancelled)"
		TSM.L["Failed to bid on auction of %s."] = "Failed to bid on auction of %s."
		TSM.L["Failed to buy auction of %s."] = "Failed to buy auction of %s."
		TSM.L["Failed to find auction for %s, so removing it from the results."] = "Failed to find auction for %s, so removing it from the results."
		TSM.L["Failed to send profile."] = "Failed to send profile."
		TSM.L["Failed to send profile. Ensure both characters are online and try again."] = "Failed to send profile. Ensure both characters are online and try again."
		TSM.L["Favorite Scans"] = "Favorite Scans"
		TSM.L["Favorite Searches"] = "Favorite Searches"
		TSM.L["Filter Auctions by Duration"] = "Filter Auctions by Duration"
		TSM.L["Filter Auctions by Keyword"] = "Filter Auctions by Keyword"
		TSM.L["Filter Items"] = "Filter Items"
		TSM.L["Filter Shopping"] = "Filter Shopping"
		TSM.L["Filter by Keyword"] = "Filter by Keyword"
		TSM.L["Filter group item lists based on the following price source"] = "Filter group item lists based on the following price source"
		TSM.L["Finding Selected Auction"] = "Finding Selected Auction"
		TSM.L["Finished importing %s"] = "Finished importing %s"
		TSM.L["Fishing Reel In"] = "Fishing Reel In"
		TSM.L["Forget Character"] = "Forget Character"
		TSM.L["Found auction sound"] = "Found auction sound"
		TSM.L["Friends"] = "Friends"
		TSM.L["From"] = "From"
		TSM.L["Full"] = "Full"
		TSM.L["GOLD ON HAND"] = "GOLD ON HAND"
		TSM.L["GREAT DEALS SEARCH"] = "GREAT DEALS SEARCH"
		TSM.L["GVault"] = "GVault"
		TSM.L["Garrison"] = "Garrison"
		TSM.L["Gathering"] = "Gathering"
		TSM.L["Gathering Search"] = "Gathering Search"
		TSM.L["General Options"] = "General Options"
		TSM.L["Get from Bank"] = "Get from Bank"
		TSM.L["Get from Guild Bank"] = "Get from Guild Bank"
		TSM.L["Global Data Tooltips"] = "Global Data Tooltips"
		TSM.L["Global Historical Price"] = "Global Historical Price"
		TSM.L["Global Market Value Avg"] = "Global Market Value Avg"
		TSM.L["Global Min Buyout Avg"] = "Global Min Buyout Avg"
		TSM.L["Global Operation Confirmation"] = "Global Operation Confirmation"
		TSM.L["Global Sale Avg"] = "Global Sale Avg"
		TSM.L["Gold"] = "Gold"
		TSM.L["Gold Earned:"] = "Gold Earned:"
		TSM.L["Gold Spent:"] = "Gold Spent:"
		TSM.L["Group Management"] = "Group Management"
		TSM.L["Group Operations"] = "Group Operations"
		TSM.L["Group Settings"] = "Group Settings"
		TSM.L["Group already exists."] = "Group already exists."
		TSM.L["Grouped Items"] = "Grouped Items"
		TSM.L["Groups"] = "Groups"
		TSM.L["Guild"] = "Guild"
		TSM.L["Guild Bank"] = "Guild Bank"
		TSM.L["Have"] = "Have"
		TSM.L["Have Materials"] = "Have Materials"
		TSM.L["Have Skill Up"] = "Have Skill Up"
		TSM.L["Hide Description"] = "Hide Description"
		TSM.L["Hide auctions with bids"] = "Hide auctions with bids"
		TSM.L["Hide minimap icon"] = "Hide minimap icon"
		TSM.L["Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."] = "Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."
		TSM.L["Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."] = "Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."
		TSM.L["High Bidder"] = "High Bidder"
		TSM.L["Historical Price"] = "Historical Price"
		TSM.L["Hold ALT to repair from the guild bank."] = "Hold ALT to repair from the guild bank."
		TSM.L["Hold shift to move the items to the parent group instead of removing them."] = "Hold shift to move the items to the parent group instead of removing them."
		TSM.L["Hr"] = "Hr"
		TSM.L["Hrs"] = "Hrs"
		TSM.L["I just bought [%s]x%d for %s! %s #TSM4 #warcraft"] = "I just bought [%s]x%d for %s! %s #TSM4 #warcraft"
		TSM.L["I just sold [%s] for %s! %s #TSM4 #warcraft"] = "I just sold [%s] for %s! %s #TSM4 #warcraft"
		TSM.L["IMPORT"] = "IMPORT"
		TSM.L["ITEM CLASS"] = "ITEM CLASS"
		TSM.L["ITEM LEVEL RANGE"] = "ITEM LEVEL RANGE"
		TSM.L["ITEM SEARCH"] = "ITEM SEARCH"
		TSM.L["ITEM SUBCLASS"] = "ITEM SUBCLASS"
		TSM.L["ITEMS"] = "ITEMS"
		TSM.L["If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."] = "If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."
		TSM.L["If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."] = "If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."
		TSM.L["If you have multiple profile set up with operations, enabling this will cause all but the current profile's operations to be irreversibly lost. Are you sure you want to continue?"] = "If you have multiple profile set up with operations, enabling this will cause all but the current profile's operations to be irreversibly lost. Are you sure you want to continue?"
		TSM.L["Ignore Auctions Below Min"] = "Ignore Auctions Below Min"
		TSM.L["Ignore Characters"] = "Ignore Characters"
		TSM.L["Ignore Guilds"] = "Ignore Guilds"
		TSM.L["Ignore auctions by duration?"] = "Ignore auctions by duration?"
		TSM.L["Ignore duplicate operations?"] = "Ignore duplicate operations?"
		TSM.L["Ignore item variations?"] = "Ignore item variations?"
		TSM.L["Ignore operation on characters:"] = "Ignore operation on characters:"
		TSM.L["Ignore operation on faction-realms:"] = "Ignore operation on faction-realms:"
		TSM.L["Ignored Cooldowns"] = "Ignored Cooldowns"
		TSM.L["Ignored Items"] = "Ignored Items"
		TSM.L["Import"] = "Import"
		TSM.L["Import %d Items and %s Operations?"] = "Import %d Items and %s Operations?"
		TSM.L["Import Groups & Operations"] = "Import Groups & Operations"
		TSM.L["Imported Items"] = "Imported Items"
		TSM.L["Imported Operations"] = "Imported Operations"
		TSM.L["Inbox Settings"] = "Inbox Settings"
		TSM.L["Include Attached Operations"] = "Include Attached Operations"
		TSM.L["Include operations?"] = "Include operations?"
		TSM.L["Include soulbound items"] = "Include soulbound items"
		TSM.L["Information"] = "Information"
		TSM.L["Invalid custom price entered."] = "Invalid custom price entered."
		TSM.L["Invalid custom price source for %s. %s"] = "Invalid custom price source for %s. %s"
		TSM.L["Invalid custom price."] = "Invalid custom price."
		TSM.L["Invalid function."] = "Invalid function."
		TSM.L["Invalid gold value."] = "Invalid gold value."
		TSM.L["Invalid group name."] = "Invalid group name."
		TSM.L["Invalid item link."] = "Invalid item link."
		TSM.L["Invalid operation name."] = "Invalid operation name."
		TSM.L["Invalid operator at end of custom price."] = "Invalid operator at end of custom price."
		TSM.L["Invalid parameter to price source."] = "Invalid parameter to price source."
		TSM.L["Invalid player name."] = "Invalid player name."
		TSM.L["Invalid price source in convert."] = "Invalid price source in convert."
		TSM.L["Invalid price source."] = "Invalid price source."
		TSM.L["Invalid search filter"] = "Invalid search filter"
		TSM.L["Invalid seller data returned by server."] = "Invalid seller data returned by server."
		TSM.L["Invalid word: '%s'"] = "Invalid word: '%s'"
		TSM.L["Inventory"] = "Inventory"
		TSM.L["Inventory / Gold Graph"] = "Inventory / Gold Graph"
		TSM.L["Inventory / Mailing"] = "Inventory / Mailing"
		TSM.L["Inventory Options"] = "Inventory Options"
		TSM.L["Inventory Tooltip Format"] = "Inventory Tooltip Format"
		TSM.L["It appears that you've manually copied your saved variables between accounts which will cause TSM's automatic sync'ing to not work. You'll need to undo this, and/or delete the TradeSkillMaster saved variables files on both accounts (with WoW closed) in order to fix this."] = "It appears that you've manually copied your saved variables between accounts which will cause TSM's automatic sync'ing to not work. You'll need to undo this, and/or delete the TradeSkillMaster saved variables files on both accounts (with WoW closed) in order to fix this."
		TSM.L["Item"] = "Item"
		TSM.L["Item Level"] = "Item Level"
		TSM.L["Item Name"] = "Item Name"
		TSM.L["Item Quality"] = "Item Quality"
		TSM.L["Item Value"] = "Item Value"
		TSM.L["Item links may only be used as parameters to price sources."] = "Item links may only be used as parameters to price sources."
		TSM.L["Item/Group is invalid (see chat)."] = "Item/Group is invalid (see chat)."
		TSM.L["Items"] = "Items"
		TSM.L["Items in Bags"] = "Items in Bags"
		TSM.L["Keep in bags quantity:"] = "Keep in bags quantity:"
		TSM.L["Keep in bank quantity:"] = "Keep in bank quantity:"
		TSM.L["Keep posted:"] = "Keep posted:"
		TSM.L["Keep quantity:"] = "Keep quantity:"
		TSM.L["Keep this amount in bags:"] = "Keep this amount in bags:"
		TSM.L["Keep this amount:"] = "Keep this amount:"
		TSM.L["Keeping %d."] = "Keeping %d."
		TSM.L["Keeping undercut auctions posted."] = "Keeping undercut auctions posted."
		TSM.L["LAST 30 DAYS"] = "LAST 30 DAYS"
		TSM.L["LAST 7 DAYS"] = "LAST 7 DAYS"
		TSM.L["LIMIT"] = "LIMIT"
		TSM.L["Last 14 Days"] = "Last 14 Days"
		TSM.L["Last 3 Days"] = "Last 3 Days"
		TSM.L["Last 30 Days"] = "Last 30 Days"
		TSM.L["Last 60 Days"] = "Last 60 Days"
		TSM.L["Last 7 Days"] = "Last 7 Days"
		TSM.L["Last Data Update:"] = "Last Data Update:"
		TSM.L["Last Purchased"] = "Last Purchased"
		TSM.L["Last Sold"] = "Last Sold"
		TSM.L["Level Up"] = "Level Up"
		TSM.L["Link to Another Operation"] = "Link to Another Operation"
		TSM.L["List"] = "List"
		TSM.L["List materials in tooltip"] = "List materials in tooltip"
		TSM.L["Loading Mails..."] = "Loading Mails..."
		TSM.L["Loading..."] = "Loading..."
		TSM.L["Looks like TradeSkillMaster has encountered an error. Please help the author fix this error by following the instructions shown."] = "Looks like TradeSkillMaster has encountered an error. Please help the author fix this error by following the instructions shown."
		TSM.L["Loop detected in the following custom price:"] = "Loop detected in the following custom price:"
		TSM.L["Lowest auction by whitelisted player."] = "Lowest auction by whitelisted player."
		TSM.L["MAIL SELECTED GROUPS"] = "MAIL SELECTED GROUPS"
		TSM.L["MAX"] = "MAX"
		TSM.L["MAX EXPIRES TO BANK"] = "MAX EXPIRES TO BANK"
		TSM.L["MAXIMUM QUANTITY TO BUY:"] = "MAXIMUM QUANTITY TO BUY:"
		TSM.L["MINIMUM RARITY"] = "MINIMUM RARITY"
		TSM.L["MOVE"] = "MOVE"
		TSM.L["MOVE TO BAGS"] = "MOVE TO BAGS"
		TSM.L["MOVE TO BANK"] = "MOVE TO BANK"
		TSM.L["MOVING"] = "MOVING"
		TSM.L["Macro Setup"] = "Macro Setup"
		TSM.L["Macro created and scroll wheel bound!"] = "Macro created and scroll wheel bound!"
		TSM.L["Mail"] = "Mail"
		TSM.L["Mail Disenchantables"] = "Mail Disenchantables"
		TSM.L["Mail Disenchantables Max Quality"] = "Mail Disenchantables Max Quality"
		TSM.L["Mail to %s"] = "Mail to %s"
		TSM.L["Mailing"] = "Mailing"
		TSM.L["Mailing Options"] = "Mailing Options"
		TSM.L["Mailing all to %s."] = "Mailing all to %s."
		TSM.L["Mailing up to %d to %s."] = "Mailing up to %d to %s."
		TSM.L["Main Settings"] = "Main Settings"
		TSM.L["Make Cash On Delivery?"] = "Make Cash On Delivery?"
		TSM.L["Management Options"] = "Management Options"
		TSM.L["Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."] = "Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."
		TSM.L["Map Ping"] = "Map Ping"
		TSM.L["Market Value"] = "Market Value"
		TSM.L["Market Value Price Source"] = "Market Value Price Source"
		TSM.L["Market Value Source"] = "Market Value Source"
		TSM.L["Mat Cost"] = "Mat Cost"
		TSM.L["Mat Price"] = "Mat Price"
		TSM.L["Match stack size?"] = "Match stack size?"
		TSM.L["Match whitelisted players"] = "Match whitelisted players"
		TSM.L["Material Name"] = "Material Name"
		TSM.L["Materials"] = "Materials"
		TSM.L["Materials to Gather"] = "Materials to Gather"
		TSM.L["Max Buy Price"] = "Max Buy Price"
		TSM.L["Max Sell Price"] = "Max Sell Price"
		TSM.L["Max Shopping Price"] = "Max Shopping Price"
		TSM.L["Maximum Auction Price (Per Item)"] = "Maximum Auction Price (Per Item)"
		TSM.L["Maximum Destroy Value (Enter '0c' to disable)"] = "Maximum Destroy Value (Enter '0c' to disable)"
		TSM.L["Maximum Disenchant Quality"] = "Maximum Disenchant Quality"
		TSM.L["Maximum Market Value (Enter '0c' to disable)"] = "Maximum Market Value (Enter '0c' to disable)"
		TSM.L["Maximum amount already posted."] = "Maximum amount already posted."
		TSM.L["Maximum disenchant level:"] = "Maximum disenchant level:"
		TSM.L["Maximum disenchant search percentage:"] = "Maximum disenchant search percentage:"
		TSM.L["Maximum quantity:"] = "Maximum quantity:"
		TSM.L["Maximum restock quantity:"] = "Maximum restock quantity:"
		TSM.L["Mill Value"] = "Mill Value"
		TSM.L["Min"] = "Min"
		TSM.L["Min Buy Price"] = "Min Buy Price"
		TSM.L["Min Buyout"] = "Min Buyout"
		TSM.L["Min Sell Price"] = "Min Sell Price"
		TSM.L["Min/Normal/Max Prices"] = "Min/Normal/Max Prices"
		TSM.L["Minimum Days Old"] = "Minimum Days Old"
		TSM.L["Minimum disenchant level:"] = "Minimum disenchant level:"
		TSM.L["Minimum expires:"] = "Minimum expires:"
		TSM.L["Minimum profit:"] = "Minimum profit:"
		TSM.L["Minimum restock quantity:"] = "Minimum restock quantity:"
		TSM.L["Misplaced comma"] = "Misplaced comma"
		TSM.L["Missing Materials"] = "Missing Materials"
		TSM.L["Missing operator between sets of parenthesis"] = "Missing operator between sets of parenthesis"
		TSM.L["Modifiers:"] = "Modifiers:"
		TSM.L["Money Frame Open"] = "Money Frame Open"
		TSM.L["Money Transfer"] = "Money Transfer"
		TSM.L["Most Profitable Item:"] = "Most Profitable Item:"
		TSM.L["Move Quantity Settings"] = "Move Quantity Settings"
		TSM.L["Move already grouped items?"] = "Move already grouped items?"
		TSM.L["Moving"] = "Moving"
		TSM.L["Multiple Items"] = "Multiple Items"
		TSM.L["My Auctions"] = "My Auctions"
		TSM.L["My Auctions 'CANCEL' Button"] = "My Auctions 'CANCEL' Button"
		TSM.L["NEED MATS"] = "NEED MATS"
		TSM.L["NEWS AND INFORMATION"] = "NEWS AND INFORMATION"
		TSM.L["NO ITEMS"] = "NO ITEMS"
		TSM.L["NONGROUP TO BANK"] = "NONGROUP TO BANK"
		TSM.L["NOT OPEN"] = "NOT OPEN"
		TSM.L["NPC"] = "NPC"
		TSM.L["Neat Stacks only?"] = "Neat Stacks only?"
		TSM.L["New Group"] = "New Group"
		TSM.L["New Operation"] = "New Operation"
		TSM.L["No Attachments"] = "No Attachments"
		TSM.L["No Crafts"] = "No Crafts"
		TSM.L["No Data"] = "No Data"
		TSM.L["No Materials to Gather"] = "No Materials to Gather"
		TSM.L["No Operation Selected"] = "No Operation Selected"
		TSM.L["No Profession Opened"] = "No Profession Opened"
		TSM.L["No Profession Selected"] = "No Profession Selected"
		TSM.L["No Sound"] = "No Sound"
		TSM.L["No group selected"] = "No group selected"
		TSM.L["No item specified. Usage: /tsm restock_help [ITEM_LINK]"] = "No item specified. Usage: /tsm restock_help [ITEM_LINK]"
		TSM.L["No posting."] = "No posting."
		TSM.L["No profile specified. Possible profiles: '%s'"] = "No profile specified. Possible profiles: '%s'"
		TSM.L["No recent AuctionDB scan data found."] = "No recent AuctionDB scan data found."
		TSM.L["None"] = "None"
		TSM.L["None (Always Show)"] = "None (Always Show)"
		TSM.L["None Selected"] = "None Selected"
		TSM.L["Normal"] = "Normal"
		TSM.L["Not Connected"] = "Not Connected"
		TSM.L["Not Scanned"] = "Not Scanned"
		TSM.L["Not canceling auction at reset price."] = "Not canceling auction at reset price."
		TSM.L["Not canceling auction below min price."] = "Not canceling auction below min price."
		TSM.L["Not canceling."] = "Not canceling."
		TSM.L["Not enough items in bags."] = "Not enough items in bags."
		TSM.L["Number Owned"] = "Number Owned"
		TSM.L["OPEN"] = "OPEN"
		TSM.L["OPEN ALL MAIL"] = "OPEN ALL MAIL"
		TSM.L["Offline"] = "Offline"
		TSM.L["On Cooldown"] = "On Cooldown"
		TSM.L["Only show craftable"] = "Only show craftable"
		TSM.L["Only show items with disenchant value above custom price"] = "Only show items with disenchant value above custom price"
		TSM.L["Open Mail"] = "Open Mail"
		TSM.L["Open Mail Complete Sound"] = "Open Mail Complete Sound"
		TSM.L["Open Task List"] = "Open Task List"
		TSM.L["Operation"] = "Operation"
		TSM.L["Operations"] = "Operations"
		TSM.L["Other Character"] = "Other Character"
		TSM.L["Other Settings"] = "Other Settings"
		TSM.L["Other Shopping Searches"] = "Other Shopping Searches"
		TSM.L["Override default craft value method?"] = "Override default craft value method?"
		TSM.L["Override parent operations"] = "Override parent operations"
		TSM.L["POST"] = "POST"
		TSM.L["POST CAP TO BAGS"] = "POST CAP TO BAGS"
		TSM.L["POST SELECTED"] = "POST SELECTED"
		TSM.L["POSTAGE"] = "POSTAGE"
		TSM.L["PRICE SOURCE"] = "PRICE SOURCE"
		TSM.L["PROFESSION"] = "PROFESSION"
		TSM.L["PROFIT"] = "PROFIT"
		TSM.L["PURCHASE DATA"] = "PURCHASE DATA"
		TSM.L["Parent Items"] = "Parent Items"
		TSM.L["Past 7 Days"] = "Past 7 Days"
		TSM.L["Past Day"] = "Past Day"
		TSM.L["Past Month"] = "Past Month"
		TSM.L["Past Year"] = "Past Year"
		TSM.L["Paste string here"] = "Paste string here"
		TSM.L["Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."] = "Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."
		TSM.L["Per Item"] = "Per Item"
		TSM.L["Per Stack"] = "Per Stack"
		TSM.L["Per Unit"] = "Per Unit"
		TSM.L["Player Gold"] = "Player Gold"
		TSM.L["Player Invite Accept"] = "Player Invite Accept"
		TSM.L["Please select a group to export"] = "Please select a group to export"
		TSM.L["Post Scan"] = "Post Scan"
		TSM.L["Post at Maximum Price"] = "Post at Maximum Price"
		TSM.L["Post at Minimum Price"] = "Post at Minimum Price"
		TSM.L["Post at Normal Price"] = "Post at Normal Price"
		TSM.L["Postage"] = "Postage"
		TSM.L["Posted Auctions %s:"] = "Posted Auctions %s:"
		TSM.L["Posted at whitelisted player's price."] = "Posted at whitelisted player's price."
		TSM.L["Posting"] = "Posting"
		TSM.L["Posting %d / %d"] = "Posting %d / %d"
		TSM.L["Posting %d stack(s) of %d for %d hours."] = "Posting %d stack(s) of %d for %d hours."
		TSM.L["Posting Settings"] = "Posting Settings"
		TSM.L["Posting at normal price."] = "Posting at normal price."
		TSM.L["Posting at whitelisted player's price."] = "Posting at whitelisted player's price."
		TSM.L["Posting at your current price."] = "Posting at your current price."
		TSM.L["Posting disabled."] = "Posting disabled."
		TSM.L["Posts"] = "Posts"
		TSM.L["Potential"] = "Potential"
		TSM.L["Price Per Item"] = "Price Per Item"
		TSM.L["Price Settings"] = "Price Settings"
		TSM.L["Price Variables"] = "Price Variables"
		TSM.L["Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."] = "Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."
		TSM.L["Price source with name '%s' already exists."] = "Price source with name '%s' already exists."
		TSM.L["Profession Filters"] = "Profession Filters"
		TSM.L["Profession Info"] = "Profession Info"
		TSM.L["Profession loading..."] = "Profession loading..."
		TSM.L["Professions Used In"] = "Professions Used In"
		TSM.L["Profile changed to '%s'."] = "Profile changed to '%s'."
		TSM.L["Profiles"] = "Profiles"
		TSM.L["Profit"] = "Profit"
		TSM.L["Prospect Value"] = "Prospect Value"
		TSM.L["Purchased (Min/Avg/Max Price)"] = "Purchased (Min/Avg/Max Price)"
		TSM.L["Purchased (Total Price)"] = "Purchased (Total Price)"
		TSM.L["Purchases"] = "Purchases"
		TSM.L["Purchasing Auction"] = "Purchasing Auction"
		TSM.L["QUEUE"] = "QUEUE"
		TSM.L["Qty"] = "Qty"
		TSM.L["Quantity Bought:"] = "Quantity Bought:"
		TSM.L["Quantity Sold:"] = "Quantity Sold:"
		TSM.L["Quantity to move:"] = "Quantity to move:"
		TSM.L["Quest Added"] = "Quest Added"
		TSM.L["Quest Completed"] = "Quest Completed"
		TSM.L["Quest Objectives Complete"] = "Quest Objectives Complete"
		TSM.L["Quick Sell Options"] = "Quick Sell Options"
		TSM.L["Quickly mail all excess disenchantable items to a character"] = "Quickly mail all excess disenchantable items to a character"
		TSM.L["Quickly mail all excess gold (limited to a certain amount) to a character"] = "Quickly mail all excess gold (limited to a certain amount) to a character"
		TSM.L["RECIPIENT"] = "RECIPIENT"
		TSM.L["REMOVE %d |4ITEM:ITEMS;"] = "REMOVE %d |4ITEM:ITEMS;"
		TSM.L["REPAIR"] = "REPAIR"
		TSM.L["REPLY"] = "REPLY"
		TSM.L["REPORT SPAM"] = "REPORT SPAM"
		TSM.L["REQUIRED LEVEL RANGE"] = "REQUIRED LEVEL RANGE"
		TSM.L["RESCAN"] = "RESCAN"
		TSM.L["RESET"] = "RESET"
		TSM.L["RESTART"] = "RESTART"
		TSM.L["RESTOCK BAGS"] = "RESTOCK BAGS"
		TSM.L["RESTOCK SELECTED GROUPS"] = "RESTOCK SELECTED GROUPS"
		TSM.L["RESTORE BAGS"] = "RESTORE BAGS"
		TSM.L["RUN ADVANCED ITEM SEARCH"] = "RUN ADVANCED ITEM SEARCH"
		TSM.L["RUN CANCEL SCAN"] = "RUN CANCEL SCAN"
		TSM.L["RUN POST SCAN"] = "RUN POST SCAN"
		TSM.L["RUN SHOPPING SCAN"] = "RUN SHOPPING SCAN"
		TSM.L["Raid Warning"] = "Raid Warning"
		TSM.L["Read More"] = "Read More"
		TSM.L["Ready Check"] = "Ready Check"
		TSM.L["Ready to Cancel"] = "Ready to Cancel"
		TSM.L["Realm Data Tooltips"] = "Realm Data Tooltips"
		TSM.L["Recent Scans"] = "Recent Scans"
		TSM.L["Recent Searches"] = "Recent Searches"
		TSM.L["Recently Mailed"] = "Recently Mailed"
		TSM.L["Region Avg Daily Sold"] = "Region Avg Daily Sold"
		TSM.L["Region Data Tooltips"] = "Region Data Tooltips"
		TSM.L["Region Historical Price"] = "Region Historical Price"
		TSM.L["Region Market Value Avg"] = "Region Market Value Avg"
		TSM.L["Region Min Buyout Avg"] = "Region Min Buyout Avg"
		TSM.L["Region Sale Avg"] = "Region Sale Avg"
		TSM.L["Region Sale Rate"] = "Region Sale Rate"
		TSM.L["Reload"] = "Reload"
		TSM.L["Removed a total of %s old records."] = "Removed a total of %s old records."
		TSM.L["Rename"] = "Rename"
		TSM.L["Rename Profile"] = "Rename Profile"
		TSM.L["Repair Bill"] = "Repair Bill"
		TSM.L["Repost Higher Threshold"] = "Repost Higher Threshold"
		TSM.L["Required Level"] = "Required Level"
		TSM.L["Requires TSM Desktop Application"] = "Requires TSM Desktop Application"
		TSM.L["Resale"] = "Resale"
		TSM.L["Reset All"] = "Reset All"
		TSM.L["Reset Filters"] = "Reset Filters"
		TSM.L["Reset Profile Confirmation"] = "Reset Profile Confirmation"
		TSM.L["Restart Delay (minutes)"] = "Restart Delay (minutes)"
		TSM.L["Restock Quantity Settings"] = "Restock Quantity Settings"
		TSM.L["Restock Settings"] = "Restock Settings"
		TSM.L["Restock help for %s:"] = "Restock help for %s:"
		TSM.L["Restock quantity:"] = "Restock quantity:"
		TSM.L["Restock target to max quantity?"] = "Restock target to max quantity?"
		TSM.L["Restocking to %d."] = "Restocking to %d."
		TSM.L["Restocking to a max of %d (min of %d) with a min profit."] = "Restocking to a max of %d (min of %d) with a min profit."
		TSM.L["Restocking to a max of %d (min of %d) with no min profit."] = "Restocking to a max of %d (min of %d) with no min profit."
		TSM.L["Resume Scan"] = "Resume Scan"
		TSM.L["Retrying %d auction(s) which failed."] = "Retrying %d auction(s) which failed."
		TSM.L["Revenue"] = "Revenue"
		TSM.L["Round normal price"] = "Round normal price"
		TSM.L["Run Bid Sniper"] = "Run Bid Sniper"
		TSM.L["Run Buyout Sniper"] = "Run Buyout Sniper"
		TSM.L["Running Sniper Scan"] = "Running Sniper Scan"
		TSM.L["SALE DATA"] = "SALE DATA"
		TSM.L["SALES"] = "SALES"
		TSM.L["SCAN ALL"] = "SCAN ALL"
		TSM.L["SCANNING"] = "SCANNING"
		TSM.L["SELL ALL"] = "SELL ALL"
		TSM.L["SELL BOES"] = "SELL BOES"
		TSM.L["SELL GROUPS"] = "SELL GROUPS"
		TSM.L["SELL TRASH"] = "SELL TRASH"
		TSM.L["SEND DISENCHANTABLES"] = "SEND DISENCHANTABLES"
		TSM.L["SEND GOLD"] = "SEND GOLD"
		TSM.L["SEND MAIL"] = "SEND MAIL"
		TSM.L["SENDING"] = "SENDING"
		TSM.L["SENDING..."] = "SENDING..."
		TSM.L["SETUP ACCOUNT SYNC"] = "SETUP ACCOUNT SYNC"
		TSM.L["SHORTFALL TO BAGS"] = "SHORTFALL TO BAGS"
		TSM.L["SKIP"] = "SKIP"
		TSM.L["SOURCE %d"] = "SOURCE %d"
		TSM.L["SOURCES"] = "SOURCES"
		TSM.L["STOP"] = "STOP"
		TSM.L["SUBJECT"] = "SUBJECT"
		TSM.L["Sale"] = "Sale"
		TSM.L["Sale Rate"] = "Sale Rate"
		TSM.L["Sales"] = "Sales"
		TSM.L["Sales Summary"] = "Sales Summary"
		TSM.L["Scan Complete Sound"] = "Scan Complete Sound"
		TSM.L["Scan Paused"] = "Scan Paused"
		TSM.L["Scanning %d / %d (Page %d / %d)"] = "Scanning %d / %d (Page %d / %d)"
		TSM.L["Scroll wheel direction:"] = "Scroll wheel direction:"
		TSM.L["Search"] = "Search"
		TSM.L["Search Bags"] = "Search Bags"
		TSM.L["Search Groups"] = "Search Groups"
		TSM.L["Search Inbox"] = "Search Inbox"
		TSM.L["Search Operations"] = "Search Operations"
		TSM.L["Search Patterns"] = "Search Patterns"
		TSM.L["Search Usable Items Only?"] = "Search Usable Items Only?"
		TSM.L["Search Vendor"] = "Search Vendor"
		TSM.L["Select Action"] = "Select Action"
		TSM.L["Select All Groups"] = "Select All Groups"
		TSM.L["Select All Items"] = "Select All Items"
		TSM.L["Select Auction to Cancel"] = "Select Auction to Cancel"
		TSM.L["Select Duration"] = "Select Duration"
		TSM.L["Select Items to Add"] = "Select Items to Add"
		TSM.L["Select Items to Remove"] = "Select Items to Remove"
		TSM.L["Select Operation"] = "Select Operation"
		TSM.L["Select a Source"] = "Select a Source"
		TSM.L["Select crafter"] = "Select crafter"
		TSM.L["Select custom price sources to include in item tooltips"] = "Select custom price sources to include in item tooltips"
		TSM.L["Select professions"] = "Select professions"
		TSM.L["Select which accounting information to display in item tooltips."] = "Select which accounting information to display in item tooltips."
		TSM.L["Select which auctioning information to display in item tooltips."] = "Select which auctioning information to display in item tooltips."
		TSM.L["Select which crafting information to display in item tooltips."] = "Select which crafting information to display in item tooltips."
		TSM.L["Select which destroying information to display in item tooltips."] = "Select which destroying information to display in item tooltips."
		TSM.L["Select which shopping information to display in item tooltips."] = "Select which shopping information to display in item tooltips."
		TSM.L["Selected Groups"] = "Selected Groups"
		TSM.L["Selected Operations"] = "Selected Operations"
		TSM.L["Sell"] = "Sell"
		TSM.L["Sell Options"] = "Sell Options"
		TSM.L["Sell soulbound items?"] = "Sell soulbound items?"
		TSM.L["Sell to Vendor"] = "Sell to Vendor"
		TSM.L["Seller"] = "Seller"
		TSM.L["Selling soulbound items."] = "Selling soulbound items."
		TSM.L["Send"] = "Send"
		TSM.L["Send Excess Gold to Banker"] = "Send Excess Gold to Banker"
		TSM.L["Send Money"] = "Send Money"
		TSM.L["Send Profile"] = "Send Profile"
		TSM.L["Send grouped items individually"] = "Send grouped items individually"
		TSM.L["Sending %s individually to %s"] = "Sending %s individually to %s"
		TSM.L["Sending %s to %s"] = "Sending %s to %s"
		TSM.L["Sending %s to %s with a COD of %s"] = "Sending %s to %s with a COD of %s"
		TSM.L["Sending Settings"] = "Sending Settings"
		TSM.L["Sending your '%s' profile to %s. Please keep both characters online until this completes. This will take approximately: %s"] = "Sending your '%s' profile to %s. Please keep both characters online until this completes. This will take approximately: %s"
		TSM.L["Set Maximum Price:"] = "Set Maximum Price:"
		TSM.L["Set Minimum Price:"] = "Set Minimum Price:"
		TSM.L["Set Normal Price:"] = "Set Normal Price:"
		TSM.L["Set auction duration to:"] = "Set auction duration to:"
		TSM.L["Set bid as percentage of buyout:"] = "Set bid as percentage of buyout:"
		TSM.L["Set keep in bags quantity?"] = "Set keep in bags quantity?"
		TSM.L["Set keep in bank quantity?"] = "Set keep in bank quantity?"
		TSM.L["Set maximum quantity?"] = "Set maximum quantity?"
		TSM.L["Set minimum profit?"] = "Set minimum profit?"
		TSM.L["Set move quantity?"] = "Set move quantity?"
		TSM.L["Set post cap to:"] = "Set post cap to:"
		TSM.L["Set posted stack size to:"] = "Set posted stack size to:"
		TSM.L["Set stack size for bags?"] = "Set stack size for bags?"
		TSM.L["Setup"] = "Setup"
		TSM.L["Shards"] = "Shards"
		TSM.L["Shopping"] = "Shopping"
		TSM.L["Shopping 'BUYOUT' Button"] = "Shopping 'BUYOUT' Button"
		TSM.L["Shopping Tooltips"] = "Shopping Tooltips"
		TSM.L["Shopping for auctions including those above the max price."] = "Shopping for auctions including those above the max price."
		TSM.L["Shopping for auctions with a max price set."] = "Shopping for auctions with a max price set."
		TSM.L["Shopping for even stacks including those above the max price"] = "Shopping for even stacks including those above the max price"
		TSM.L["Shopping for even stacks with a max price set."] = "Shopping for even stacks with a max price set."
		TSM.L["Show Description"] = "Show Description"
		TSM.L["Show Destroying frame automatically"] = "Show Destroying frame automatically"
		TSM.L["Show auctions above max price?"] = "Show auctions above max price?"
		TSM.L["Show confirmation alert if buyout is above the alert price"] = "Show confirmation alert if buyout is above the alert price"
		TSM.L["Show material cost"] = "Show material cost"
		TSM.L["Show on Modifier"] = "Show on Modifier"
		TSM.L["Showing %d Mail"] = "Showing %d Mail"
		TSM.L["Showing %d of %d Mail"] = "Showing %d of %d Mail"
		TSM.L["Showing %d of %d Mails"] = "Showing %d of %d Mails"
		TSM.L["Showing all %d Mails"] = "Showing all %d Mails"
		TSM.L["Simple"] = "Simple"
		TSM.L["Skip Import confirmation?"] = "Skip Import confirmation?"
		TSM.L["Skipped: No assigned operation"] = "Skipped: No assigned operation"
		TSM.L["Slash Commands:"] = "Slash Commands:"
		TSM.L["Sniper"] = "Sniper"
		TSM.L["Sniper 'BUYOUT' Button"] = "Sniper 'BUYOUT' Button"
		TSM.L["Sniper Options"] = "Sniper Options"
		TSM.L["Sniper Settings"] = "Sniper Settings"
		TSM.L["Sniping items below a max price"] = "Sniping items below a max price"
		TSM.L["Sold"] = "Sold"
		TSM.L["Sold %d of %s to %s for %s"] = "Sold %d of %s to %s for %s"
		TSM.L["Sold %s worth of items."] = "Sold %s worth of items."
		TSM.L["Sold (Min/Avg/Max Price)"] = "Sold (Min/Avg/Max Price)"
		TSM.L["Sold (Total Price)"] = "Sold (Total Price)"
		TSM.L["Sold Auctions %s:"] = "Sold Auctions %s:"
		TSM.L["Sold [%s]x%d for %s to %s"] = "Sold [%s]x%d for %s to %s"
		TSM.L["Source"] = "Source"
		TSM.L["Sources"] = "Sources"
		TSM.L["Sources to include for restock:"] = "Sources to include for restock:"
		TSM.L["Stack"] = "Stack"
		TSM.L["Stack / Quantity"] = "Stack / Quantity"
		TSM.L["Stack size multiple:"] = "Stack size multiple:"
		TSM.L["Start either a 'Buyout' or 'Bid' sniper using the buttons above."] = "Start either a 'Buyout' or 'Bid' sniper using the buttons above."
		TSM.L["Starting Scan..."] = "Starting Scan..."
		TSM.L["Store operations globally"] = "Store operations globally"
		TSM.L["Subject"] = "Subject"
		TSM.L["Successfully sent your '%s' profile to %s!"] = "Successfully sent your '%s' profile to %s!"
		TSM.L["Switch to %s"] = "Switch to %s"
		TSM.L["Switch to WoW UI"] = "Switch to WoW UI"
		TSM.L["Sync Setup Error: The specified player on the other account is not currently online."] = "Sync Setup Error: The specified player on the other account is not currently online."
		TSM.L["Sync Setup Error: This character is already part of a known account."] = "Sync Setup Error: This character is already part of a known account."
		TSM.L["Sync Setup Error: You entered the name of the current character and not the character on the other account."] = "Sync Setup Error: You entered the name of the current character and not the character on the other account."
		TSM.L["Sync Status"] = "Sync Status"
		TSM.L["TAKE ALL"] = "TAKE ALL"
		TSM.L["TARGET SHORTFALL TO BAGS"] = "TARGET SHORTFALL TO BAGS"
		TSM.L["TIME FRAME"] = "TIME FRAME"
		TSM.L["TINKER"] = "TINKER"
		TSM.L["TSM Banking"] = "TSM Banking"
		TSM.L["TSM Crafting"] = "TSM Crafting"
		TSM.L["TSM Destroying"] = "TSM Destroying"
		TSM.L["TSM Mailing"] = "TSM Mailing"
		TSM.L["TSM TASK LIST"] = "TSM TASK LIST"
		TSM.L["TSM Vendoring"] = "TSM Vendoring"
		TSM.L["TSM Version Info:"] = "TSM Version Info:"
		TSM.L["TSM can sync data automatically between multiple accounts. Also, you can also send your currently active profile to connected accounts to quickly send your groups and operations to other accounts."] = "TSM can sync data automatically between multiple accounts. Also, you can also send your currently active profile to connected accounts to quickly send your groups and operations to other accounts."
		TSM.L["TSM doesn't currently have any AuctionDB pricing data for your realm. We recommend you download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update your AuctionDB data (and auto-backup your TSM settings)."] = "TSM doesn't currently have any AuctionDB pricing data for your realm. We recommend you download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update your AuctionDB data (and auto-backup your TSM settings)."
		TSM.L["TSM failed to scan some auctions. Please rerun the scan."] = "TSM failed to scan some auctions. Please rerun the scan."
		TSM.L["TSM is currently rebuilding its item cache which may cause FPS drops and result in TSM not being fully functional until this process is complete. This is normal and typically takes less than a minute."] = "TSM is currently rebuilding its item cache which may cause FPS drops and result in TSM not being fully functional until this process is complete. This is normal and typically takes less than a minute."
		TSM.L["TSM is missing important information from the TSM Desktop Application. Please ensure the TSM Desktop Application is running and is properly configured."] = "TSM is missing important information from the TSM Desktop Application. Please ensure the TSM Desktop Application is running and is properly configured."
		TSM.L["TSM4"] = "TSM4"
		TSM.L["TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"] = "TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"
		TSM.L["TUJ 14-Day Price"] = "TUJ 14-Day Price"
		TSM.L["TUJ 3-Day Price"] = "TUJ 3-Day Price"
		TSM.L["TUJ Global Mean"] = "TUJ Global Mean"
		TSM.L["TUJ Global Median"] = "TUJ Global Median"
		TSM.L["Take Attachments"] = "Take Attachments"
		TSM.L["Target Character"] = "Target Character"
		TSM.L["Tasks Added to Task List"] = "Tasks Added to Task List"
		TSM.L["Text (%s)"] = "Text (%s)"
		TSM.L["The 'Craft Value Method' (%s) did not return a value for this item."] = "The 'Craft Value Method' (%s) did not return a value for this item."
		TSM.L["The 'disenchant' price source has been replaced by the more general 'destroy' price source. Please update your custom prices."] = "The 'disenchant' price source has been replaced by the more general 'destroy' price source. Please update your custom prices."
		TSM.L["The TradeSkillMaster_AppHelper addon is installed, but not enabled. TSM has enabled it and requires a reload."] = "The TradeSkillMaster_AppHelper addon is installed, but not enabled. TSM has enabled it and requires a reload."
		TSM.L["The canlearn filter was ignored because the CanIMogIt addon was not found."] = "The canlearn filter was ignored because the CanIMogIt addon was not found."
		TSM.L["The min profit (%s) did not evalulate to a valid value for this item."] = "The min profit (%s) did not evalulate to a valid value for this item."
		TSM.L["The name can ONLY contain letters. No spaces, numbers, or special characters."] = "The name can ONLY contain letters. No spaces, numbers, or special characters."
		TSM.L["The number which would be queued (%d) is less than the min restock quantity (%d)."] = "The number which would be queued (%d) is less than the min restock quantity (%d)."
		TSM.L["The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."] = "The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."
		TSM.L["The player \"%s\" is already on your whitelist."] = "The player \"%s\" is already on your whitelist."
		TSM.L["The profit of this item (%s) is below the min profit (%s)."] = "The profit of this item (%s) is below the min profit (%s)."
		TSM.L["The seller name of the lowest auction for %s was not given by the server. Skipping this item."] = "The seller name of the lowest auction for %s was not given by the server. Skipping this item."
		TSM.L["The unlearned filter was ignored because the CanIMogIt addon was not found."] = "The unlearned filter was ignored because the CanIMogIt addon was not found."
		TSM.L["There is a crafting cost and crafted item value, but TSM wasn't able to calculate a profit. This shouldn't happen!"] = "There is a crafting cost and crafted item value, but TSM wasn't able to calculate a profit. This shouldn't happen!"
		TSM.L["There is no Crafting operation applied to this item's TSM group (%s)."] = "There is no Crafting operation applied to this item's TSM group (%s)."
		TSM.L["This is not a valid profile name. Profile names must be at least one character long and may not contain '@' characters."] = "This is not a valid profile name. Profile names must be at least one character long and may not contain '@' characters."
		TSM.L["This item does not have a crafting cost. Check that all of its mats have mat prices."] = "This item does not have a crafting cost. Check that all of its mats have mat prices."
		TSM.L["This item is not in a TSM group."] = "This item is not in a TSM group."
		TSM.L["This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general Crafting options."] = "This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general Crafting options."
		TSM.L["This looks like an exported operation and not a custom price."] = "This looks like an exported operation and not a custom price."
		TSM.L["This will copy the settings from '%s' into your currently-active one."] = "This will copy the settings from '%s' into your currently-active one."
		TSM.L["This will permanently delete the '%s' profile."] = "This will permanently delete the '%s' profile."
		TSM.L["This will reset all groups and operations (if not stored globally) to be wiped from this profile."] = "This will reset all groups and operations (if not stored globally) to be wiped from this profile."
		TSM.L["Time"] = "Time"
		TSM.L["Time Format"] = "Time Format"
		TSM.L["Time Frame"] = "Time Frame"
		TSM.L["Tooltip Price Format"] = "Tooltip Price Format"
		TSM.L["Tooltip Settings"] = "Tooltip Settings"
		TSM.L["Top Buyers:"] = "Top Buyers:"
		TSM.L["Top Item:"] = "Top Item:"
		TSM.L["Top Sellers:"] = "Top Sellers:"
		TSM.L["Total"] = "Total"
		TSM.L["Total Gold"] = "Total Gold"
		TSM.L["Total Gold Earned:"] = "Total Gold Earned:"
		TSM.L["Total Gold Spent:"] = "Total Gold Spent:"
		TSM.L["Total Price"] = "Total Price"
		TSM.L["Total Profit:"] = "Total Profit:"
		TSM.L["Total Value"] = "Total Value"
		TSM.L["Total Value of All Items"] = "Total Value of All Items"
		TSM.L["Track Sales / Purchases via trade"] = "Track Sales / Purchases via trade"
		TSM.L["TradeSkillMaster Info"] = "TradeSkillMaster Info"
		TSM.L["Transform Value"] = "Transform Value"
		TSM.L["Twitter Integration"] = "Twitter Integration"
		TSM.L["Twitter Integration Not Enabled"] = "Twitter Integration Not Enabled"
		TSM.L["Type"] = "Type"
		TSM.L["Type Something"] = "Type Something"
		TSM.L["UPDATE EXISTING MACRO"] = "UPDATE EXISTING MACRO"
		TSM.L["Unbalanced parentheses."] = "Unbalanced parentheses."
		TSM.L["Undercut amount:"] = "Undercut amount:"
		TSM.L["Undercut by whitelisted player."] = "Undercut by whitelisted player."
		TSM.L["Undercutting blacklisted player."] = "Undercutting blacklisted player."
		TSM.L["Undercutting competition."] = "Undercutting competition."
		TSM.L["Ungrouped Items"] = "Ungrouped Items"
		TSM.L["Unknown Item"] = "Unknown Item"
		TSM.L["Unwrap Gift"] = "Unwrap Gift"
		TSM.L["Up"] = "Up"
		TSM.L["Up to date"] = "Up to date"
		TSM.L["Updating"] = "Updating"
		TSM.L["Usage: /tsm price <ItemLink> <Price String>"] = "Usage: /tsm price <ItemLink> <Price String>"
		TSM.L["Use smart average for purchase price"] = "Use smart average for purchase price"
		TSM.L["Use the field below to search the auction house by filter"] = "Use the field below to search the auction house by filter"
		TSM.L["Use the list to the left to select groups, & operations you'd like to create export strings for."] = "Use the list to the left to select groups, & operations you'd like to create export strings for."
		TSM.L["VALUE PRICE SOURCE"] = "VALUE PRICE SOURCE"
		TSM.L["VENDOR SEARCH"] = "VENDOR SEARCH"
		TSM.L["ValueSources"] = "ValueSources"
		TSM.L["Variable Name"] = "Variable Name"
		TSM.L["Vendor"] = "Vendor"
		TSM.L["Vendor Buy Price"] = "Vendor Buy Price"
		TSM.L["Vendor Search"] = "Vendor Search"
		TSM.L["Vendor Sell"] = "Vendor Sell"
		TSM.L["Vendor Sell Price"] = "Vendor Sell Price"
		TSM.L["Vendoring 'SELL ALL' Button"] = "Vendoring 'SELL ALL' Button"
		TSM.L["View ignored items in the Destroying options."] = "View ignored items in the Destroying options."
		TSM.L["WARNING: The macro was too long, so was truncated to fit by WoW."] = "WARNING: The macro was too long, so was truncated to fit by WoW."
		TSM.L["WARNING: You minimum price for %s is below its vendorsell price (with AH cut taken into account). Consider raising your minimum price, or vendoring the item."] = "WARNING: You minimum price for %s is below its vendorsell price (with AH cut taken into account). Consider raising your minimum price, or vendoring the item."
		TSM.L["Warehousing"] = "Warehousing"
		TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."
		TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
		TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."
		TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."
		TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."
		TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
		TSM.L["Warehousing will move a max of %d of each item in this group."] = "Warehousing will move a max of %d of each item in this group."
		TSM.L["Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."
		TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."
		TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
		TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."
		TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."
		TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."
		TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
		TSM.L["Warehousing will move all of the items in this group."] = "Warehousing will move all of the items in this group."
		TSM.L["Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."
		TSM.L["Welcome to TSM4! All of the old TSM3 modules (i.e. Crafting, Shopping, etc) are now built-in to the main TSM addon, so you only need TSM and TSM_AppHelper installed. TSM has disabled the old modules and requires a reload."] = "Welcome to TSM4! All of the old TSM3 modules (i.e. Crafting, Shopping, etc) are now built-in to the main TSM addon, so you only need TSM and TSM_AppHelper installed. TSM has disabled the old modules and requires a reload."
		TSM.L["When above maximum:"] = "When above maximum:"
		TSM.L["When below minimum:"] = "When below minimum:"
		TSM.L["Whitelist"] = "Whitelist"
		TSM.L["Whitelisted Players"] = "Whitelisted Players"
		TSM.L["You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"] = "You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"
		TSM.L["You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."] = "You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."
		TSM.L["You cannot use %s as part of this custom price."] = "You cannot use %s as part of this custom price."
		TSM.L["You cannot use %s within convert() as part of this custom price."] = "You cannot use %s within convert() as part of this custom price."
		TSM.L["You do not need to add \"%s\", alts are whitelisted automatically."] = "You do not need to add \"%s\", alts are whitelisted automatically."
		TSM.L["You don't know how to craft this item."] = "You don't know how to craft this item."
		TSM.L["You must reload your UI for these settings to take effect. Reload now?"] = "You must reload your UI for these settings to take effect. Reload now?"
		TSM.L["You won an auction for %sx%d for %s"] = "You won an auction for %sx%d for %s"
		TSM.L["You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."] = "You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."
		TSM.L["You've been undercut."] = "You've been undercut."
		TSM.L["Your Buyout"] = "Your Buyout"
		TSM.L["Your auction has not been undercut."] = "Your auction has not been undercut."
		TSM.L["Your auction of %s expired"] = "Your auction of %s expired"
		TSM.L["Your auction of %s has sold for %s!"] = "Your auction of %s has sold for %s!"
		TSM.L["Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"] = "Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"
		TSM.L["Your default craft value method was invalid so it has been returned to the default. Details: %s"] = "Your default craft value method was invalid so it has been returned to the default. Details: %s"
		TSM.L["Your task list is currently empty."] = "Your task list is currently empty."
		TSM.L["ilvl"] = "ilvl"
		TSM.L["of"] = "of"
		TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."] = "|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."
		TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."] = "|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."
		TSM.L["|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."] = "|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."
		TSM.L["|cffffd839Left-Click|r to ignore an item this session."] = "|cffffd839Left-Click|r to ignore an item this session."
		TSM.L["|cffffd839Shift-Left-Click|r to ignore it permanently."] = "|cffffd839Shift-Left-Click|r to ignore it permanently."
	elseif locale == "deDE" then
TSM.L = TSM.L or {}
TSM.L["%d |4Group:Groups; Selected (%d |4Item:Items;)"] = "%d |4Gruppe:Gruppen; Ausgewählt(%d |4Item:Items;)"
TSM.L["%d auctions"] = "%d Auktionen"
TSM.L["%d Groups"] = "%d Gruppen"
TSM.L["%d Items"] = "%d Items"
TSM.L["%d of %d"] = "%d von %d"
TSM.L["%d Operations"] = "%d Operationen"
TSM.L["%d Posted Auctions"] = "%d gelistete Auktionen"
TSM.L["%d Sold Auctions"] = "%d verkaufte Auktionen"
TSM.L["%s (%s bags, %s bank, %s AH, %s mail)"] = "%s (%s Taschen, %s Bank, %s AH, %s Post)"
TSM.L["%s (%s player, %s alts, %s guild, %s AH)"] = "%s (%s Spieler, %s Twinks, %s Gilde, %s AH)"
TSM.L["%s (%s profit)"] = "%s (%s Gewinn)"
TSM.L["%s ago"] = "%s vergangen"
TSM.L["%s Crafts"] = "%s hergestellt"
TSM.L["%s in guild vault"] = "%s im Gildentresor"
TSM.L["%s is a valid custom price but %s is an invalid item."] = "%s ist ein gültiger benutzerdefinierter Preis, aber %s ist ein ungültiges Item."
TSM.L["%s is a valid custom price but did not give a value for %s."] = "%s ist ein gültiger benutzerdefinierter Preis, ergibt aber keinen Wert für %s."
TSM.L["'%s' is an invalid operation! Min restock of %d is higher than max restock of %d."] = "'%s' ist eine ungültige Operation! Die min Auffüllmenge von %d ist höher als die max Auffüllmenge von %d. "
TSM.L["%s is not a valid custom price and gave the following error: %s"] = "%s ist kein gültiger benutzerdefinierter Preis und ergab den folgenden Fehler: %s"
TSM.L["%s operation(s)"] = "%s Operation(en)"
TSM.L["%s removed."] = "%s entfernt."
TSM.L["%s sent you %s"] = "%s sendet dir %s"
TSM.L["%s sent you %s and %s"] = "%s sendet dir %s und %s"
TSM.L["%s sent you a COD of %s for %s"] = "%s hat dir Geld per Nachnahme in Höhe von %s für %s gesendet"
TSM.L["%s sent you a message: %s"] = "%s hat dir eine Nachricht gesendet: %s"
TSM.L["%s total"] = "%s Gesamt"
TSM.L["%sDrag%s to move this button"] = "%sZiehen%s, um diesen Button zu verschieben"
TSM.L["%sLeft-Click%s to open the main window"] = "%sLinksklick%s, um das Hauptfenster zu öffnen"
TSM.L["(%d/500 Characters)"] = "(%d/500 Zeichen)"
TSM.L["(max %d)"] = "(max %d)"
TSM.L["(max 200)"] = "(max 200)"
TSM.L["(max 5000)"] = "(max 5000)"
TSM.L["(min %d - max %d)"] = "(min %d - max %d)"
TSM.L["(min 0 - max 10000)"] = "(min 0 - max 10000)"
TSM.L["(minimum 0 - maximum 2)"] = "(minimum 0 - maximum 2)"
TSM.L["(minimum 0 - maximum 20)"] = "(minimum 0 - maximum 20) "
TSM.L["(minimum 0 - maximum 2000)"] = "(minimum 0 - maximum 2000) "
TSM.L["(minimum 0 - maximum 30)"] = "(minimum 0 - maximum 30) "
TSM.L["(minimum 0 - maximum 905)"] = "(minimum 0 - maximum 905) "
TSM.L["(minimum 0% - maximum 50%)"] = "(minimum 0% - maximum 50%) "
TSM.L["(minimum 0.5 - maximum 10)"] = "(minimum 0.5 - maximum 10) "
TSM.L["(minimum 1 - maximum 100)"] = "(minimum 1 - maximum 100) "
TSM.L["(minimum 8 - maximum 25)"] = "(minimum 8 - maximum 25) "
TSM.L["(New group(s) will be created)"] = "(Neue Gruppe(n) wird/werden erstellt)"
TSM.L["/tsm help|r - Shows this help listing"] = "/tsm help|r - Zeigt diese Hilfeliste an"
TSM.L["/tsm|r - opens the main TSM window."] = "/tsm|r - Öffnet das TSM-Hauptfenster."
TSM.L["_ Hr _ Min ago"] = "_ St _ Min vergangen"
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."] = "|cffff0000WICHTIG:|r Beim letzten Versuch von TSM_Accounting die Daten für diesen Server zu speichern, waren diese zu umfangreich für, woraufhin alte Datenteile automatisch verworfen wurden, um andere zu speichernde Variablen vor Beschädigung zu schützen. Die letzten %s der Einkaufsdaten wurden gerettet."
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."] = "|cffff0000WICHTIG:|r Beim letzten Versuch von TSM_Accounting die Daten für diesen Server zu speichern, waren diese zu umfangreich, woraufhin alte Datenteile automatisch verworfen wurden, um andere zu speichernde Variablen vor Beschädigung zu schützen. Die letzten %s der Verkaufsdaten wurden gerettet."
TSM.L["|cffff0000WARNING:|r TSM_AuctionDB doesn't currently have any pricing data for your realm. Either download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update TSM_AuctionDB's data, or run a manual scan in-game."] = "|cffff0000WARNUNG:|r TSM_AuctionDB hat aktuell keine Preisdaten für deinen Realm. Entweder lade die TSM Desktop App auf |cff99ffffhttp://tradeskillmaster.com|r herunter, um automatische Aktualisierungen der Preisdaten zu bekommen, oder führe einen manuellen Scan im Spiel durch."
TSM.L["|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."] = "|cffffd839Links-Klick|r um ein Item für diese Sitzung auszuschließen. Halte |cffffd839Shift|r um es dauerhaft auszuschließen. Du kannst Items von der dauerhaften Ausschließung in den Verkaufs Einstellungen entfernen."
TSM.L["|cffffd839Left-Click|r to ignore an item this session."] = "|cffffd839Links-Klick|r um ein Item für diese Sitzung auszuschließen."
TSM.L["|cffffd839Shift-Left-Click|r to ignore it permanently."] = "|cffffd839Shift-Links_Klick|r zum dauerhaften ignorieren."
TSM.L["1 Group"] = "1 Gruppe"
TSM.L["1 Item"] = "1 Item"
TSM.L["12 hr"] = "12 Std"
TSM.L["24 hr"] = "24 Std"
TSM.L["48 hr"] = "48 Std"
TSM.L["A custom price of %s for %s evaluates to %s."] = "Ein benutzerdefinierter Preis von %s für %s ergibt %s."
TSM.L["A maximum of 1 convert() function is allowed."] = "Es ist maximal 1 convert() Funktion erlaubt."
TSM.L["A scan is already in progress. Please stop that scan before starting another one."] = "Es wird bereits eine Suche durchgeführt. Bitte stoppe zunächst die Suche, bevor du eine neue Suche startest."
TSM.L["Above max expires."] = "Über max Abläufe."
TSM.L["Above max price. Not posting."] = "Oberhalb des Maximalpreises. Wird nicht eingestellt."
TSM.L["Above max price. Posting at max price."] = "Oberhalb des Maximalpreises. Wird mit Maximalpreis eingestellt. "
TSM.L["Above max price. Posting at min price."] = "Oberhalb des Maximalpreises. Wird mit Minimalpreis eingestellt. "
TSM.L["Above max price. Posting at normal price."] = "Oberhalb des Maximalpreises. Wird mit Normalpreis eingestellt."
TSM.L["Accepting these item(s) will cost"] = "Der Kauf dieser Items kostet"
TSM.L["Accepting this item will cost"] = "Der Kauf dieses Items kostet"
TSM.L["Account sync removed. Please delete the account sync from the other account as well."] = "Account sync entfernt. Bitte den Account sync auf dem anderen Account ebenfalls entfernen."
TSM.L["Account Syncing"] = "Account-Sync"
TSM.L["Accounting"] = "Buchführung"
TSM.L["Accounting Tooltips"] = "Buchführungs Tooltips"
TSM.L["Activity Type"] = "Aktivitätsart"
TSM.L["ADD %d ITEMS"] = "FÜGE %d ITEMS HINZU"
TSM.L["Add / Remove Items"] = "Items hinzufügen / entfernen"
TSM.L["ADD NEW CUSTOM PRICE SOURCE"] = "FÜGE EINE NEUE EIGENE PREISQUELLE HINZU"
TSM.L["ADD OPERATION"] = "OPERATION HINZUFÜGEN"
TSM.L["Add Player"] = "Spieler hinzufügen"
TSM.L["Add Subject / Description"] = "Füge eine(n) Betreff / Beschreibung hinzu"
TSM.L["Add Subject / Description (Optional)"] = "Füge eine(n) Betreff / Beschreibung hinzu (Optional)"
TSM.L["ADD TO MAIL"] = "ZUR POST HINZUFÜGEN"
TSM.L["Additional error suppressed"] = "Zusätzlicher Fehler unterdrückt"
TSM.L["Adjust the settings below to set how groups attached to this operation will be auctioned."] = "Passe die folgenden Einstellungen an um zu steuern wie Gruppen, welche dieser Operation zugeordnet sind, gelistet werden."
TSM.L["Adjust the settings below to set how groups attached to this operation will be cancelled."] = "Passe die folgenden Einstellungen an um zu steuern wie Gruppen, welche dieser Operation zugeordnet sind, abgebrochen werden."
TSM.L["Adjust the settings below to set how groups attached to this operation will be priced."] = "Passe die folgenden Einstellungen an um zu steuern wie Gruppen, welche dieser Operation zugeordnet sind, eingepreist werden."
TSM.L["Advanced Item Search"] = "Erweiterte Itemsuche"
TSM.L["Advanced Options"] = "Erweiterte Optionen"
TSM.L["AH"] = "AH"
TSM.L["AH (Crafting)"] = "AH (Herstellen)"
TSM.L["AH (Disenchanting)"] = "AH (Entzaubern)"
TSM.L["AH BUSY"] = "AH BESCHÄFTIGT"
TSM.L["AH Frame Options"] = "AH Fenster Optionen"
TSM.L["AH Rows Shown (requires reload)"] = "AH Reihen anzeigen (Neu laden erforderlich)"
TSM.L["Alarm Clock"] = "Wecker"
TSM.L["All Auctions"] = "Alle Auktionen"
TSM.L["All Characters and Guilds"] = "Alle Charaktere und Gilden"
TSM.L["All Professions"] = "Alle Berufe"
TSM.L["Allow partial stack?"] = "Teilstapel zulassen?"
TSM.L["Alt Guild Bank"] = "Twink Gildenbank"
TSM.L["Alts"] = "Twinks"
TSM.L["Alts AH"] = "Twinks AH"
TSM.L["Amount"] = "Betrag"
TSM.L["AMOUNT"] = "BETRAG"
TSM.L["Amount of Bag Space to Keep Free"] = "Anzahl der Taschenplätze die frei bleiben sollen"
TSM.L["Applied %s to %s."] = "%s auf %s angewendet."
TSM.L["APPLY FILTERS"] = "FILTER ANWENDEN"
TSM.L["Apply operation to group:"] = "Operation auf Gruppe anwenden:"
TSM.L["Are you sure you want to clear old accounting data?"] = "Bist du sicher, dass du alle Buchhaltungsdaten löschen möchtest?"
TSM.L["Are you sure you want to delete this group?"] = "Willst du diese Gruppe wirklich löschen?"
TSM.L["Are you sure you want to delete this operation?"] = "Willst du diese Operation wirklich löschen?"
TSM.L["Are you sure you want to reset all operation settings?"] = "Bist du sicher, dass du alle Operationseinstellungen zurücksetzen möchtest?"
TSM.L["At above max price and not undercut."] = "Zum max Preis aber nicht unterbieten."
TSM.L["At normal price and not undercut."] = "Zum normal Preis und nicht unterbieten"
TSM.L["Auction"] = "Auktion"
TSM.L["AUCTION DETAILS"] = "Auktionsdetails "
TSM.L["Auction Duration"] = "Auktionsdauer"
TSM.L["Auction has been bid on."] = "Auf die Auktion wurde geboten."
TSM.L["Auction Window Close"] = "Auktionsfenster schließen"
TSM.L["Auction Window Open"] = "Auktionsfenster öffnen"
TSM.L["Auctionator - Auction Value"] = "Auctionator - Auktionswert"
TSM.L["Auctioneer - Appraiser"] = "Auctioneer - Appraiser"
TSM.L["Auctioneer - Market Value"] = "Auctioneer - Marktwert"
TSM.L["Auctioneer - Minimum Buyout"] = "Auctioneer - Mindestsofortkauf"
TSM.L["Auctioning"] = "Auktionen"
TSM.L["Auctioning Log"] = "Auktionsprotokoll"
TSM.L["Auctioning Operation"] = "Auktions Operation"
TSM.L["Auctioning 'POST'/'CANCEL' Button"] = "Auktions 'EINSTELLEN'/'ABBRECHEN' Button"
TSM.L["Auctions"] = "Auktionen"
TSM.L["Auto Quest Complete"] = "Auto-Quest abgeschlossen"
TSM.L["Automatically sell vendor trash?"] = "Trash automatisch beim Händler verkaufen?"
TSM.L["Average Earned Per Day:"] = "Durchschnittlich verdient pro Tag:"
TSM.L["Average Prices:"] = "Durschnittspreise:"
TSM.L["Average Profit Per Day:"] = "Durchschnittlicher Gewinn pro Tag:"
TSM.L["Average Spent Per Day:"] = "Durchschnittliche Ausgaben pro Tag:"
TSM.L["Avg Buy Price"] = "Ø Kaufpreis"
TSM.L["Avg Resale Profit"] = "Ø Wiederverkaufsgewinn"
TSM.L["Avg Sell Price"] = "Ø Verkaufspreis"
TSM.L["BACK TO LIST"] = "ZURÜCK ZUR LISTE"
TSM.L["Back to List"] = "Zurück zur Liste"
TSM.L["Bag"] = "Tasche"
TSM.L["Bags"] = "Taschen"
TSM.L["Banks"] = "Banken"
TSM.L["BankUI Move Delay"] = "BankUI-Verschiebungsverzögerung"
TSM.L["Base Group"] = "Basis Gruppe"
TSM.L["Base Item"] = "Basis Item"
TSM.L["Batch size"] = "Stapelgröße"
TSM.L["Below are your currently available price sources organized by module. The %skey|r is what you would type into a custom price box."] = "Deine aktuell verfügbaren Preisquellen, sortiert nach Modul. Das %sSchlüsselwort|r benutzt man in der Regel in einem benutzerdefinierten Preisfeld."
TSM.L["Below custom price:"] = "Unter Eigenen Preis:"
TSM.L["Below min price. Posting at max price."] = "Unter min Preis. Einstellen zum max Preis."
TSM.L["Below min price. Posting at min price."] = "Unter min Preis. Einstellen zum min Preis."
TSM.L["Below min price. Posting at normal price."] = "Unter min Preis. Einstellen zum normalen Preis."
TSM.L["Below, you can manage your profiles which allow you to have entirely different sets of groups."] = "Nachfolgend kannst du deine Profile verwalten, die es dir ermöglichen, ganz unterschiedliche Gruppen zu bilden."
TSM.L["Bid %d / %d"] = "Bieten %d / %d"
TSM.L["Bid (item)"] = "Bieten (Item)"
TSM.L["Bid (stack)"] = "Bieten (Stapel)"
TSM.L["Bid Price"] = "Gebotspreis"
TSM.L["Bid Sniper Paused"] = "Gebots Sniper pausieren"
TSM.L["Bid Sniper Running"] = "Gebots Sniper läuft"
TSM.L["Blacklisted players:"] = "Ignorierte Spieler:"
TSM.L["Bought"] = "Gekauft"
TSM.L["Bought %sx%d for %s from %s"] = "%sx%d gekauft für %s von %s"
TSM.L["Bound Actions"] = "Gebundene Aktionen"
TSM.L["BUSY"] = "BESCHÄFTIGT"
TSM.L["BUY"] = "KAUFE"
TSM.L["Buy"] = "Kaufe"
TSM.L["Buy %d / %d"] = "Kaufe %d / %d"
TSM.L["Buy %d / %d (Confirming %d / %d)"] = "Kaufe %d / %d (Bestätigt %d / %d)"
TSM.L["Buy from AH"] = "Aus AH kaufen"
TSM.L["Buy from Vendor"] = "Vom Händler kaufen"
TSM.L["BUY GROUPS"] = "KAUF GRUPPEN"
TSM.L["Buy Options"] = "Kaufoptionen"
TSM.L["BUYBACK ALL"] = "ALLES ZURÜCK KAUFEN"
TSM.L["Buyer/Seller"] = "Käufer/Verkäufer"
TSM.L["Buyout (item)"] = "Sofortkaufpreis (Item)"
TSM.L["Buyout (stack)"] = "Sofortkaufpreis (Stapel)"
TSM.L["Buyout Price"] = "Sofortkauf"
TSM.L["Buyout Sniper Paused"] = "Sofortkauf Sniper pausiert"
TSM.L["Buyout Sniper Running"] = "Sofortkauf Sniper läuft"
TSM.L["BUYS"] = "KÄUFE"
TSM.L["By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."] = "Standardmäßig beinhaltet diese Gruppe alle keiner Gruppe zugewiesenen Items. Du kannst diese Gruppe nicht modifizieren oder löschen."
TSM.L["Can Craft At Least One, Profit, Craftable Quantity"] = "Kann mindestens eins herstellen, Gewinn, herstellbare Anzahl"
TSM.L["Cancel auctions with bids"] = "Breche Auktionen mit Gebot ab"
TSM.L["Cancel Scan"] = "Scan abbrechen"
TSM.L["Cancel to repost higher?"] = "Abbrechen um erhöht einzustellen?"
TSM.L["Cancel undercut auctions?"] = "Unterbotene Auktionen abbrechen?"
TSM.L["Canceling"] = "Abbrechen"
TSM.L["Canceling %d / %d"] = "Abbrechen %d / %d"
TSM.L["Canceling %d Auctions..."] = "Breche %d Auktionen ab..."
TSM.L["Canceling all auctions."] = "Alle Auktionen abbrechen."
TSM.L["Canceling auction which you've undercut."] = "Breche Auktionen ab, bei denen du unterboten wurdest."
TSM.L["Canceling disabled."] = "Abbrechen deaktiviert."
TSM.L["Canceling Settings"] = "Abbruchseinstellungen"
TSM.L["Canceling to repost at higher price."] = "Abbrechen, um zu einem höheren Preis wieder einzustellen."
TSM.L["Canceling to repost at reset price."] = "Abbrechen, um zum Reset-Preis wieder einzustellen."
TSM.L["Canceling to repost higher."] = "Abbrechen, um höher wieder einzustellen."
TSM.L["Canceling undercut auctions and to repost higher."] = "Breche unterbotene Auktionen ab um sie zu einem höheren Preis zu listen. "
TSM.L["Canceling undercut auctions."] = "Unterbotene Auktionen abbrechen."
TSM.L["Cancelled"] = "Abgebrochen"
TSM.L["Cancelled auction of %sx%d"] = "Auktion von %sx%d abgebrochen"
TSM.L["Cancelled Since Last Sale"] = "Abgebrochen seit letztem Verkauf"
TSM.L["CANCELS"] = "ABBRECHEN"
TSM.L["Cannot repair from the guild bank!"] = "Kann nicht aus der Gildenbank repariert werden!"
TSM.L["Can't load TSM tooltip while in combat"] = "TSM-Tooltip kann während eines Kampfes nicht geladen werden"
TSM.L["Cash Register"] = "Registrierkasse"
TSM.L["Character"] = "Charakter"
TSM.L["CHARACTER"] = "CHARAKTER"
TSM.L["Character Bags"] = "Charakter Inventar"
TSM.L["Character Bank"] = "Charakter Bank"
TSM.L["CHARACTERS"] = "ZEICHEN"
TSM.L["Chat Tab"] = "Chat-Tab"
TSM.L["Cheapest auction below min price."] = "Billigste Auktion unter Minimalpreis. "
TSM.L["Clean Automatically"] = "Automatisch säubern "
TSM.L["Clear"] = "Zurücksetzen"
TSM.L["Clear All"] = "Alles zurücksetzen"
TSM.L["CLEAR DATA"] = "DATEN LÖSCHEN"
TSM.L["Clear Filters"] = "Filter zurücksetzen"
TSM.L["Clear Log After 'X' Amount of Days"] = "Log leeren nach 'X' Anzahl an Tagen"
TSM.L["Clear Old Data"] = "Alte Daten löschen"
TSM.L["Clear Old Data Confirmation"] = "Löschen alter Daten bestätigen"
TSM.L["Clear Queue"] = "Warteschlange löschen"
TSM.L["Clear Selection"] = "Auswahl aufheben"
TSM.L["COD"] = "Nachnahme"
TSM.L["Coins (%s)"] = "Münzen (%s)"
TSM.L["Combine Partial Stacks"] = "Geteilte Bündel verbinden"
TSM.L["Combining..."] = "Kombinieren..."
TSM.L["Configuration Scroll Wheel"] = "Mausrad Konfiguration"
TSM.L["Confirm"] = "Bestätigen"
TSM.L["Confirm Complete Sound"] = "Bestätige Fertig Ton"
TSM.L["Confirming %d / %d"] = "Bestätigen %d / %d"
TSM.L["Connected to %s"] = "Verbunden mit %s ß"
TSM.L["Connecting to %s"] = "Verbinde zu %s"
TSM.L["CONTACTS"] = "KONTAKTE"
TSM.L["Contacts Menu"] = "Kontaktmenü"
TSM.L["Cooldown"] = "Cooldown"
TSM.L["Cooldowns"] = "Cooldowns"
TSM.L["Cost"] = "Kosten"
TSM.L["Could not apply %s operation %s to %s - it has too many operations already."] = "Die Operation %s konnte nicht auf %s angewendet werden - sie hat bereits zu viele Operationen."
TSM.L["Could not apply %s operation to group %s because the group does not exist"] = "Konnte Operation %s nicht Gruppe %s zuweisen, da die Gruppe nicht existiert "
TSM.L["Could not create macro as you already have too many. Delete one of your existing macros and try again."] = "Konnte das Makro nicht erstellen, weil du schon zu viele Makros hast. Lösche eines deiner bestehenden Makros und versuche es nochmal."
TSM.L["Could not deserialize input"] = "Die Eingabe konnte nicht ausgelesen werden."
TSM.L["Could not find enchanted item from"] = "Der verzauberte Gegenstand konnte nicht gefunden werden von"
TSM.L["Could not find pet"] = "Pet konnte nicht gefunden werden"
TSM.L["Could not find profile '%s'. Possible profiles: '%s'"] = "Profil '%s' konnte nicht gefunden werden. Mögliche Profile: '%s'"
TSM.L["Could not sell items due to not having free bag space available to split a stack of items."] = "Konnte keine Artikel verkaufen, da kein freier Taschenplatz zur Verfügung stand, um den Stapel der Artikel zu splitten."
TSM.L["Craft"] = "Herstellen"
TSM.L["CRAFT"] = "HERSTELLEN"
TSM.L["Craft (Unprofitable)"] = "Herstellen (unprofitabel)"
TSM.L["Craft (When Profitable)"] = "Herstellen (wenn profitabel)"
TSM.L["Craft All"] = "Alle herstellen"
TSM.L["CRAFT ALL"] = "ALLE HERSTELLEN"
TSM.L["Craft Name"] = "Handwerksname"
TSM.L["CRAFT NEXT"] = "NÄCHSTES HERSTELLEN"
TSM.L["Craft value method:"] = "Handwerkswert-Methode:"
TSM.L["Craftable Quantity, Profit"] = "Herstellbare Menge, Gewinn"
TSM.L["CRAFTER"] = "HERSTELLER"
TSM.L["CRAFTING"] = "HERSTELLEN"
TSM.L["Crafting"] = "Herstellen"
TSM.L["Crafting Cost"] = "Herstellungskosten"
TSM.L["Crafting 'CRAFT NEXT' Button"] = "Erstellt die Schaltfläche 'CRAFT NEXT'."
TSM.L["Crafting Queue"] = "Herstellungswarteschlange"
TSM.L["Crafting Tooltips"] = "Herstellungs-Tooltips"
TSM.L["Crafts"] = "Handwerk"
TSM.L["Crafts %d"] = "Berufe %d"
TSM.L["CREATE MACRO"] = "Makro erstellen"
TSM.L["Create New Operation"] = "Neue Operation erstellen"
TSM.L["CREATE NEW PROFILE"] = "NEUES PROFIL ERSTELLEN"
TSM.L["Crystals"] = "Kristalle"
TSM.L["Current Profiles"] = "Aktuelle Profile"
TSM.L["CURRENT SEARCH"] = "AKTUELLE SUCHE"
TSM.L["CUSTOM POST"] = "BENUTZERDEFINIERTE VERÖFFENTLICHUNG"
TSM.L["Custom Price"] = "Benutzerdefinierter Preis"
TSM.L["Custom Price Source"] = "Benutzerdefinierte Preisquelle"
TSM.L["Custom Sources"] = "Benutzerdefinierte Quellen"
TSM.L["Database Sources"] = "Datenbank Quellen"
TSM.L["DD/MM/YY HH:MM"] = "DD/MM/YY HH:MM"
TSM.L["Default Craft Value Method:"] = "Standard Handwerkswertmethode:"
TSM.L["Default Material Cost Method:"] = "Standard-Materialkostenverfahren:"
TSM.L["Default Price"] = "Standardpreis"
TSM.L["Default Price Configuration"] = "Standard Preiskonfiguration"
TSM.L["Default vendoring page"] = "Standard-Verkaufsseite"
TSM.L["Define whet priority Gathering gives certain sources."] = "Definieren Sie die Gewichtung der Priorität. Das Sammeln gibt einige Quellen an."
TSM.L["Delete Profile Confirmation"] = "Löschen des Profils bestätigen"
TSM.L["DEPOSIT REAGENTS"] = "LAGERE REAGENZIEN EIN"
TSM.L["Deselect All Groups"] = "Alle Gruppen abwählen"
TSM.L["Deselect All Items"] = "Alle Items abwählen"
TSM.L["Destroy Next"] = "Nächstes zerstören"
TSM.L["Destroy Value"] = "Zerstörungswert"
TSM.L["Destroy Value Source"] = "Zerstörungs Wertquelle"
TSM.L["Destroying"] = "Zerstören"
TSM.L["Destroying 'DESTROY NEXT' Button"] = "Zerstören 'NÄCHSTES ZERSTÖREN' Taste"
TSM.L["Destroying Tooltips"] = "Zerstörungs-Tooltips"
TSM.L["Destroying..."] = "Zerstören..."
TSM.L["Details"] = "Details"
TSM.L["Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."] = "Ich habe %s nicht abgebrochen, weil Ihr Abbruch der erneuten Eingabe des Schwellenwerts (%s) ungültig ist. Überprüfe deine Einstellungen."
TSM.L["Did not cancel %s because your maximum price (%s) is invalid. Check your settings."] = "Ich habe %s nicht abgebrochen, weil dein Maximalpreis (%s) ungültig ist. Überprüfe deine Einstellungen."
TSM.L["Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Ich habe %s nicht abgebrochen, weil dein Maximalpreis (%s) niedriger ist als dein Minimalpreis (%s). Überprüfe deine Einstellungen."
TSM.L["Did not cancel %s because your minimum price (%s) is invalid. Check your settings."] = "Ich habe %s nicht abgebrochen, weil dein Mindestpreis (%s) ungültig ist. Überprüfe deine Einstellungen."
TSM.L["Did not cancel %s because your normal price (%s) is invalid. Check your settings."] = "Ich habe %s nicht abgebrochen, weil dein normaler Preis (%s) ungültig ist. Überprüfe deine Einstellungen."
TSM.L["Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = [=[Ich habe %s nicht abgebrochen, weil dein normaler Preis (%s) niedriger ist als dein Mindestpreis (%s). Überprüfe deine Einstellungen.
]=]
TSM.L["Did not cancel %s because your undercut (%s) is invalid. Check your settings."] = "Ich habe %s nicht abgebrochen, weil dein Unterbietung (\"%s\") ungültig ist. Überprüfe deine Einstellungen."
TSM.L["Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."] = "%s wurde nicht gepostet, weil Blizzard nicht alle notwendigen Informationen dafür bereitgestellt hat. Versuchen Sie es später noch einmal."
TSM.L["Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."] = "%s wurde nicht gepostet, da der Besitzer der niedrigsten Auktion (%s) sowohl auf der Blacklist als auch auf der Whitelist steht, was nicht erlaubt ist. Passen Sie Ihre Einstellungen an, um dieses Problem zu beheben."
TSM.L["Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."] = "%s wurde nicht gepostet, weil du oder einer deiner Twinks (%s) auf der schwarzen Liste steht, was nicht erlaubt ist. Entferne diesen Charakter von deiner Blacklist."
TSM.L["Did not post %s because your maximum price (%s) is invalid. Check your settings."] = "%s wurde nicht gepostet, weil dein Maximalpreis (%s) ungültig ist. Überprüfe deine Einstellungen."
TSM.L["Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "%s wurde nicht gepostet, weil dein Maximalpreis (%s) niedriger ist als dein Minimalpreis (%s). Überprüfe deine Einstellungen."
TSM.L["Did not post %s because your minimum price (%s) is invalid. Check your settings."] = [=[%s wurde nicht gepostet, weil dein Mindestpreis (%s) ungültig ist. Überprüfe deine Einstellungen.
]=]
TSM.L["Did not post %s because your normal price (%s) is invalid. Check your settings."] = "%s wurde nicht gepostet, weil dein normaler Preis (%s) ungültig ist. Überprüfe deine Einstellungen."
TSM.L["Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "%s wurde nicht gepostet, weil dein normaler Preis (%s) niedriger ist als dein Mindestpreis (%s). Überprüfe deine Einstellungen."
TSM.L["Did not post %s because your stack size (%d) is higher than the max stack size of the item (%d)."] = "%s wurde nicht gepostet, weil deine Stapelgröße (%d) höher ist als die maximale Stapelgröße des Artikels (%d)."
TSM.L["Did not post %s because your undercut (%s) is invalid. Check your settings."] = "%s wurde nicht gepostet, weil dein Unterbietung (\"%s\") ungültig ist. Überprüfe deine Einstellungen."
TSM.L["Disable invalid price warnings"] = "Ungültige Preiswarnungen deaktivieren"
TSM.L["Disenchant Search"] = "Entzauberungssuche"
TSM.L["DISENCHANT SEARCH"] = "ENTZAUBERUNGSSUCHE"
TSM.L["Disenchant Search Options"] = "Entzauberungssuch Optionen"
TSM.L["Disenchant Value"] = "Entzauberungswert"
TSM.L["Disenchanting Options"] = "Entzauberungsoptionen"
TSM.L["Display auctioning values"] = "Auktionswerte anzeigen"
TSM.L["Display cancelled since last sale"] = "Zeige abgebrochene Artikel seit dem letzten Verkauf"
TSM.L["Display crafting cost"] = "Zeige Herstellungskosten an"
TSM.L["Display detailed destroy info"] = "Detaillierte Zerstörungs-Info anzeigen"
TSM.L["Display disenchant value"] = "Zeige Entzauberungswert an"
TSM.L["Display global historical price"] = "Zeige globalen historischen Preis an"
TSM.L["Display global market value avg"] = "Zeige globalen durchschnittlichen Marktwert an"
TSM.L["Display global min buyout avg"] = "Zeige globalen durchschnittlichen Mindestsofortkauf an"
TSM.L["Display global sale avg"] = "Zeige globalen durchschnittlichen Verkauf an"
TSM.L["Display group name"] = "Zeige Gruppennamen an"
TSM.L["Display historical price"] = "Zeige historischen Preis"
TSM.L["Display market value"] = "Zeige Marktwert"
TSM.L["Display mill value"] = [=[Mahl-Wert anzeigen
]=]
TSM.L["Display min buyout"] = "Zeige Mindestsofortkauf"
TSM.L["Display Operation Names"] = "Zeige Operationsnamen an"
TSM.L["Display prospect value"] = "Sondierungswert anzeigen"
TSM.L["Display purchase info"] = "Zeige Kaufinfo"
TSM.L["Display region historical price"] = "Zeige den historischen Preis der Region an"
TSM.L["Display region market value avg"] = "Zeige den historischen Durchschnittspreis der Region an"
TSM.L["Display region min buyout avg"] = "Zeige den durchschnittlichen minimalen Sofortkaufpreis der Region an"
TSM.L["Display region sale avg"] = "Zeige die durchschnittlichen regionalen Verkäufe an"
TSM.L["Display region sale rate"] = "Zeige die regionale Verkaufsrate an"
TSM.L["Display region sold per day"] = "Zeige den regionalen Verkauf pro Tag"
TSM.L["Display sale info"] = "Zeige Verkaufs Info"
TSM.L["Display sale rate"] = "Zeige Verkaufsrate"
TSM.L["Display shopping max price"] = "Maximalen Einkaufspreis anzeigen"
TSM.L["Display total money recieved in chat?"] = "Gesamtes Gold im Chat anzeigen?"
TSM.L["Display transform value"] = "Anzeige des Transormationswertes"
TSM.L["Display vendor buy price"] = "Händlerkaufpreis anzeigen"
TSM.L["Display vendor sell price"] = "Händlerverkaufpreis anzeigen"
TSM.L["Doing so will also remove any sub-groups attached to this group."] = "Dadurch werden auch alle Untergruppen entfernt, die mit dieser Gruppe verbunden sind."
TSM.L["Done Canceling"] = "Abbrechen abgeschlossen"
TSM.L["Done Posting"] = "Erfolgreich eingestellt"
TSM.L["Done Scanning"] = "Scannen erledigt"
TSM.L["Don't post after this many expires:"] = "Poste nicht, nachdem so viele Artikel abgelaufen sind:"
TSM.L["Don't Post Items"] = "Keine Items einstellen"
TSM.L["Don't prompt to record trades"] = [=[Keine Eingabeaufforderung zur Aufzeichnung von Handelsgeschäften
]=]
TSM.L["DOWN"] = "NACH UNTEN"
TSM.L["Drag in Additional Items (%d/%d Items)"] = "Ziehen Sie zusätzliche Artikel (%d/%d Items) hinein."
TSM.L["Drag Item(s) Into Box"] = "Ziehe Gegenstände in die Box"
TSM.L["Duplicate"] = "Kopieren"
TSM.L["Duplicate Profile Confirmation"] = "Profil-Kopie Bestätigen"
TSM.L["Dust"] = "Staub"
TSM.L["Elevate your gold-making!"] = "Beschleunige dein Gold-Einkommen!"
TSM.L["Embed TSM tooltips"] = "Binde TSM Tooltipps ein"
TSM.L["EMPTY BAGS"] = "LEERE TASCHEN"
TSM.L["Empty parentheses are not allowed"] = "Leere Klammern sind nicht erlaubt"
TSM.L["Empty price string."] = "Leerer Preistext."
TSM.L["Enable automatic stack combination"] = "Aktiviere automatische Kombination von Stapeln"
TSM.L["Enable buying?"] = [=[Kaufen aktivieren?
]=]
TSM.L["Enable inbox chat messages"] = "Posteingangs-Chatnachrichten aktivieren"
TSM.L["Enable restock?"] = "Wiederauffüllen aktivieren? "
TSM.L["Enable selling?"] = "Verkaufen aktivieren?"
TSM.L["Enable sending chat messages"] = "Chat-Nachrichten senden aktivieren"
TSM.L["Enable smart crafting for quests"] = "Aktivieren Sie smart crafting für Quests."
TSM.L["Enable TSM Tooltips"] = "Aktiviere TSM Tooltips"
TSM.L["Enable tweet enhancement"] = "Tweet-Erweiterung aktivieren"
TSM.L["Enchant Vellum"] = "Zauber auf Pergament herstellen"
TSM.L["Enter a name for the new profile"] = "Geben Sie einen Namen für das neue Profil ein."
TSM.L["Enter Filter"] = "Filter eintragen"
TSM.L["Enter Keyword"] = "Suchwort eingeben"
TSM.L["Enter name of logged-in character from other account"] = "Gebe den Namen des, von einem anderen Account, eingeloggten Charakters ein"
TSM.L["Enter player name"] = "Spielername eintragen"
TSM.L["Essences"] = "Essenzen"
TSM.L["Establishing connection to %s. Make sure that you've entered this character's name on the other account."] = "Verbindung mit %s wird hergestellt. Achte darauf, dass dieser Charaktername im anderen Account angegeben ist."
TSM.L["Estimated Cost:"] = "Vorraussichtlichekosten:"
TSM.L["Estimated Profit:"] = "Voraussichtlicher Gewinn:"
TSM.L["Exact Match Only?"] = [=[Nur exakte Übereinstimmung?
]=]
TSM.L["Exclude crafts with cooldowns"] = "Ausschließen von Berufen mit Abklingzeiten"
TSM.L["Expenses"] = "Ausgaben"
TSM.L["EXPENSES"] = "AUSGABEN"
TSM.L["Expired"] = "Abgelaufen"
TSM.L["Expired Since Last Sale"] = "Abgelaufen seit letztem Verkauf"
TSM.L["Expires"] = "Abgelaufen"
TSM.L["EXPIRES"] = "ABGELAUFEN"
TSM.L["Exploration"] = "Erkundung"
TSM.L["Export"] = "Export"
TSM.L["Export List"] = "Exportliste"
TSM.L["Failed Auctions"] = "Fehlgeschlagene Auktionen"
TSM.L["Failed Since Last Sale (Expired/Cancelled)"] = "Fehlgeschlagen seit letztem Verkauf (Abgelaufen/Abgebrochen)"
TSM.L["Failed to bid on auction of %s."] = "Fehler beim Bieten auf Auktion von %s."
TSM.L["Failed to buy auction of %s."] = "Fehler beim Kaufen der Auktion von %s."
TSM.L["Failed to find auction for %s, so removing it from the results."] = "Die Auktion konnte nicht für %s gefunden werden, daher wurde sie aus den Ergebnissen entfernt."
TSM.L["Favorite Scans"] = "Favorisierte Scans"
TSM.L["Favorite Searches"] = "Favorisierte Suchen"
TSM.L["Filter Auctions by Duration"] = "Auktionen nach Dauer filtern"
TSM.L["Filter Auctions by Keyword"] = "Auktionen nach Schlüsselwörtern filtern"
TSM.L["FILTER BY KEYWORD"] = "GEFILTERT NACH SUCHWORT "
TSM.L["Filter by Keyword"] = "Gefiltert durch das Suchwort"
TSM.L["Filter group item lists based on the following price source"] = "Filtern von Gruppenartiklisten nach folgender Preisquelle"
TSM.L["Filter Items"] = "Items filtern"
TSM.L["Filter Shopping"] = "Filter Einkaufen"
TSM.L["Finding Selected Auction"] = "Gewählte Auktion suchen"
TSM.L["Fishing Reel In"] = "Angelrolle"
TSM.L["Forget Character"] = "Charakter vergessen"
TSM.L["Found auction sound"] = "Auktion gefunden Ton"
TSM.L["Friends"] = "Freunde"
TSM.L["From"] = "Von"
TSM.L["Full"] = "Vollständig"
TSM.L["Garrison"] = "Garnison"
TSM.L["Gathering"] = "Sammeln"
TSM.L["Gathering Search"] = "Sammelsuche"
TSM.L["General Options"] = "Allgemeine Optionen"
TSM.L["Get from Bank"] = "Aus Bank nehmen"
TSM.L["Get from Guild Bank"] = "Aus Gildenbank nehmen"
TSM.L["Global Data Tooltips"] = "Globale Daten Tooltips"
TSM.L["Global Historical Price"] = "Globaler historischer Preis"
TSM.L["Global Market Value Avg"] = "Globaler Marktwert Ø"
TSM.L["Global Min Buyout Avg"] = "Globaler Min Sofortkauf Ø"
TSM.L["Global Operation Confirmation"] = "Globale Operationsbestätigung"
TSM.L["Global Sale Avg"] = "Globaler Verkaufs Ø"
TSM.L["Gold"] = "Gold"
TSM.L["Gold Earned:"] = "Gold bekommen:"
TSM.L["GOLD ON HAND"] = "GOLD IN DER HAND"
TSM.L["Gold Spent:"] = "Gold ausgegeben:"
TSM.L["GREAT DEALS SEARCH"] = "GREAT DEALS SUCHE "
TSM.L["Group already exists."] = "Gruppe besteht bereits. "
TSM.L["Group Management"] = "Gruppenverwaltung"
TSM.L["Group Operations"] = "Gruppen Operationen"
TSM.L["Group Settings"] = "Gruppeneinstellungen"
TSM.L["Grouped Items"] = "Gruppierte Items"
TSM.L["Groups"] = "Gruppen"
TSM.L["Guild"] = "Gilde"
TSM.L["Guild Bank"] = "Gildenbank"
TSM.L["GUILDS"] = "GILDEN"
TSM.L["GVault"] = "GTresor"
TSM.L["Have"] = "Haben"
TSM.L["Have Materials"] = "Materialien haben"
TSM.L["Have Skill Up"] = "Aufstieg verfügbar"
TSM.L["Help & Info"] = "Hilfe & Info"
TSM.L["Hide auctions with bids"] = "Auktionen mit Geboten nicht anzeigen"
TSM.L["Hide Description"] = "Beschreibung ausblenden"
TSM.L["Hide minimap icon"] = "Minikartensymbol ausblenden"
TSM.L["Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."] = "Verberge das TSM Banking Interface. Tippe '/tsm bankui' um es erneut zu öffnen. "
TSM.L["Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."] = "Verberge die TSM Aufgabenliste. Tippe '/tsm tasklist' um es erneut zu öffnen. "
TSM.L["High Bidder"] = "Höchstbietender"
TSM.L["Historical Price"] = "Historischerpreis"
TSM.L["Hold ALT to repair from the guild bank."] = "Halte ALT und auf Kosten der Gildenbank zu reparieren. "
TSM.L["Hr"] = "Std"
TSM.L["Hrs"] = "Std"
TSM.L["I just bought [%s]x%d for %s! %s #TSM4 #warcraft"] = "Ich habe soeben [%s]x%d für %s gekauft! %s #TSM4 #warcraft"
TSM.L["I just sold [%s] for %s! %s #TSM4 #warcraft"] = "Ich habe soeben [%s] für %s verkauft! %s #TSM4 #warcraft"
TSM.L["If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."] = "Wenn Sie einen anderen Spieler nicht unterbieten möchten, können Sie ihn zu Ihrer Whitelist hinzufügen und TSM wird ihn nicht unterbieten. Beachten Sie, dass, wenn jemand auf Ihrer Whitelist mit Ihrem Kaufpreis übereinstimmt, aber ein niedrigeres Gebot aufführt, wird TSM immer noch davon ausgehen, dass er Sie unterbietet."
TSM.L["If you have multiple profile set up with operations, enabling this will cause all but the current profile's operations to be irreversibly lost. Are you sure you want to continue?"] = "Wenn du mehrere Profile mit diesen Operationen eingerichtet hast, wird das Aktivieren dieser Einstellung dazu führen, dass so gut wie alle Operationen des aktuellen Profils unwiderruflich verloren gehen. Willst du wirklich fortfahren?"
TSM.L["If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."] = "Wenn du die Twitter-Integration von WoW hast, fügt TSM einen Share-Link zu den erweiterten Auktionsverkaufs-/Kaufnachrichten hinzu und ersetzt URLs durch einen TSM-Link."
TSM.L["Ignore Auctions Below Min"] = "Ignoriere Auktionen unter Minimum"
TSM.L["Ignore auctions by duration?"] = "Auktionen nach Dauer ignorieren?"
TSM.L["Ignore Characters"] = "Charaktere ignorieren"
TSM.L["Ignore duplicate operations?"] = "Doppelte Operationen ignorieren?"
TSM.L["Ignore Guilds"] = "Gilden ignorieren"
TSM.L["Ignore operation on characters:"] = "Ignoriere Operationen bei Charakteren:"
TSM.L["Ignore operation on faction-realms:"] = "Ignoriert die Operation auf Fraktionsrealms:"
TSM.L["Ignore random enchants?"] = "Zufallsverzauberungen ignorieren?"
TSM.L["Ignored Cooldowns"] = "Ignorierte Abklingzeiten"
TSM.L["Ignored Items"] = "Ignorierte Items"
TSM.L["ilvl"] = "ilvl"
TSM.L["Import"] = "Import"
TSM.L["IMPORT"] = "IMPORT"
TSM.L["Import %d Items and %s Operations?"] = "Sollen %d Items und %s Operationen importiert werden?"
TSM.L["Import Groups & Operations"] = "Importiere Gruppen & Operationen"
TSM.L["Imported Items"] = "Importierte Items"
TSM.L["Imported Operations"] = "Importierte Operationen"
TSM.L["Inbox Settings"] = "Posteingangs Einstellungen"
TSM.L["Include Attached Operations"] = "Einschließlich zugewiesener Operationen"
TSM.L["Include operations?"] = "Operationen einschließen?"
TSM.L["Include soulbound items"] = "Schließe seelengebundene Gegenstände ein"
TSM.L["Information"] = "Informationen"
TSM.L["Invalid custom price entered."] = "Ungültigen benutzerdefinierten Preis eingeben."
TSM.L["Invalid custom price source for %s. %s"] = "Ungültige benutzerdefinierte Preisquelle für %s. %s"
TSM.L["Invalid custom price."] = "Ungültiger benutzerdefinierter Preis."
TSM.L["Invalid function."] = "Ungültige Funktion."
TSM.L["Invalid group name."] = "Ungültiger Gruppenname."
TSM.L["Invalid item link."] = "Ungültiger Item-Link."
TSM.L["Invalid operation name."] = "Ungültiger Operationsname."
TSM.L["Invalid operator at end of custom price."] = "Ungültiger Operator am Ende des benutzerdefinierten Preises."
TSM.L["Invalid parameter to price source."] = "Ungültiger Parameter für Preisquelle."
TSM.L["Invalid player name."] = "Ungültiger Spielername."
TSM.L["Invalid price source in convert."] = "Ungültige Preisquelle in Formel."
TSM.L["Invalid price source."] = "Ungültige Preisquelle"
TSM.L["Invalid seller data returned by server."] = "Ungültige Daten zum Verkäufer vom Server gemeldet. "
TSM.L["Invalid word: '%s'"] = "Ungültiges Wort: '%s'"
TSM.L["Inventory"] = "Inventar"
TSM.L["Inventory / Mailing"] = "Inventar / Mailing"
TSM.L["Inventory Options"] = "Inventaroptionen"
TSM.L["Inventory Tooltip Format"] = "Inventar Tooltip Format"
TSM.L["It appears that you've manually copied your saved variables between accounts which will cause TSM's automatic sync'ing to not work. You'll need to undo this, and/or delete the TradeSkillMaster and TSM_Crafting saved variables files on both accounts (with WoW closed) in order to fix this."] = "Es scheint so, als hättest du deine gespeicherten Variablen manuell zwischen den Accounts verschoben, demzufolge wird die automatische Synchronisierung von TSM nicht funktionieren. Um dieses Problem zu beheben, musst du diesen Schritt rückgängig machen, und/oder die TradeSkillMaster- und TSM_Crafting-Datei mit den gespeicherten Variablen bei beiden Accounts löschen (während WoW geschlossen ist)."
TSM.L["Item"] = "Item"
TSM.L["ITEM CLASS"] = "GEGENSTANDSKLASSE"
TSM.L["Item Level"] = "Item Level"
TSM.L["ITEM LEVEL RANGE"] = "BEREICH DER ITEMSTUFE"
TSM.L["Item links may only be used as parameters to price sources."] = "Item-Links dürfen nur als Parameter für Preisquellen verwendet werden."
TSM.L["Item Name"] = "Name des Items"
TSM.L["Item Quality"] = "Item Qualität"
TSM.L["ITEM SEARCH"] = "ITEM SUCHE"
TSM.L["ITEM SUBCLASS"] = "GEGENSTAND UNTERKATEGORIE"
TSM.L["Item Value"] = "Item Wert"
TSM.L["Item/Group is invalid (see chat)."] = "Gegenstand/Gruppe ist ungültig (siehe Chat)."
TSM.L["ITEMS"] = "ITEMS"
TSM.L["Items"] = "Items"
TSM.L["Items in Bags"] = "Items in der Tasche"
TSM.L["Keep in bags quantity:"] = "Anzahl in den Taschen behalten:"
TSM.L["Keep in bank quantity:"] = "Anzahl in der Bank behalten:"
TSM.L["Keep posted:"] = "Bleiben Sie auf dem Laufenden:"
TSM.L["Keep quantity:"] = "Anzahl behalten:"
TSM.L["Keep this amount in bags:"] = "Diese Anzahl in den Taschen behalten:"
TSM.L["Keep this amount:"] = "Diese Anzahl behalten:"
TSM.L["Keeping %d."] = "Behalte %d."
TSM.L["Keeping undercut auctions posted."] = "Die Auktionen mit unterbotenen Auktionen auf dem Laufenden halten."
TSM.L["Last 14 Days"] = "Letzten 14 Tage"
TSM.L["Last 3 Days"] = "Letzten 3 Tage"
TSM.L["Last 30 Days"] = "Letzten 30 Tage"
TSM.L["LAST 30 DAYS"] = "LETZTEN 30 TAGE"
TSM.L["Last 60 Days"] = "Letzten 60 Tage"
TSM.L["Last 7 Days"] = "Letzten 7 Tage"
TSM.L["LAST 7 DAYS"] = "LETZTEN 7 TAGE"
TSM.L["Last Data Update:"] = "Letztes Datenupdate: "
TSM.L["Last Purchased"] = "Letzter Einkauf"
TSM.L["Last Sold"] = "Letzter Verkauf"
TSM.L["Level Up"] = "Stufe aufgestiegen"
TSM.L["LIMIT"] = "LIMIT"
TSM.L["Link to Another Operation"] = "Verbinde mit einer anderen Operation"
TSM.L["List"] = "Liste"
TSM.L["List materials in tooltip"] = "Liste Materialien im Tooltip"
TSM.L["Loading Mails..."] = "Post laden..."
TSM.L["Loading..."] = "Laden..."
TSM.L["Looks like TradeSkillMaster has encountered an error. Please help the author fix this error by following the instructions shown."] = "Es scheint so, als wäre TradeSkillMaster auf einen Fehler gestoßen. Du kannst dem Autor dabei helfen, diesen Fehler zu beheben, indem du die folgenden Anweisungen befolgst."
TSM.L["Loop detected in the following custom price:"] = "Schleife im folgenden benutzerdefinierten Preis entdeckt:"
TSM.L["Lowest auction by whitelisted player."] = "Günstigste Auktion von Spielern auf der weißen Liste."
TSM.L["Macro created and scroll wheel bound!"] = "Makro erstellt und mit Mausrad verbunden!"
TSM.L["Macro Setup"] = "Makro-Setup"
TSM.L["Mail"] = "Briefk"
TSM.L["Mail Disenchantables"] = "Sende Entzauberungsgegenstände"
TSM.L["Mail Disenchantables Max Quality"] = "Sende Entzauberungsgegenstände maximaler Qualität"
TSM.L["MAIL SELECTED GROUPS"] = "SENDEN ZU DEN AUSGEWÄHLTEN GRUPPEN"
TSM.L["Mail to %s"] = "Post an %s"
TSM.L["Mailing"] = "Mailing"
TSM.L["Mailing all to %s."] = "Alles an %s senden."
TSM.L["Mailing Options"] = "Mailing Optionen"
TSM.L["Mailing up to %d to %s."] = "Mailing bis zu %d an %s."
TSM.L["Main Settings"] = "Haupteinstellungen"
TSM.L["Make Cash On Delivery?"] = "Zur Nachnahme umwandeln?"
TSM.L["Management Options"] = "Management Oprionen"
TSM.L["Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."] = "Viele der am häufigsten verwendeten Aktionen in TSM können zu einem Makro hinzugefügt und an Ihr Scrollrad gebunden werden. Verwenden Sie die folgenden Optionen, um diese Makro- und Scrollradbindung einzurichten."
TSM.L["Map Ping"] = "Klick auf Minimap"
TSM.L["Market Value"] = "Marktwert"
TSM.L["Market Value Price Source"] = "Marktwert Preisquelle"
TSM.L["Market Value Source"] = "Marktwert Quelle"
TSM.L["Mat Cost"] = "Mat Kosten"
TSM.L["Mat Price"] = "Mat Preis"
TSM.L["Match stack size?"] = "Stapelgröße anpassen?"
TSM.L["Match whitelisted players"] = "Übereinstimmung mit Spielern auf der weißen Liste"
TSM.L["Material Name"] = "Materialname"
TSM.L["Materials"] = "Materialien"
TSM.L["Materials to Gather"] = [=[Zu sammelnde Materialien
]=]
TSM.L["Max Destroy Value"] = "Maximaler Zerstörungswert"
TSM.L["MAX EXPIRES TO BANK"] = "MAXIMALER ABLAUF ZUR BANK"
TSM.L["Max Market Value"] = "Maximaler Marktpreis"
TSM.L["Max Shopping Price"] = "Maximaler Einkaufspreis"
TSM.L["Maximum amount already posted."] = "Maximale Anzahl bereits gelistet."
TSM.L["Maximum Auction Price (Per Item)"] = "Maximaler Auktionspreis (pro Gegenstand)"
TSM.L["Maximum Destroy Value (Enter '0c' to disable)"] = [=[Maximaler Zerstörungswert (Geben Sie '0c' zum Deaktivieren ein)
]=]
TSM.L["Maximum disenchant level:"] = "Maximale Entzauberungsstufe:"
TSM.L["Maximum Disenchant Quality"] = "Maximale Entzauberungsqualität:"
TSM.L["Maximum disenchant search percentage:"] = "Maximaler Prozentsatz der entzaubernden Suchaktion:"
TSM.L["Maximum Market Value (Enter '0c' to disable)"] = "Maximaler Marktwert (Geben Sie '0c' ein, um zu deaktivieren)"
TSM.L["MAXIMUM QUANTITY TO BUY:"] = "MAXIMALMENGE ZUM KAUFEN:"
TSM.L["Maximum quantity:"] = [=[Maximale Menge:
]=]
TSM.L["Maximum restock quantity:"] = "Maximale Nachfüllmenge:"
TSM.L["Mill Value"] = "Mühlen Wert"
TSM.L["Min"] = "Min"
TSM.L["Min Buyout"] = "Min Sofortkaufpreis"
TSM.L["Min/Normal/Max Prices"] = "Min/Normal/Max Preis"
TSM.L["Minimum Days Old"] = "Mindestalter"
TSM.L["Minimum disenchant level:"] = "Minimale Entzauberungsstufe:"
TSM.L["Minimum expires:"] = "Die Mindestlaufzeit läuft ab:"
TSM.L["Minimum profit:"] = "Mindestgewinn"
TSM.L["MINIMUM RARITY"] = [=[MINIMALE RARITÄT
]=]
TSM.L["Minimum restock quantity:"] = "Mindestauffüllmenge:"
TSM.L["Misplaced comma"] = "Falsch gesetztes Komma"
TSM.L["Missing Materials"] = "Fehlende Materialien"
TSM.L["MM/DD/YY HH:MM"] = "MM/DD/YY HH:MM"
TSM.L["Modifiers:"] = "Modifikatoren:"
TSM.L["Money Frame Open"] = "Geldfenster öffnen"
TSM.L["Money Transfer"] = "Geldtransfer"
TSM.L["Most Profitable Item:"] = "Profitabelstes Item"
TSM.L["MOVE"] = "BEWEGEN"
TSM.L["Move already grouped items?"] = "Bereits gruppierte Items verschieben?"
TSM.L["Move Quantity Settings"] = "Mengeneinstellungen verschieben"
TSM.L["MOVE TO BAGS"] = "VERSCHIEBE NACH TASCHEN"
TSM.L["MOVE TO BANK"] = "VERSCHIEBE ZUR BANK"
TSM.L["MOVING"] = "BEWEGEN"
TSM.L["Moving"] = "Bewegen"
TSM.L["Multiple Items"] = "Mehrere Gegenstände"
TSM.L["My Auctions"] = "Meine Auktionen"
TSM.L["My Auctions 'CANCEL' Button"] = "Meine Auktionen 'Abbrechen' Button"
TSM.L["Neat Stacks only?"] = "Nur ordentliche Stapel?"
TSM.L["NEED MATS"] = "BRAUCHE MATS"
TSM.L["New Group"] = "Neue Gruppe"
TSM.L["New Operation"] = "Neue Operation"
TSM.L["NEWS AND INFORMATION"] = "NEWS UND INFORMATIONEN"
TSM.L["No Attachments"] = "Keine Anhänge"
TSM.L["No Data"] = "Keine Daten"
TSM.L["No group selected"] = "Keine Gruppe ausgewählt"
TSM.L["No item specified. Usage: /tsm restock_help [ITEM_LINK]"] = "Kein Gegenstand spezifiziert. Nutze: /tsm restock_help [ITEM_LINK]"
TSM.L["NO ITEMS"] = "KEINE ITEMS"
TSM.L["No Materials to Gather"] = "Keine Materialien zum Sammeln"
TSM.L["No Operation Selected"] = "Keine Operation ausgewählt"
TSM.L["No posting."] = "Keine Listung."
TSM.L["No Profession Opened"] = "Keinen Beruf geöffnet"
TSM.L["No Profession Selected"] = "Keinen Beruf ausgewählt"
TSM.L["No profile specified. Possible profiles: '%s'"] = "Kein Profil angegeben. Mögliche Profile: '%s'"
TSM.L["No recent AuctionDB scan data found."] = "Keine aktuellen AuctionDB Scan-Daten gefunden. "
TSM.L["No Sound"] = "Kein Sound"
TSM.L["None"] = "Nichts"
TSM.L["None (Always Show)"] = "Keine (immer zeigen)"
TSM.L["None Selected"] = "Nichts ausgewählt"
TSM.L["NONGROUP TO BANK"] = "NICHT-GRUPPIERT ZUR BANK"
TSM.L["Normal"] = "Normal"
TSM.L["Not canceling auction at reset price."] = "Wird nicht abgebrochen, Auktion bei Reset-Preis."
TSM.L["Not canceling auction below min price."] = "Wird nicht abgebrochen, Auktion unter Mindestpreis."
TSM.L["Not canceling."] = "Wird nicht abgebrochen. "
TSM.L["Not enough items in bags."] = "Nicht genügend Gegenstände in den Taschen."
TSM.L["NOT OPEN"] = "NICHT ÖFFNEN"
TSM.L["Not Scanned"] = "Nicht gescannt"
TSM.L["NPC"] = "NPC"
TSM.L["Number Owned"] = "Anzahl in Besitz"
TSM.L["of"] = "von"
TSM.L["Offline"] = "Offline"
TSM.L["Old TSM addons detected. TSM has disabled them and requires a reload."] = "Altes TSM Addon erkannt. TSM hat dies deaktiviert und erfordert einen Reload. "
TSM.L["On Cooldown"] = "Auf Abklingzeit"
TSM.L["Only show craftable"] = "Nur herstellbare Gegenstände anzeigen"
TSM.L["Only show items with disenchant value above custom price"] = "Zeige nur Items mit einem Entzauberungswert über dem benutzerdefinierten Preis"
TSM.L["OPEN"] = "ÖFFNEN"
TSM.L["Open all bags when auctioning"] = "Öffne alle Taschen bei Auktionshaus"
TSM.L["OPEN ALL MAIL"] = "ALLE MAILS ÖFFNEN"
TSM.L["Open Mail"] = "Mail öffnen"
TSM.L["Open Mail Complete Sound"] = "Öffne fertiger Posteingangston"
TSM.L["Open Task List"] = "Aufgabenliste öffnen"
TSM.L["Operation"] = "Operation"
TSM.L["Operations"] = "Operationen"
TSM.L["Other Character"] = "Anderer Charakter"
TSM.L["Other Settings"] = "Andere Einstellungen"
TSM.L["Other Shopping Searches"] = "Andere Einkaufs-Suchen"
TSM.L["Override default craft value method?"] = "Die standardmäßige Craft Value-Methode überschreiben?"
TSM.L["Override parent operations"] = "Überschreiben von übergeordneten Operationen"
TSM.L["Parent Items"] = "Übergeordnete Gegenstände"
TSM.L["Past 7 Days"] = "Letzen 7 Tage"
TSM.L["Past Day"] = "Letzter Tag"
TSM.L["Past Month"] = "Letzter Monat"
TSM.L["Past Year"] = "Letztes Jahr"
TSM.L["Paste string here"] = "Füge die Zeichenfolge hier ein"
TSM.L["Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."] = "Füge deine Import-Zeichenfolge in das Feld unten ein und klicke auf 'IMPORT'. Du kannst alles importieren, von Itemlisten (Komma getrennt bitte) bis zu ganzen Gruppen & Operationen."
TSM.L["Per Item"] = "Pro Item"
TSM.L["Per Stack"] = "Pro Stapel"
TSM.L["Per Unit"] = "Pro EInheit"
TSM.L["Player Gold"] = "Spielergold"
TSM.L["Player Invite Accept"] = "Spielereinladung akzeptieren"
TSM.L["Please select a group to export"] = "Bitte eine Gruppe für den Export auswählen"
TSM.L["POST"] = "EINSTELLEN"
TSM.L["Post at Maximum Price"] = "Zum maximum Preis einstellen"
TSM.L["Post at Minimum Price"] = "Zum minimum Preis einstellen"
TSM.L["Post at Normal Price"] = "Zum normalen Preis einstellen"
TSM.L["POST CAP TO BAGS"] = "FÜGE MAXIMALE MENGE IN DEINE TASCHEN"
TSM.L["Post Scan"] = "Einstellungsscan"
TSM.L["POST SELECTED"] = "AUSGEWÄHLTES EINSTELLEN"
TSM.L["POSTAGE"] = "PORTO"
TSM.L["Postage"] = "Porto"
TSM.L["Posted at whitelisted player's price."] = "Zum Preis des Spielers auf der weißen Liste gelistet. "
TSM.L["Posted Auctions %s:"] = "Gelistete Auktionen %s:"
TSM.L["Posting"] = "Veröffentlichung"
TSM.L["Posting %d / %d"] = "Einstellen %d / %d"
TSM.L["Posting %d stack(s) of %d for %d hours."] = "Veröffentlichung von %d Stapeln von %d für %d Stunden."
TSM.L["Posting at normal price."] = "Einstellen zum normalen Preis"
TSM.L["Posting at whitelisted player's price."] = "Zum Preis des Spielers auf der weißen Liste listen. "
TSM.L["Posting at your current price."] = [=[Veröffentlichung zu Ihrem aktuellen Preis.
]=]
TSM.L["Posting disabled."] = "Veröffentlichung deaktiviert."
TSM.L["Posting Settings"] = "Veröffentlichung-Einstellungen"
TSM.L["Potential"] = [=[Potential
]=]
TSM.L["Price Settings"] = "Preiseinstellungen"
TSM.L["PRICE SOURCE"] = "PREISQUELLE"
TSM.L["Price source with name '%s' already exists."] = "Die Preisquelle mit dem Namen '%s' existiert bereits. "
TSM.L["Price Variables"] = "Preisvariablen"
TSM.L["Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."] = "Preisvariablen ermöglichen es Ihnen, erweiterte benutzerdefinierte Preise für die Verwendung im gesamten Addon zu erstellen. Sie können diese neuen Variablen genauso verwenden, wie Sie die eingebauten Preisquellen wie \"vendorsell\" und \"vendorbuy\" verwenden können."
TSM.L["PROFESSION"] = "BERUF"
TSM.L["Profession Filters"] = "Berufe Filter"
TSM.L["Profession loading..."] = "Berufe laden..."
TSM.L["Professions Used In"] = "Berufe, die in folgenden Bereichen eingesetzt werden"
TSM.L["Profile changed to '%s'."] = "Profil wurde auf '%s' geändert."
TSM.L["Profiles"] = "Profile"
TSM.L["Profit"] = "Gewinn"
TSM.L["PROFIT"] = "GEWINN"
TSM.L["Profit Deduction"] = [=[Gewinnabführung
]=]
TSM.L["Profit, Craftable Quantity"] = "Gewinn, handwerkliche Menge"
TSM.L["Prospect Value"] = "Sondierungswert"
TSM.L["PURCHASE DATA"] = "KAUFDATEN"
TSM.L["Purchased (Min/Avg/Max Price)"] = "Gekauft (Min/Ø/Max Preis)"
TSM.L["Purchased (Total Price)"] = "Gekauft (Gesamtpreis)"
TSM.L["Purchases"] = "Einkäufe"
TSM.L["Qty"] = "Anz"
TSM.L["Quantity Bought:"] = "Anzahl gekauft:"
TSM.L["Quantity Sold:"] = "Anzahl verkauft:"
TSM.L["Quantity to move:"] = "Anzahl zum bewegen:"
TSM.L["Quest Added"] = "Quest hinzugefügt"
TSM.L["Quest Completed"] = "Quest abgeschlossen"
TSM.L["Quest Objectives Complete"] = "Questziel erreicht"
TSM.L["QUEUE"] = "WARTESCHLANGE"
TSM.L["Queue Sorting Method"] = "Methode zur Sortierung der Warteschlange"
TSM.L["Quick Sell"] = "Schnell Verkauf"
TSM.L["Quick Sell Options"] = "Schnell Verkaufsoptionen"
TSM.L["Quickly mail all excess disenchantable items to a character"] = "Versenden Sie schnell alle entzauberbaren Gegenstände an einen Charakter."
TSM.L["Quickly mail all excess gold (limited to a certain amount) to a character"] = "Versenden Sie schnell alle überschüssigen Goldmengen (begrenzt auf eine bestimmte Menge) an einen Charakter."
TSM.L["Raid Warning"] = "Schlachtzugwarnung"
TSM.L["Read More"] = "Mehr lesen"
TSM.L["Ready Check"] = "Bereitschaftscheck"
TSM.L["Ready to Cancel"] = "Bereit zum Abbrechen"
TSM.L["Reagent Bank"] = "Materiallager"
TSM.L["Realm Data Tooltips"] = "Real Daten Tooltip"
TSM.L["Recent Scans"] = "Letzte Scans"
TSM.L["Recent Searches"] = "Neuste Suchen"
TSM.L["Recently Mailed"] = "Kürzlich versendet"
TSM.L["RECIPIENT"] = "EMPFÄNGER"
TSM.L["Region Avg Daily Sold"] = "Regionaler Ø täglicher Verkäufe"
TSM.L["Region Data Tooltips"] = "Regionale Daten Tooltip"
TSM.L["Region Historical Price"] = "Regionaler historischer Preis"
TSM.L["Region Market Value Avg"] = "Regionaler Marktwert Ø"
TSM.L["Region Min Buyout Avg"] = "Regionaler Min Sofortkauf Ø"
TSM.L["Region Sale Avg"] = "Regionaler Verkaufs Ø"
TSM.L["Region Sale Rate"] = "Regionale Verkaufsrate"
TSM.L["Reload"] = "Neuladen"
TSM.L["REMOVE %d ITEMS"] = "ENTFERNE %d ITEMS"
TSM.L["Removed a total of %s old records."] = "Es wurden insgesamt %s alte Daten entfernt. "
TSM.L["REPAIR"] = "REPARIEREN"
TSM.L["Repair Bill"] = "Reparaturrechnung"
TSM.L["Replace"] = "Ersetzen"
TSM.L["REPLY"] = "ANTWORTEN"
TSM.L["REPORT SPAM"] = "SPAM MELDEN"
TSM.L["Repost Higher Threshold"] = "Höhere Schwelle erneut buchen"
TSM.L["Required Level"] = "Erforderliche Stufe"
TSM.L["REQUIRED LEVEL RANGE"] = "ERFORDERLICHER STUFENBEREICH"
TSM.L["Requires TSM Desktop Application"] = "Benötigt TSM Desktop Application"
TSM.L["Resale"] = "Wiederverkauf"
TSM.L["RESCAN"] = "NEU SCANNEN"
TSM.L["RESET"] = "ZURÜCKSETZEN"
TSM.L["Reset All"] = "Alles zurücksetzen"
TSM.L["Reset Filters"] = "Filter zurücksetzen"
TSM.L["Reset Profile Confirmation"] = "Zurücksetzen der Profilbestätigung"
TSM.L["RESTART"] = "NEU STARTEN"
TSM.L["Restart Delay (minutes)"] = "Neustartverzögerung (Minuten)"
TSM.L["RESTOCK BAGS"] = "TASCHEN AUFFÜLLEN"
TSM.L["Restock help for %s:"] = "Hilfe zum Auffüllen von %s:"
TSM.L["Restock Quantity Settings"] = "Einstellungen für die Auffüllmenge"
TSM.L["Restock quantity:"] = "Auffüllmenge:"
TSM.L["RESTOCK SELECTED GROUPS"] = "AUFFÜLLEN DER GEWÄHLTEN GRUPPEN"
TSM.L["Restock Settings"] = "Einstellungen für die Wiederauffüllung"
TSM.L["Restock target to max quantity?"] = "Soll bis zur Höchstmenge aufgefüllt werden?"
TSM.L["Restocking to %d."] = "Auffüllen bis %d."
TSM.L["Restocking to a max of %d (min of %d) with a min profit."] = "Wiederauffüllung bis maximal %d (min. %d) mit einem minimalen Gewinn."
TSM.L["Restocking to a max of %d (min of %d) with no min profit."] = "Wiederauffüllung bis max. %d (min. %d) ohne min. Gewinn."
TSM.L["RESTORE BAGS"] = "TASCHE WIEDERHERSTELLEN"
TSM.L["Resume Scan"] = "Scan fortführen"
TSM.L["Retrying %d auction(s) which failed."] = "Wiederholung der %d-Auktion(en), die fehlgeschlagen sind."
TSM.L["Revenue"] = "Einnahmen"
TSM.L["Round normal price"] = "Runde normalen Preis"
TSM.L["RUN ADVANCED ITEM SEARCH"] = "ERWEITERTE GEGENSTANDSUCHE AUSFÜHREN"
TSM.L["Run Bid Sniper"] = "Starte Bieten Sniper"
TSM.L["Run Buyout Sniper"] = "Starte Sofort-Kaufen Sniper"
TSM.L["RUN CANCEL SCAN"] = "Starte Abbruchsscan"
TSM.L["RUN POST SCAN"] = "Starte Einstellungsscan"
TSM.L["RUN SHOPPING SCAN"] = "STARTE KAUFSUCHE"
TSM.L["Running Sniper Scan"] = "Sniper Scan läuft"
TSM.L["Sale"] = "Verkauf"
TSM.L["SALE DATA"] = "VERKAUFSDATEN"
TSM.L["Sale Rate"] = "Verkaufsrate"
TSM.L["Sales"] = "Umsatz"
TSM.L["SALES"] = "UMSATZ"
TSM.L["Sales Summary"] = "Verkaufszusammenfassung"
TSM.L["SCAN ALL"] = "ALLE SCANNEN"
TSM.L["Scan Complete Sound"] = "Sound, wenn der Scan fertig ist"
TSM.L["Scan Paused"] = "Scan pausiert"
TSM.L["SCANNING"] = "SCANNEN"
TSM.L["Scanning %d / %d (Page %d / %d)"] = "Scanne %d / %d (Seite %d / %d)"
TSM.L["Scroll wheel direction:"] = "Richtung des Mausrades:"
TSM.L["Search"] = "Suche"
TSM.L["Search Bags"] = "Taschen durchsuchen"
TSM.L["Search for Item"] = "Nach Item suchen"
TSM.L["Search Groups"] = "Gruppen durchsuchen"
TSM.L["Search Inbox"] = "Posteingangssuche"
TSM.L["Search Operations"] = "Operationen durchsuchen"
TSM.L["Search Patterns"] = "Suche Pläne"
TSM.L["Search Usable Items Only?"] = "Nur benutzbare Gegenstände suchen?"
TSM.L["Search Vendor"] = "Händlersuche"
TSM.L["Select a Source"] = "Wähle eine Quelle"
TSM.L["Select Action"] = "Auktion auswählen"
TSM.L["Select All Groups"] = "Alle Gruppen auswählen"
TSM.L["Select All Items"] = "Alle Items auswählen "
TSM.L["Select Auction to Cancel"] = "Wähle eine Auktion zum abbrechen"
TSM.L["Select crafter"] = "Wähle Handwerker aus"
TSM.L["Select custom price sources to include in item tooltips"] = "Wähle benutzerdefinierte Preisquellen aus, um diese in Item Tooltips zu integrieren"
TSM.L["Select Duration"] = "Dauer auswählen"
TSM.L["Select Items to Add"] = "Wähle Items zum hinzufügen aus"
TSM.L["Select Items to Remove"] = "Wähle Items zum entfernen aus"
TSM.L["Select Operation"] = "Operation auswählen"
TSM.L["Select professions"] = "Berufe auswählen"
TSM.L["Select which accounting information to display in item tooltips."] = "Wähle aus, welche Accounting Informationen im Gegenstands-Tooltip angezeigt werden sollen. "
TSM.L["Select which auctioning information to display in item tooltips."] = "Wähle aus, welche Auctioning Informationen im Gegenstands-Tooltip angezeigt werden sollen. "
TSM.L["Select which crafting information to display in item tooltips."] = "Wähle aus, welche Crafting Informationen im Gegenstands-Tooltip angezeigt werden sollen. "
TSM.L["Select which destroying information to display in item tooltips."] = "Wähle aus, welche Destroying Informationen im Gegenstands-Tooltip angezeigt werden sollen. "
TSM.L["Select which shopping information to display in item tooltips."] = "Wähle aus, welche Shopping Informationen im Gegenstands-Tooltip angezeigt werden sollen. "
TSM.L["Selected Groups"] = "Ausgewählte Gruppen"
TSM.L["SELECTED ITEM"] = "AUSGEWÄHLTES ITEM"
TSM.L["Selected Operations"] = "Ausgewählte Operationen"
TSM.L["Sell"] = "Verkaufen"
TSM.L["SELL ALL"] = "ALLES VERKAUFEN"
TSM.L["SELL BOES"] = "Verkaufe BOES"
TSM.L["SELL GROUPS"] = "GRUPPEN VERKAUFEN"
TSM.L["Sell Options"] = "Verkaufs Optionen"
TSM.L["Sell soulbound items?"] = "Seelengebunde Items verkaufen?"
TSM.L["Sell to Vendor"] = "An Händler verkaufen"
TSM.L["SELL TRASH"] = "MÜLL VERKAUFEN"
TSM.L["Seller"] = "Verkäufer"
TSM.L["Selling soulbound items."] = "Seelengebunde Items verkauft."
TSM.L["Send"] = "Senden"
TSM.L["SEND DISENCHANTABLES"] = "SENDE ENTZAUBERBARES"
TSM.L["Send Excess Gold to Banker"] = "Senden Sie überschüssiges Gold an den Banker."
TSM.L["SEND GOLD"] = "GOLD SENDEN"
TSM.L["Send grouped items individually"] = "Gruppierte Artikel einzeln versenden"
TSM.L["SEND MAIL"] = "MAIL SENDEN"
TSM.L["Send Money"] = "Geld senden"
TSM.L["SENDING"] = "SENDEN"
TSM.L["Sending %s individually to %s"] = "Senden von %s individuell bis %s"
TSM.L["Sending %s to %s"] = "Sende %s an %s"
TSM.L["Sending %s to %s with a COD of %s"] = "Senden von %s an %s mit Kosten für die Lieferung von %s"
TSM.L["Sending Settings"] = "Senden Einstellungen"
TSM.L["SENDING..."] = "SENDEN..."
TSM.L["Set auction duration to:"] = "Setze die Auktionsdauer auf:"
TSM.L["Set bid as percentage of buyout:"] = "Setzen Sie das Gebot als Prozentsatz des Kaufpreises:"
TSM.L["Set keep in bags quantity?"] = "Eingestellte Aufbewahrungsmenge in Taschen?"
TSM.L["Set keep in bank quantity?"] = "Eingestellte Aufbewahrungsmenge in Bank?"
TSM.L["Set Maximum Price:"] = "Setze maximum Preis:"
TSM.L["Set maximum quantity?"] = "Setze maximum Anzahl?"
TSM.L["Set Minimum Price:"] = "Setze minimum Preis:"
TSM.L["Set minimum profit?"] = "Setze minimum Profit?"
TSM.L["Set move quantity?"] = "Bewegungsmenge einstellen?"
TSM.L["Set Normal Price:"] = "Setze normalen Preis:"
TSM.L["Set post cap to:"] = "Stelle maximale Einstellungsmenge zu:"
TSM.L["Set posted stack size to:"] = "Stelle maximale Stapelgröße zu:"
TSM.L["Set stack size for bags?"] = "Stapelgröße für Taschen festlegen?"
TSM.L["Setup"] = "Setup"
TSM.L["SETUP ACCOUNT SYNC"] = "ACCOUNT SYNC EINSTELLEN"
TSM.L["Shards"] = "Splitter"
TSM.L["Shopping"] = "Einkauf"
TSM.L["Shopping 'BUYOUT' Button"] = "Einkaufen 'SOFORTKAUFEN' Button"
TSM.L["Shopping for auctions including those above the max price."] = "Kauf von Auktionen, einschließlich solcher, die über dem Höchstpreis liegen."
TSM.L["Shopping for auctions with a max price set."] = "Kauf von Auktionen mit einem festgelegten Höchstpreis."
TSM.L["Shopping for even stacks including those above the max price"] = "Kauf von gleichmäßigen Stapeln, einschließlich derjenigen, die über dem Höchstpreis liegen."
TSM.L["Shopping for even stacks with a max price set."] = "Kauf von gleichmäßigen Stapeln mit einem Maximalpreis."
TSM.L["Shopping Tooltips"] = "Shopping Tooltips"
TSM.L["SHORTFALL TO BAGS"] = "AUFFÜLLEN ZU TASCHE"
TSM.L["Show auctions above max price?"] = "Auktionen über dem Höchstpreis anzeigen?"
TSM.L["Show Description"] = "Zeige Beschreibung"
TSM.L["Show Destroying frame automatically"] = "Zeige Zerstörungsmodul automatisch"
TSM.L["Show material cost"] = "Zeige Materialkosten"
TSM.L["Show on Modifier"] = "Auf Modifikator anzeigen"
TSM.L["Showing %d Mail"] = "Zeige %d Nachrichten an"
TSM.L["Showing %d of %d Mail"] = "Zeige %d von %d Post"
TSM.L["Showing %d of %d Mails"] = "Zeige %d von %d Nachrichten an"
TSM.L["Showing all %d Mails"] = "Es werden %d Nachrichten angezeigt"
TSM.L["Simple"] = "Einfach"
TSM.L["SKIP"] = "NÄCHSTE"
TSM.L["Skip Import / Export confirmations?"] = "Import / Export Bestätigung überspringen?"
TSM.L["Skipped: No assigned operation"] = "Übersprungen: Kein zugeordneter Operationstyp"
TSM.L["Slash Commands:"] = "Slash-Befehle:"
TSM.L["Sniper 'BUYOUT' Button"] = "Sniper 'SOFORTKAUF' Button"
TSM.L["Sniper Options"] = "Sniper Optionen"
TSM.L["Sniper Settings"] = "Sniper Einstellungen"
TSM.L["Sniping items below a max price"] = "Sniper Items unter max Preis"
TSM.L["Sold"] = "Verkauft"
TSM.L["Sold %s worth of items."] = "Items im Wert von %s verkauft."
TSM.L["Sold (Min/Avg/Max Price)"] = "Verkauft (Min/Ø/Max Preis)"
TSM.L["Sold (Total Price)"] = "Verkauft (Gesamtpreis)"
TSM.L["Sold [%s]x%d for %s to %s"] = "Verkauft [%s]x%d für %s an %s"
TSM.L["Sold Auctions %s:"] = "Auktionen verkauft: %s"
TSM.L["Source"] = "Quelle"
TSM.L["SOURCE %d"] = "QUELLE %d"
TSM.L["SOURCES"] = "QUELLEN"
TSM.L["Sources"] = "Quellen"
TSM.L["Sources to include for restock:"] = "Zu berücksichtigende Quellen für die Aufstockung:"
TSM.L["Stack"] = "Stapel"
TSM.L["Stack / Quantity"] = "Stapel / Anzahl"
TSM.L["Stack size multiple:"] = "Stapelgröße mehrfach:"
TSM.L["Start either a 'Buyout' or 'Bid' sniper using the buttons above."] = "Starten Sie entweder einen \"Sofortkaufen\"- oder \"Bieten\"-Sniper mit den obigen Schaltflächen."
TSM.L["Starting Scan..."] = "Starte Scan..."
TSM.L["STOP"] = "STOP"
TSM.L["Store operations globally"] = "Operationen global speichern"
TSM.L["Subject"] = "Betreff"
TSM.L["SUBJECT"] = "BETREFF"
TSM.L["Switch to %s"] = "Zum %s wechseln"
TSM.L["Switch to WoW UI"] = "Zum WoW UI"
TSM.L["Sync Setup Error: The specified player on the other account is not currently online."] = "Sync-Setup-Fehler: Der angegebene Spieler ist auf dem anderen Account gerade offline."
TSM.L["Sync Setup Error: This character is already part of a known account."] = "Sync-Setup-Fehler: Dieser Charakter gehört bereits zu einem bekannten Account."
TSM.L["Sync Setup Error: You entered the name of the current character and not the character on the other account."] = "Sync-Setup-Fehler: Du hast nicht den Charakter auf dem anderen Account, sondern den Namen des aktuellen Charakters eingegeben."
TSM.L["TAKE ALL"] = "ALLES NEHMEN"
TSM.L["Take Attachments"] = "Anhänge nehmen"
TSM.L["Target Character"] = "Ziel Charakter"
TSM.L["TARGET SHORTFALL TO BAGS"] = "GEZIELTES AUFFÜLLEN DER TASCHEN"
TSM.L["Tasks Added to Task List"] = "Aufgabe wurde zur Aufgabenliste hinzugefügt"
TSM.L["Text (%s)"] = "Text (%s)"
TSM.L["The canlearn filter was ignored because the CanIMogIt addon was not found."] = "Der Canlearn-Filter wurde ignoriert, da das Addon CanIMogIt nicht gefunden wurde."
TSM.L["The 'Craft Value Method' (%s) did not return a value for this item."] = "Die 'Craft Value Method' (%s) lieferte keinen validen Wert für diesen Artikel."
TSM.L["The 'disenchant' price source has been replaced by the more general 'destroy' price source. Please update your custom prices."] = "Die Preisquelle 'disenchant' wurde mit der allgemeineren Preisquelle 'destroy' ersetzt. Bitte aktualisiere deine benutzerdefinierten Preise."
TSM.L["The min profit (%s) did not evalulate to a valid value for this item."] = "Der Min-Gewinn (%s) hat sich nicht zu einem gültigen Wert für diese Position entwickelt."
TSM.L["The name can ONLY contain letters. No spaces, numbers, or special characters."] = "Der Name darf NUR Buchstaben enthalten. Leerzeichen, Zahlen oder Sonderzeichen sind nicht erlaubt."
TSM.L["The number which would be queued (%d) is less than the min restock quantity (%d)."] = "Die Zahl, die in die Warteschlange gestellt werden würde (%d), ist kleiner als die Mindestbestandsmenge (%d)."
TSM.L["The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."] = "Der auf dieses Element angewandte Vorgang ist ungültig! Der minimale Lagerbestand von %d ist höher als der maximale Lagerbestand von %d."
TSM.L["The player \"%s\" is already on your whitelist."] = "Der Spieler \"%s\" ist bereits auf deiner weißen Liste. "
TSM.L["The profit of this item (%s) is below the min profit (%s)."] = "Der Gewinn dieser Position (%s) liegt unter dem Min-Gewinn (%s)."
TSM.L["The seller name of the lowest auction for %s was not given by the server. Skipping this item."] = "Der Name des Verkäufers mit der günstigsten Auktion wurde nicht vom Server übermittelt. Überspringe diesen Gegenstand. "
TSM.L["The TradeSkillMaster_AppHelper addon is not enabled and is required for proper operation of TSM. TSM has enabled it and requires a reload."] = "Das TradeSkillMaster_AppHelper Addon ist nicht aktiviert, wird aber für die ordnungsgemäße Nutzung von TSM benötigt. TSM hat das Addon eingeschaltet und erfordert einen Reload."
TSM.L["The TradeSkillMaster_AppHelper addon is not installed and is required for proper operation of TSM."] = "Das TradeSkillMaster_AppHelper Addon ist nicht installiert, wird aber für die ordnungsgemäße Nutzung von TSM benötigt"
TSM.L["The unlearned filter was ignored because the CanIMogIt addon was not found."] = "Der nicht erlernte Filter wurde ignoriert, da das CanIMogIt Addon nicht gefunden wurde."
TSM.L["There is a crafting cost and crafted item value, but TSM_Crafting wasn't able to calculate a profit. This shouldn't happen!"] = "Es gibt einen Herstellungspreis und einen Wert für handgefertigte Gegenstände, aber TSM_Crafting konnte keinen Gewinn berechnen. Das sollte nicht passieren!"
TSM.L["There is no TSM_Crafting operation applied to this item's TSM group (%s)."] = [=[Es wird kein TSM_Crafting-Vorgang auf die TSM-Gruppe (%s) dieses Artikels angewendet.
]=]
TSM.L["This group already has operations. Would you like to add another one or replace the last one?"] = "Diese Gruppe hat bereits Operationen. Willst du eine weitere hinzufügen oder die letzte ersetzen?"
TSM.L["This group already has the max number of operation. Would you like to replace the last one?"] = "Diese Gruppe hat bereits die maximale Anzahl erlaubter Operationen. Willst du die letzte ersetzen?"
TSM.L["This is not a valid profile name. Profile names must be at least one character long and may not contain '@' characters."] = "Dies ist kein gültiger Profilname. Profilnamen müssen mindestens 1 Zeichen lang sein und dürfen keine @-Zeichen enthalten."
TSM.L["This item does not have a crafting cost. Check that all of its mats have mat prices."] = "Dieser Gegenstand hat keine Herstellungskosten. Überprüfen Sie, ob alle seine Artikel Preise haben."
TSM.L["This item is not in a TSM group."] = "Dieser Gegenstand ist in keiner TSM Gruppe."
TSM.L["This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general TSM_Crafting options."] = "Dieser Gegenstand wird der Warteschlange hinzugefügt, sobald die Gruppe aufgefüllt wird. Wenn das nicht passiert, erstelle einen Post in dem TSM Forum mit einem Screenshot des Gegenstands-Tooltips, Operation-Einstellungen und den allgemeinen TSM_Crafting Optionen. "
TSM.L["This looks like an exported operation and not a custom price."] = "Dies sieht aus wie eine exportierte Operation und nicht wie ein benutzerdefinierter Preis."
TSM.L["This will copy the settings from '%s' into your currently-active one."] = "Kopiere die Einstellungen von Profil '&s' in dein derzeit aktiviertes Profil?"
TSM.L["This will permanently delete the '%s' profile."] = "Dies wird das Profil '%s‘ dauerhaft löschen. "
TSM.L["This will reset all groups and operations (if not stored globally) to be wiped from this profile."] = "Dadurch werden alle Gruppen und Operationen (wenn sie nicht global gespeichert sind) zurückgesetzt, die von diesem Profil gelöscht werden sollen."
TSM.L["Time"] = "Zeit"
TSM.L["Time Format"] = "Zeitformat"
TSM.L["Time Frame"] = "Zeitraum"
TSM.L["TIME FRAME"] = "ZEITRAUM"
TSM.L["TINKER"] = "BASTELN"
TSM.L["Tooltip Price Format"] = "Tooltip Preis Format"
TSM.L["Tooltip Settings"] = "Tooltip Einstellungen"
TSM.L["Top Buyers:"] = "Top Käufe:"
TSM.L["Top Item:"] = "Top Item:"
TSM.L["Top Sellers:"] = "Top Verkäufe:"
TSM.L["Total"] = "Summe"
TSM.L["Total Gold"] = "Gold Summe"
TSM.L["Total Gold Earned:"] = "Summe Gold verdient:"
TSM.L["Total Gold Spent:"] = "Summe Gold ausgegeben:"
TSM.L["Total Price"] = "Gesamtpreis"
TSM.L["Total Profit:"] = "Gesamter Gewinn:"
TSM.L["Total Value"] = "Gesamtwert"
TSM.L["Total Value of All Items: "] = "Gesamtwert aller Items:"
TSM.L["Track Sales / Purchases via trade"] = "Verfolgung von Verkäufen / Einkäufen über den Handel"
TSM.L["TradeSkillMaster Info"] = "TradeSkillMaster Info"
TSM.L["Transform Value"] = "Verwandle Wert"
TSM.L["TSM Banking"] = "TSM Bank"
TSM.L["TSM can sync data automatically between multiple accounts."] = "TSM kann Daten automatisch zwischen mehreren Accounts synchronisieren."
TSM.L["TSM Crafting"] = "TSM Herstellen"
TSM.L["TSM Destroying"] = "TSM Zerstören"
TSM.L["TSM failed to scan some auctions. Please rerun the scan."] = "TSM konnte einige Auktionen nicht scannen. Bitte starten Sie den Scan erneut."
TSM.L["TSM Groups"] = "TSM Gruppen"
TSM.L["TSM is missing important information from the TSM Desktop Application. Please ensure the TSM Desktop Application is running and is properly configured."] = "TSM fehlen wichtige Informationen aus der TSM Desktop App. Bitte stellen Sie sicher, dass die TSM Desktop-Anwendung läuft und ordnungsgemäß konfiguriert ist."
TSM.L["TSM Mailing"] = "TSM Mailing"
TSM.L["TSM TASK LIST"] = "TSM AUFGABENLISTE"
TSM.L["TSM Vendoring"] = "TSM Händler"
TSM.L["TSM Version Info:"] = "TSM-Versionsinfo:"
TSM.L["TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"] = "TSM_Accounting hat festgestellt, dass du gerade %s %s %s gegen %s getauscht hast. Möchten Sie, dass die Buchhaltung eine Aufzeichnung dieses Handels speichert?"
TSM.L["TSM4"] = "TSM4"
TSM.L["TUJ 3-Day Price"] = "TUJ 3-Tage-Preis"
TSM.L["Twitter Integration"] = "Twitter-Integration"
TSM.L["Twitter Integration Not Enabled"] = "Twitter Integration wurde nicht aktiviert"
TSM.L["Type"] = "Schreiben"
TSM.L["Type Something"] = "Schreibe etwas"
TSM.L["Unbalanced parentheses."] = "Ungleichmäßige Klammerung."
TSM.L["Undercut amount:"] = "Unterbietenwert:"
TSM.L["Undercut by whitelisted player."] = "Unterboten von einem Spieler auf der weißen Liste. "
TSM.L["Undercutting blacklisted player."] = "Unterbiete blockierten Spieler. "
TSM.L["Undercutting competition."] = "Unterbiete Wettbewerber."
TSM.L["Ungrouped Items"] = "Nicht gruppierte Items"
TSM.L["Unknown Item"] = "Unbekanntes Item"
TSM.L["Unwrap Gift"] = "Geschenk auspacken"
TSM.L["Up"] = "Nach oben"
TSM.L["UPDATE EXISTING MACRO"] = "AKTUALISIERE VORHANDENES MAKRO"
TSM.L["Usage: /tsm price <ItemLink> <Price String>"] = "Benutzung: /tsm price <ItemLink> <Preistext>"
TSM.L["Use smart average for purchase price"] = "Intelligenter Durchschnitt für den Einkaufspreis verwenden"
TSM.L["Use the field below to search the auction house by filter"] = "Verwende das untere Eingabefeld, um das AH nach Suchwörtern zu filtern"
TSM.L["Use the list to the left to select groups, & operations you'd like to create export strings for."] = "Wähle aus der Liste links, die Gruppen und Operationen, welche du exportieren willst."
TSM.L["VALUE PRICE SOURCE"] = "WERTPREISQUELLE"
TSM.L["ValueSources"] = "Wertquellen"
TSM.L["Variable Name"] = "Namen der Variablen"
TSM.L["Vendor"] = "Verkäufer"
TSM.L["Vendor Buy Price"] = "Händler Kaufpreis"
TSM.L["Vendor Search"] = "Händlersuche"
TSM.L["VENDOR SEARCH"] = "HÄNDLERSUCHE"
TSM.L["Vendor Sell"] = "Händlerverkauf"
TSM.L["Vendor Sell Price"] = "Händler Verkaufspreis"
TSM.L["Vendoring 'SELL ALL' Button"] = "Verkaufen 'SELL ALL' Button"
TSM.L["View ignored items in the Destroying options."] = "Zeigen Sie ignorierte Elemente in den Optionen des Zerstörungsmoduls an."
TSM.L["Warehousing"] = "Lagerhaltung"
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Die Lagerhaltung bewegt ein Maximum von %d von jedem Gegenstand in dieser Gruppe und behält %d von jedem Gegenstand zurück, wenn Taschen > Bank/Gildenbank, %d von jedem Gegenstand zurück, wenn Bank/Gildenbank > Taschen."
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Die Lagerhaltung bewegt ein Maximum von %d von jedem Gegenstand in dieser Gruppe und behält %d von jedem Gegenstand zurück, wenn Taschen > Bank/Gildenbank, %d von jedem Gegenstand zurück, wenn Bank/Gildenbank > Taschen. Die Wiederbevorratung ist so angelegt, dass %d-Artikel in deinen Taschen bleiben."
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."] = "Die Lagerhaltung bewegt ein Maximum von %d von jedem Gegenstand in dieser Gruppe und hält %d von jedem Gegenstand zurück, wenn Taschen > Bank/Gildenbank."
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Die Lagerhaltung bewegt ein Maximum von %d von jedem Gegenstand in dieser Gruppe und hält %d von jedem Gegenstand zurück, wenn Taschen > Bank/Gildenbank. Die Wiederbevorratung hält %d Artikel in Ihren Taschen."
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."] = "Die Lagerung bewegt ein Maximum von %d von jedem Gegenstand in dieser Gruppe und hält %d von jedem Gegenstand zurück, wenn Bank/Gildenbank > Taschen."
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Die Lagerung bewegt ein Maximum von %d von jedem Gegenstand in dieser Gruppe und hält %d von jedem Gegenstand zurück, wenn Bank/Gildenbank > Taschen. Die Lagerhaltung behält %d Artikel in Ihren Taschen."
TSM.L["Warehousing will move a max of %d of each item in this group."] = "Die Lagerhaltung verschiebt maximal %d jedes Artikels in dieser Gruppe."
TSM.L["Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."] = [=[Die Lagerhaltung verschiebt maximal %d jedes Artikels in dieser Gruppe. Die Wiederbevorratung hält %d Artikel in Ihren Taschen.
]=]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Die Lagerhaltung verschiebt alle Gegenstände in dieser Gruppe und behält %d von jedem Gegenstand zurück, wenn Taschen > Bank/Gildenbank, %d von jedem Gegenstand zurück, wenn Bank/Gildenbank > Taschen."
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Die Lagerhaltung verschiebt alle Gegenstände in dieser Gruppe und behält %d von jedem Gegenstand zurück, wenn Taschen > Bank/Gildenbank, %d von jedem Gegenstand zurück, wenn Bank/Gildenbank > Taschen. Die Lagerbestände werden %d Artikel in Ihren Taschen beibehalten."
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."] = "Die Lagerhaltung verschiebt alle Gegenstände in dieser Gruppe und hält %d von jedem Gegenstand zurück, wenn Taschen > Bank/Gildenbank."
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Die Lagerhaltung verschiebt alle Gegenstände in dieser Gruppe und hält %d von jedem Gegenstand zurück, wenn Taschen > Bank/Gildenbank. Die Wiederbevorratung behält %d Artikel in Ihren Taschen."
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."] = "Die Lagerung verschiebt alle Gegenstände in dieser Gruppe und hält %d von jedem Gegenstand zurück, wenn Bank/Gildenbank > Taschen."
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Die Lagerhaltung verschiebt alle Gegenstände in dieser Gruppe und hält %d von jedem Gegenstand zurück, wenn Bank/Gildenbank > Taschen. Die Wiederbevorratung behält %d Artikel in Ihren Taschen."
TSM.L["Warehousing will move all of the items in this group."] = "Die Lagerhaltung verschiebt alle Gegenstände dieser Gruppe."
TSM.L["Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."] = "Die Lagerhaltung verschiebt alle Gegenstände dieser Gruppe. Die Wiederbevorratung behält %d Artikel in Ihren Taschen."
TSM.L["WARNING: The macro was too long, so was truncated to fit by WoW."] = "WARNUNG: Das Makro war zu lang und wurde deshalb von WoW auf eine passende Größe gekürzt."
TSM.L["WARNING: You minimum price for %s is below its vendorsell price (with AH cut taken into account). Consider raising your minimum price, or vendoring the item."] = "WARNUNG: Dein minimum Preis für %s ist unter dem Händlerverkaufspreis (AH-Schnitt berücksichtigt). Erwäge deinen minimum Preis anzuheben oder den Gegenstand beim Händler zu verkaufen."
TSM.L["When above maximum:"] = "Wenn über maximun:"
TSM.L["When below minimum:"] = "Wenn unter minimum:"
TSM.L["Whitelist"] = "Weiße Liste"
TSM.L["Whitelisted Players"] = "Spieler auf der weißen Liste"
TSM.L["You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"] = "Du hast bereits deine max Auffüllmenge für diesen Gegenstand. Du hast %d und die max Auffüllmenge ist %d"
TSM.L["You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."] = "Du kannst die Optionen unten benutzen, um veraltete Daten zu löschen. Es wird empfohlen, veraltete Daten gelegentlich zu löschen, damit das Accounting Modul problemlos funktioniert. Wähle die Anzahl vergangener Tage, um die veralteten Daten zu löschen, dann klicke '%s'."
TSM.L["You cannot use %s as part of this custom price."] = "Du kannst %s nicht als Teil von diesem benutzerdefinierten Preis verwenden."
TSM.L["You cannot use %s within convert() as part of this custom price."] = "Du kannst % innerhalb von convert() nicht als Teil dieses benutzerdefinierten Preises benutzen."
TSM.L["You do not need to add \"%s\", alts are whitelisted automatically."] = "Du brauchst \"%s\" nicht hinzufügen, Twinks kommen automatisch auf die weiße Liste. "
TSM.L["You don't know how to craft this item."] = "Du weißt nicht wie man dieses Item herstellt."
TSM.L["You must reload your UI for these settings to take effect. Reload now?"] = "Du musst dein UI neu laden, um diese Einstellungen wirksam werden zu lassen. Jetzt neu laden?"
TSM.L["You won an auction for %sx%d for %s"] = "Du hast die Auktion %sx%d mit %s gewonnen"
TSM.L["Your auction has not been undercut."] = "Deine Auktion wurde nicht unterboten."
TSM.L["Your auction of %s expired"] = "Deine Auktion von %s ist ausgelaufen."
TSM.L["Your auction of %s has sold for %s!"] = "Deine Auktion %s wurde für %s verkauft!"
TSM.L["Your Buyout"] = "Dein Sofortkaufpreis"
TSM.L["Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"] = "Deine Handwerkswertmethode für'%s' war ungültig, so dass sie auf den Standard zurückgesetzt wurde. Details: %s"
TSM.L["Your default craft value method was invalid so it has been returned to the default. Details: %s"] = "Dein Standardherstellungswert war ungültig, so wurde dieser zu dem Standard zurückgesetzt. Details: %s"
TSM.L["Your task list is currently empty."] = "Deine Aufgabenliste ist aktuell leer. "
TSM.L["You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."] = "Du wurdest phasenverschoben, was dazu geführt hat, dass der AH wegen eines Fehlers auf der Seite von Blizzard nicht mehr funktioniert. Bitte schließen und öffnen Sie das AH und starten Sie den Sniper neu."
TSM.L["You've been undercut."] = "Du wurdest unterboten."
TSM.L["YY/MM/DD HH:MM"] = "YY/MM/DD HH:MM"
	elseif locale == "esES" then
TSM.L = TSM.L or {}
--[[Translation missing --]]
TSM.L["%d |4Group:Groups; Selected (%d |4Item:Items;)"] = "%d |4Group:Groups; Selected (%d |4Item:Items;)"
TSM.L["%d auctions"] = "%d subastas"
TSM.L["%d Groups"] = "%d Grupos"
TSM.L["%d Items"] = "%d Objetos"
TSM.L["%d of %d"] = "%d de %d"
TSM.L["%d Operations"] = "%d Operaciones"
TSM.L["%d Posted Auctions"] = "%d Subastas Publicadas"
TSM.L["%d Sold Auctions"] = "%d Subastas Vendidas"
TSM.L["%s (%s bags, %s bank, %s AH, %s mail)"] = "%s (%s bolsas, %s banco, %s casa de subastas, %s correo)"
TSM.L["%s (%s player, %s alts, %s guild, %s AH)"] = "%s (%s jugador, %s alters, %s hermandad, %s casa de subastas)"
TSM.L["%s (%s profit)"] = "%s (%s de beneficio)"
TSM.L["%s ago"] = "hace %s"
TSM.L["%s Crafts"] = "%s Creados"
TSM.L["%s in guild vault"] = "%s en la cámara de hermandad"
TSM.L["%s is a valid custom price but %s is an invalid item."] = "%s es un precio personalizado válido pero %s es un objeto no válido."
TSM.L["%s is a valid custom price but did not give a value for %s."] = "%s es un precio personalizado válido pero no dio ningún valor para %s."
TSM.L["'%s' is an invalid operation! Min restock of %d is higher than max restock of %d."] = "¡'%s' es una operación inválida! Reabastecer (Mín.) %d es mayor que Reabastecer (Máx.) %d."
TSM.L["%s is not a valid custom price and gave the following error: %s"] = "%s es un precio personalizado no válido que provocó el siguiente error: %s"
TSM.L["%s operation(s)"] = "%s operación(es)"
TSM.L["%s removed."] = "%s borrado."
TSM.L["%s sent you %s"] = "%s te ha enviado %s"
TSM.L["%s sent you %s and %s"] = "%s te ha enviado %s y %s"
TSM.L["%s sent you a COD of %s for %s"] = "%s te ha enviado un correo a contrarreembolso de %s por %s"
TSM.L["%s sent you a message: %s"] = "%s te ha enviado un mensaje: %s"
TSM.L["%s total"] = "%s total"
TSM.L["%sDrag%s to move this button"] = "%sDrag%s para mover este botón"
TSM.L["%sLeft-Click%s to open the main window"] = "%sLeft-Click%s para abrir la ventana principal"
--[[Translation missing --]]
TSM.L["(%d/500 Characters)"] = "(%d/500 Characters)"
--[[Translation missing --]]
TSM.L["(max %d)"] = "(max %d)"
--[[Translation missing --]]
TSM.L["(max 200)"] = "(max 200)"
--[[Translation missing --]]
TSM.L["(max 5000)"] = "(max 5000)"
--[[Translation missing --]]
TSM.L["(min %d - max %d)"] = "(min %d - max %d)"
--[[Translation missing --]]
TSM.L["(min 0 - max 10000)"] = "(min 0 - max 10000)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 2)"] = "(minimum 0 - maximum 2)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 20)"] = "(minimum 0 - maximum 20)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 2000)"] = "(minimum 0 - maximum 2000)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 30)"] = "(minimum 0 - maximum 30)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 905)"] = "(minimum 0 - maximum 905)"
--[[Translation missing --]]
TSM.L["(minimum 0% - maximum 50%)"] = "(minimum 0% - maximum 50%)"
--[[Translation missing --]]
TSM.L["(minimum 0.5 - maximum 10)"] = "(minimum 0.5 - maximum 10)"
--[[Translation missing --]]
TSM.L["(minimum 1 - maximum 100)"] = "(minimum 1 - maximum 100)"
--[[Translation missing --]]
TSM.L["(minimum 8 - maximum 25)"] = "(minimum 8 - maximum 25)"
--[[Translation missing --]]
TSM.L["(New group(s) will be created)"] = "(New group(s) will be created)"
TSM.L["/tsm help|r - Shows this help listing"] = "/tsm help|r - Muestra este listado de ayuda."
TSM.L["/tsm|r - opens the main TSM window."] = "/tsm|r - Abre la ventana principal de TSM."
--[[Translation missing --]]
TSM.L["_ Hr _ Min ago"] = "_ Hr _ Min ago"
--[[Translation missing --]]
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."] = "|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."
--[[Translation missing --]]
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."] = "|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."
--[[Translation missing --]]
TSM.L["|cffff0000WARNING:|r TSM_AuctionDB doesn't currently have any pricing data for your realm. Either download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update TSM_AuctionDB's data, or run a manual scan in-game."] = "|cffff0000WARNING:|r TSM_AuctionDB doesn't currently have any pricing data for your realm. Either download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update TSM_AuctionDB's data, or run a manual scan in-game."
--[[Translation missing --]]
TSM.L["|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."] = "|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."
--[[Translation missing --]]
TSM.L["|cffffd839Left-Click|r to ignore an item this session."] = "|cffffd839Left-Click|r to ignore an item this session."
--[[Translation missing --]]
TSM.L["|cffffd839Shift-Left-Click|r to ignore it permanently."] = "|cffffd839Shift-Left-Click|r to ignore it permanently."
--[[Translation missing --]]
TSM.L["1 Group"] = "1 Group"
--[[Translation missing --]]
TSM.L["1 Item"] = "1 Item"
--[[Translation missing --]]
TSM.L["12 hr"] = "12 hr"
--[[Translation missing --]]
TSM.L["24 hr"] = "24 hr"
--[[Translation missing --]]
TSM.L["48 hr"] = "48 hr"
TSM.L["A custom price of %s for %s evaluates to %s."] = "Un precio personalizado de %s para %s se estima en %s."
TSM.L["A maximum of 1 convert() function is allowed."] = "Sólo se permite una única función convert()."
--[[Translation missing --]]
TSM.L["A scan is already in progress. Please stop that scan before starting another one."] = "A scan is already in progress. Please stop that scan before starting another one."
--[[Translation missing --]]
TSM.L["Above max expires."] = "Above max expires."
--[[Translation missing --]]
TSM.L["Above max price. Not posting."] = "Above max price. Not posting."
--[[Translation missing --]]
TSM.L["Above max price. Posting at max price."] = "Above max price. Posting at max price."
--[[Translation missing --]]
TSM.L["Above max price. Posting at min price."] = "Above max price. Posting at min price."
--[[Translation missing --]]
TSM.L["Above max price. Posting at normal price."] = "Above max price. Posting at normal price."
--[[Translation missing --]]
TSM.L["Accepting these item(s) will cost"] = "Accepting these item(s) will cost"
--[[Translation missing --]]
TSM.L["Accepting this item will cost"] = "Accepting this item will cost"
--[[Translation missing --]]
TSM.L["Account sync removed. Please delete the account sync from the other account as well."] = "Account sync removed. Please delete the account sync from the other account as well."
TSM.L["Account Syncing"] = "Sincronizar Cuentas"
--[[Translation missing --]]
TSM.L["Accounting"] = "Accounting"
--[[Translation missing --]]
TSM.L["Accounting Tooltips"] = "Accounting Tooltips"
TSM.L["Activity Type"] = "Tipo de actividad"
--[[Translation missing --]]
TSM.L["ADD %d ITEMS"] = "ADD %d ITEMS"
--[[Translation missing --]]
TSM.L["Add / Remove Items"] = "Add / Remove Items"
--[[Translation missing --]]
TSM.L["ADD NEW CUSTOM PRICE SOURCE"] = "ADD NEW CUSTOM PRICE SOURCE"
--[[Translation missing --]]
TSM.L["ADD OPERATION"] = "ADD OPERATION"
--[[Translation missing --]]
TSM.L["Add Player"] = "Add Player"
--[[Translation missing --]]
TSM.L["Add Subject / Description"] = "Add Subject / Description"
--[[Translation missing --]]
TSM.L["Add Subject / Description (Optional)"] = "Add Subject / Description (Optional)"
--[[Translation missing --]]
TSM.L["ADD TO MAIL"] = "ADD TO MAIL"
TSM.L["Additional error suppressed"] = "Error adicional suprimido"
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be auctioned."] = "Adjust the settings below to set how groups attached to this operation will be auctioned."
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be cancelled."] = "Adjust the settings below to set how groups attached to this operation will be cancelled."
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be priced."] = "Adjust the settings below to set how groups attached to this operation will be priced."
--[[Translation missing --]]
TSM.L["Advanced Item Search"] = "Advanced Item Search"
--[[Translation missing --]]
TSM.L["Advanced Options"] = "Advanced Options"
TSM.L["AH"] = "Casa de Subastas"
--[[Translation missing --]]
TSM.L["AH (Crafting)"] = "AH (Crafting)"
--[[Translation missing --]]
TSM.L["AH (Disenchanting)"] = "AH (Disenchanting)"
--[[Translation missing --]]
TSM.L["AH BUSY"] = "AH BUSY"
--[[Translation missing --]]
TSM.L["AH Frame Options"] = "AH Frame Options"
--[[Translation missing --]]
TSM.L["AH Rows Shown (requires reload)"] = "AH Rows Shown (requires reload)"
TSM.L["Alarm Clock"] = "Alarma"
--[[Translation missing --]]
TSM.L["All Auctions"] = "All Auctions"
--[[Translation missing --]]
TSM.L["All Characters and Guilds"] = "All Characters and Guilds"
--[[Translation missing --]]
TSM.L["All Professions"] = "All Professions"
--[[Translation missing --]]
TSM.L["Allow partial stack?"] = "Allow partial stack?"
--[[Translation missing --]]
TSM.L["Alt Guild Bank"] = "Alt Guild Bank"
--[[Translation missing --]]
TSM.L["Alts"] = "Alts"
--[[Translation missing --]]
TSM.L["Alts AH"] = "Alts AH"
--[[Translation missing --]]
TSM.L["Amount"] = "Amount"
--[[Translation missing --]]
TSM.L["AMOUNT"] = "AMOUNT"
--[[Translation missing --]]
TSM.L["Amount of Bag Space to Keep Free"] = "Amount of Bag Space to Keep Free"
TSM.L["Applied %s to %s."] = "Aplicado %s a %s."
--[[Translation missing --]]
TSM.L["APPLY FILTERS"] = "APPLY FILTERS"
--[[Translation missing --]]
TSM.L["Apply operation to group:"] = "Apply operation to group:"
--[[Translation missing --]]
TSM.L["Are you sure you want to clear old accounting data?"] = "Are you sure you want to clear old accounting data?"
TSM.L["Are you sure you want to delete this group?"] = "¿Seguro que quieres borrar este grupo?"
TSM.L["Are you sure you want to delete this operation?"] = "¿Seguro que quieres borrar esta operación?"
--[[Translation missing --]]
TSM.L["Are you sure you want to reset all operation settings?"] = "Are you sure you want to reset all operation settings?"
--[[Translation missing --]]
TSM.L["At above max price and not undercut."] = "At above max price and not undercut."
--[[Translation missing --]]
TSM.L["At normal price and not undercut."] = "At normal price and not undercut."
--[[Translation missing --]]
TSM.L["Auction"] = "Auction"
--[[Translation missing --]]
TSM.L["AUCTION DETAILS"] = "AUCTION DETAILS"
--[[Translation missing --]]
TSM.L["Auction Duration"] = "Auction Duration"
--[[Translation missing --]]
TSM.L["Auction has been bid on."] = "Auction has been bid on."
TSM.L["Auction Window Close"] = "Cerrar Ventana de Subasta"
TSM.L["Auction Window Open"] = "Abrir Ventana de Subasta"
TSM.L["Auctionator - Auction Value"] = "Auctionator - Valor de la subasta"
TSM.L["Auctioneer - Appraiser"] = "Auctioneer - Appraiser"
TSM.L["Auctioneer - Market Value"] = "Auctioneer - Valor de Mercado"
TSM.L["Auctioneer - Minimum Buyout"] = "Auctioneer - Precio de compra mínimo"
--[[Translation missing --]]
TSM.L["Auctioning"] = "Auctioning"
--[[Translation missing --]]
TSM.L["Auctioning Log"] = "Auctioning Log"
--[[Translation missing --]]
TSM.L["Auctioning Operation"] = "Auctioning Operation"
--[[Translation missing --]]
TSM.L["Auctioning 'POST'/'CANCEL' Button"] = "Auctioning 'POST'/'CANCEL' Button"
TSM.L["Auctions"] = "Subastas"
TSM.L["Auto Quest Complete"] = "Autocompletar Misiones"
--[[Translation missing --]]
TSM.L["Automatically sell vendor trash?"] = "Automatically sell vendor trash?"
--[[Translation missing --]]
TSM.L["Average Earned Per Day:"] = "Average Earned Per Day:"
--[[Translation missing --]]
TSM.L["Average Prices:"] = "Average Prices:"
--[[Translation missing --]]
TSM.L["Average Profit Per Day:"] = "Average Profit Per Day:"
--[[Translation missing --]]
TSM.L["Average Spent Per Day:"] = "Average Spent Per Day:"
--[[Translation missing --]]
TSM.L["Avg Buy Price"] = "Avg Buy Price"
--[[Translation missing --]]
TSM.L["Avg Resale Profit"] = "Avg Resale Profit"
--[[Translation missing --]]
TSM.L["Avg Sell Price"] = "Avg Sell Price"
--[[Translation missing --]]
TSM.L["BACK TO LIST"] = "BACK TO LIST"
--[[Translation missing --]]
TSM.L["Back to List"] = "Back to List"
TSM.L["Bag"] = "Bolsa"
TSM.L["Bags"] = "Bolsas"
TSM.L["Banks"] = "Bancos"
--[[Translation missing --]]
TSM.L["BankUI Move Delay"] = "BankUI Move Delay"
TSM.L["Base Group"] = "Grupo base"
--[[Translation missing --]]
TSM.L["Base Item"] = "Base Item"
--[[Translation missing --]]
TSM.L["Batch size"] = "Batch size"
TSM.L["Below are your currently available price sources organized by module. The %skey|r is what you would type into a custom price box."] = "Aquí se muestran las listas de precios disponibles por módulos. Se muestra como %skey|r Lo que puedes escribir en las casillas de precios."
--[[Translation missing --]]
TSM.L["Below custom price:"] = "Below custom price:"
--[[Translation missing --]]
TSM.L["Below min price. Posting at max price."] = "Below min price. Posting at max price."
--[[Translation missing --]]
TSM.L["Below min price. Posting at min price."] = "Below min price. Posting at min price."
--[[Translation missing --]]
TSM.L["Below min price. Posting at normal price."] = "Below min price. Posting at normal price."
--[[Translation missing --]]
TSM.L["Below, you can manage your profiles which allow you to have entirely different sets of groups."] = "Below, you can manage your profiles which allow you to have entirely different sets of groups."
--[[Translation missing --]]
TSM.L["Bid %d / %d"] = "Bid %d / %d"
--[[Translation missing --]]
TSM.L["Bid (item)"] = "Bid (item)"
--[[Translation missing --]]
TSM.L["Bid (stack)"] = "Bid (stack)"
--[[Translation missing --]]
TSM.L["Bid Price"] = "Bid Price"
--[[Translation missing --]]
TSM.L["Bid Sniper Paused"] = "Bid Sniper Paused"
--[[Translation missing --]]
TSM.L["Bid Sniper Running"] = "Bid Sniper Running"
--[[Translation missing --]]
TSM.L["Blacklisted players:"] = "Blacklisted players:"
--[[Translation missing --]]
TSM.L["Bought"] = "Bought"
--[[Translation missing --]]
TSM.L["Bought %sx%d for %s from %s"] = "Bought %sx%d for %s from %s"
--[[Translation missing --]]
TSM.L["Bound Actions"] = "Bound Actions"
--[[Translation missing --]]
TSM.L["BUSY"] = "BUSY"
--[[Translation missing --]]
TSM.L["BUY"] = "BUY"
--[[Translation missing --]]
TSM.L["Buy"] = "Buy"
--[[Translation missing --]]
TSM.L["Buy %d / %d"] = "Buy %d / %d"
--[[Translation missing --]]
TSM.L["Buy %d / %d (Confirming %d / %d)"] = "Buy %d / %d (Confirming %d / %d)"
--[[Translation missing --]]
TSM.L["Buy from AH"] = "Buy from AH"
TSM.L["Buy from Vendor"] = "Comprar al Vendedor"
--[[Translation missing --]]
TSM.L["BUY GROUPS"] = "BUY GROUPS"
--[[Translation missing --]]
TSM.L["Buy Options"] = "Buy Options"
--[[Translation missing --]]
TSM.L["BUYBACK ALL"] = "BUYBACK ALL"
--[[Translation missing --]]
TSM.L["Buyer/Seller"] = "Buyer/Seller"
--[[Translation missing --]]
TSM.L["Buyout (item)"] = "Buyout (item)"
--[[Translation missing --]]
TSM.L["Buyout (stack)"] = "Buyout (stack)"
--[[Translation missing --]]
TSM.L["Buyout Price"] = "Buyout Price"
--[[Translation missing --]]
TSM.L["Buyout Sniper Paused"] = "Buyout Sniper Paused"
--[[Translation missing --]]
TSM.L["Buyout Sniper Running"] = "Buyout Sniper Running"
--[[Translation missing --]]
TSM.L["BUYS"] = "BUYS"
--[[Translation missing --]]
TSM.L["By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."] = "By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."
--[[Translation missing --]]
TSM.L["Can Craft At Least One, Profit, Craftable Quantity"] = "Can Craft At Least One, Profit, Craftable Quantity"
--[[Translation missing --]]
TSM.L["Cancel auctions with bids"] = "Cancel auctions with bids"
--[[Translation missing --]]
TSM.L["Cancel Scan"] = "Cancel Scan"
--[[Translation missing --]]
TSM.L["Cancel to repost higher?"] = "Cancel to repost higher?"
--[[Translation missing --]]
TSM.L["Cancel undercut auctions?"] = "Cancel undercut auctions?"
TSM.L["Canceling"] = "Cancelando"
--[[Translation missing --]]
TSM.L["Canceling %d / %d"] = "Canceling %d / %d"
--[[Translation missing --]]
TSM.L["Canceling %d Auctions..."] = "Canceling %d Auctions..."
--[[Translation missing --]]
TSM.L["Canceling all auctions."] = "Canceling all auctions."
--[[Translation missing --]]
TSM.L["Canceling auction which you've undercut."] = "Canceling auction which you've undercut."
--[[Translation missing --]]
TSM.L["Canceling disabled."] = "Canceling disabled."
--[[Translation missing --]]
TSM.L["Canceling Settings"] = "Canceling Settings"
--[[Translation missing --]]
TSM.L["Canceling to repost at higher price."] = "Canceling to repost at higher price."
--[[Translation missing --]]
TSM.L["Canceling to repost at reset price."] = "Canceling to repost at reset price."
--[[Translation missing --]]
TSM.L["Canceling to repost higher."] = "Canceling to repost higher."
--[[Translation missing --]]
TSM.L["Canceling undercut auctions and to repost higher."] = "Canceling undercut auctions and to repost higher."
--[[Translation missing --]]
TSM.L["Canceling undercut auctions."] = "Canceling undercut auctions."
TSM.L["Cancelled"] = "Cancelado"
--[[Translation missing --]]
TSM.L["Cancelled auction of %sx%d"] = "Cancelled auction of %sx%d"
--[[Translation missing --]]
TSM.L["Cancelled Since Last Sale"] = "Cancelled Since Last Sale"
--[[Translation missing --]]
TSM.L["CANCELS"] = "CANCELS"
--[[Translation missing --]]
TSM.L["Cannot repair from the guild bank!"] = "Cannot repair from the guild bank!"
TSM.L["Can't load TSM tooltip while in combat"] = "No se puede cargar la información del TSM mientras estás en combate"
TSM.L["Cash Register"] = "Caja registradora"
--[[Translation missing --]]
TSM.L["Character"] = "Character"
--[[Translation missing --]]
TSM.L["CHARACTER"] = "CHARACTER"
--[[Translation missing --]]
TSM.L["Character Bags"] = "Character Bags"
--[[Translation missing --]]
TSM.L["Character Bank"] = "Character Bank"
--[[Translation missing --]]
TSM.L["CHARACTERS"] = "CHARACTERS"
TSM.L["Chat Tab"] = "Pestaña de Chat"
--[[Translation missing --]]
TSM.L["Cheapest auction below min price."] = "Cheapest auction below min price."
--[[Translation missing --]]
TSM.L["Clean Automatically"] = "Clean Automatically"
TSM.L["Clear"] = "Restablecer"
TSM.L["Clear All"] = "Limpiar todo"
--[[Translation missing --]]
TSM.L["CLEAR DATA"] = "CLEAR DATA"
--[[Translation missing --]]
TSM.L["Clear Filters"] = "Clear Filters"
--[[Translation missing --]]
TSM.L["Clear Log After 'X' Amount of Days"] = "Clear Log After 'X' Amount of Days"
TSM.L["Clear Old Data"] = "Borrar datos antiguos"
--[[Translation missing --]]
TSM.L["Clear Old Data Confirmation"] = "Clear Old Data Confirmation"
--[[Translation missing --]]
TSM.L["Clear Queue"] = "Clear Queue"
TSM.L["Clear Selection"] = "Restablecer Selección"
--[[Translation missing --]]
TSM.L["COD"] = "COD"
TSM.L["Coins (%s)"] = "Monedas (%s)"
--[[Translation missing --]]
TSM.L["Combine Partial Stacks"] = "Combine Partial Stacks"
--[[Translation missing --]]
TSM.L["Combining..."] = "Combining..."
--[[Translation missing --]]
TSM.L["Configuration Scroll Wheel"] = "Configuration Scroll Wheel"
--[[Translation missing --]]
TSM.L["Confirm"] = "Confirm"
--[[Translation missing --]]
TSM.L["Confirm Complete Sound"] = "Confirm Complete Sound"
--[[Translation missing --]]
TSM.L["Confirming %d / %d"] = "Confirming %d / %d"
TSM.L["Connected to %s"] = "Conectado con %s"
--[[Translation missing --]]
TSM.L["Connecting to %s"] = "Connecting to %s"
TSM.L["CONTACTS"] = "CONTACTOS"
--[[Translation missing --]]
TSM.L["Contacts Menu"] = "Contacts Menu"
--[[Translation missing --]]
TSM.L["Cooldown"] = "Cooldown"
--[[Translation missing --]]
TSM.L["Cooldowns"] = "Cooldowns"
TSM.L["Cost"] = "Precio"
--[[Translation missing --]]
TSM.L["Could not apply %s operation %s to %s - it has too many operations already."] = "Could not apply %s operation %s to %s - it has too many operations already."
--[[Translation missing --]]
TSM.L["Could not apply %s operation to group %s because the group does not exist"] = "Could not apply %s operation to group %s because the group does not exist"
--[[Translation missing --]]
TSM.L["Could not create macro as you already have too many. Delete one of your existing macros and try again."] = "Could not create macro as you already have too many. Delete one of your existing macros and try again."
--[[Translation missing --]]
TSM.L["Could not deserialize input"] = "Could not deserialize input"
--[[Translation missing --]]
TSM.L["Could not find enchanted item from"] = "Could not find enchanted item from"
--[[Translation missing --]]
TSM.L["Could not find pet"] = "Could not find pet"
TSM.L["Could not find profile '%s'. Possible profiles: '%s'"] = "No se pudo encontrar el perfil \"%s\". Sugerencias: \"%s\""
--[[Translation missing --]]
TSM.L["Could not sell items due to not having free bag space available to split a stack of items."] = "Could not sell items due to not having free bag space available to split a stack of items."
--[[Translation missing --]]
TSM.L["Craft"] = "Craft"
--[[Translation missing --]]
TSM.L["CRAFT"] = "CRAFT"
--[[Translation missing --]]
TSM.L["Craft (Unprofitable)"] = "Craft (Unprofitable)"
--[[Translation missing --]]
TSM.L["Craft (When Profitable)"] = "Craft (When Profitable)"
--[[Translation missing --]]
TSM.L["Craft All"] = "Craft All"
--[[Translation missing --]]
TSM.L["CRAFT ALL"] = "CRAFT ALL"
--[[Translation missing --]]
TSM.L["Craft Name"] = "Craft Name"
--[[Translation missing --]]
TSM.L["CRAFT NEXT"] = "CRAFT NEXT"
--[[Translation missing --]]
TSM.L["Craft value method:"] = "Craft value method:"
--[[Translation missing --]]
TSM.L["Craftable Quantity, Profit"] = "Craftable Quantity, Profit"
--[[Translation missing --]]
TSM.L["CRAFTER"] = "CRAFTER"
--[[Translation missing --]]
TSM.L["CRAFTING"] = "CRAFTING"
--[[Translation missing --]]
TSM.L["Crafting"] = "Crafting"
--[[Translation missing --]]
TSM.L["Crafting Cost"] = "Crafting Cost"
--[[Translation missing --]]
TSM.L["Crafting 'CRAFT NEXT' Button"] = "Crafting 'CRAFT NEXT' Button"
--[[Translation missing --]]
TSM.L["Crafting Queue"] = "Crafting Queue"
--[[Translation missing --]]
TSM.L["Crafting Tooltips"] = "Crafting Tooltips"
--[[Translation missing --]]
TSM.L["Crafts"] = "Crafts"
--[[Translation missing --]]
TSM.L["Crafts %d"] = "Crafts %d"
--[[Translation missing --]]
TSM.L["CREATE MACRO"] = "CREATE MACRO"
TSM.L["Create New Operation"] = "Crear Nueva Operación"
--[[Translation missing --]]
TSM.L["CREATE NEW PROFILE"] = "CREATE NEW PROFILE"
TSM.L["Crystals"] = "Cristales"
--[[Translation missing --]]
TSM.L["Current Profiles"] = "Current Profiles"
--[[Translation missing --]]
TSM.L["CURRENT SEARCH"] = "CURRENT SEARCH"
--[[Translation missing --]]
TSM.L["CUSTOM POST"] = "CUSTOM POST"
--[[Translation missing --]]
TSM.L["Custom Price"] = "Custom Price"
TSM.L["Custom Price Source"] = "Fuente de Precio Personalizado"
--[[Translation missing --]]
TSM.L["Custom Sources"] = "Custom Sources"
--[[Translation missing --]]
TSM.L["Database Sources"] = "Database Sources"
--[[Translation missing --]]
TSM.L["DD/MM/YY HH:MM"] = "DD/MM/YY HH:MM"
--[[Translation missing --]]
TSM.L["Default Craft Value Method:"] = "Default Craft Value Method:"
--[[Translation missing --]]
TSM.L["Default Material Cost Method:"] = "Default Material Cost Method:"
--[[Translation missing --]]
TSM.L["Default Price"] = "Default Price"
--[[Translation missing --]]
TSM.L["Default Price Configuration"] = "Default Price Configuration"
--[[Translation missing --]]
TSM.L["Default vendoring page"] = "Default vendoring page"
--[[Translation missing --]]
TSM.L["Define whet priority Gathering gives certain sources."] = "Define whet priority Gathering gives certain sources."
--[[Translation missing --]]
TSM.L["Delete Profile Confirmation"] = "Delete Profile Confirmation"
--[[Translation missing --]]
TSM.L["DEPOSIT REAGENTS"] = "DEPOSIT REAGENTS"
TSM.L["Deselect All Groups"] = "Desmarcar Todos los Grupos"
--[[Translation missing --]]
TSM.L["Deselect All Items"] = "Deselect All Items"
--[[Translation missing --]]
TSM.L["Destroy Next"] = "Destroy Next"
TSM.L["Destroy Value"] = "Valor de Destrucción"
--[[Translation missing --]]
TSM.L["Destroy Value Source"] = "Destroy Value Source"
--[[Translation missing --]]
TSM.L["Destroying"] = "Destroying"
--[[Translation missing --]]
TSM.L["Destroying 'DESTROY NEXT' Button"] = "Destroying 'DESTROY NEXT' Button"
--[[Translation missing --]]
TSM.L["Destroying Tooltips"] = "Destroying Tooltips"
--[[Translation missing --]]
TSM.L["Destroying..."] = "Destroying..."
--[[Translation missing --]]
TSM.L["Details"] = "Details"
--[[Translation missing --]]
TSM.L["Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."] = "Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your maximum price (%s) is invalid. Check your settings."] = "Did not cancel %s because your maximum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your minimum price (%s) is invalid. Check your settings."] = "Did not cancel %s because your minimum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your normal price (%s) is invalid. Check your settings."] = "Did not cancel %s because your normal price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your undercut (%s) is invalid. Check your settings."] = "Did not cancel %s because your undercut (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."] = "Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."
--[[Translation missing --]]
TSM.L["Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."] = "Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."
--[[Translation missing --]]
TSM.L["Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."] = "Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."
--[[Translation missing --]]
TSM.L["Did not post %s because your maximum price (%s) is invalid. Check your settings."] = "Did not post %s because your maximum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your minimum price (%s) is invalid. Check your settings."] = "Did not post %s because your minimum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your normal price (%s) is invalid. Check your settings."] = "Did not post %s because your normal price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your stack size (%d) is higher than the max stack size of the item (%d)."] = "Did not post %s because your stack size (%d) is higher than the max stack size of the item (%d)."
--[[Translation missing --]]
TSM.L["Did not post %s because your undercut (%s) is invalid. Check your settings."] = "Did not post %s because your undercut (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Disable invalid price warnings"] = "Disable invalid price warnings"
--[[Translation missing --]]
TSM.L["Disenchant Search"] = "Disenchant Search"
--[[Translation missing --]]
TSM.L["DISENCHANT SEARCH"] = "DISENCHANT SEARCH"
--[[Translation missing --]]
TSM.L["Disenchant Search Options"] = "Disenchant Search Options"
--[[Translation missing --]]
TSM.L["Disenchant Value"] = "Disenchant Value"
--[[Translation missing --]]
TSM.L["Disenchanting Options"] = "Disenchanting Options"
--[[Translation missing --]]
TSM.L["Display auctioning values"] = "Display auctioning values"
--[[Translation missing --]]
TSM.L["Display cancelled since last sale"] = "Display cancelled since last sale"
--[[Translation missing --]]
TSM.L["Display crafting cost"] = "Display crafting cost"
--[[Translation missing --]]
TSM.L["Display detailed destroy info"] = "Display detailed destroy info"
--[[Translation missing --]]
TSM.L["Display disenchant value"] = "Display disenchant value"
--[[Translation missing --]]
TSM.L["Display global historical price"] = "Display global historical price"
--[[Translation missing --]]
TSM.L["Display global market value avg"] = "Display global market value avg"
--[[Translation missing --]]
TSM.L["Display global min buyout avg"] = "Display global min buyout avg"
--[[Translation missing --]]
TSM.L["Display global sale avg"] = "Display global sale avg"
--[[Translation missing --]]
TSM.L["Display group name"] = "Display group name"
--[[Translation missing --]]
TSM.L["Display historical price"] = "Display historical price"
--[[Translation missing --]]
TSM.L["Display market value"] = "Display market value"
--[[Translation missing --]]
TSM.L["Display mill value"] = "Display mill value"
--[[Translation missing --]]
TSM.L["Display min buyout"] = "Display min buyout"
--[[Translation missing --]]
TSM.L["Display Operation Names"] = "Display Operation Names"
--[[Translation missing --]]
TSM.L["Display prospect value"] = "Display prospect value"
--[[Translation missing --]]
TSM.L["Display purchase info"] = "Display purchase info"
--[[Translation missing --]]
TSM.L["Display region historical price"] = "Display region historical price"
--[[Translation missing --]]
TSM.L["Display region market value avg"] = "Display region market value avg"
--[[Translation missing --]]
TSM.L["Display region min buyout avg"] = "Display region min buyout avg"
--[[Translation missing --]]
TSM.L["Display region sale avg"] = "Display region sale avg"
--[[Translation missing --]]
TSM.L["Display region sale rate"] = "Display region sale rate"
--[[Translation missing --]]
TSM.L["Display region sold per day"] = "Display region sold per day"
--[[Translation missing --]]
TSM.L["Display sale info"] = "Display sale info"
--[[Translation missing --]]
TSM.L["Display sale rate"] = "Display sale rate"
--[[Translation missing --]]
TSM.L["Display shopping max price"] = "Display shopping max price"
--[[Translation missing --]]
TSM.L["Display total money recieved in chat?"] = "Display total money recieved in chat?"
--[[Translation missing --]]
TSM.L["Display transform value"] = "Display transform value"
--[[Translation missing --]]
TSM.L["Display vendor buy price"] = "Display vendor buy price"
--[[Translation missing --]]
TSM.L["Display vendor sell price"] = "Display vendor sell price"
--[[Translation missing --]]
TSM.L["Doing so will also remove any sub-groups attached to this group."] = "Doing so will also remove any sub-groups attached to this group."
--[[Translation missing --]]
TSM.L["Done Canceling"] = "Done Canceling"
--[[Translation missing --]]
TSM.L["Done Posting"] = "Done Posting"
--[[Translation missing --]]
TSM.L["Done Scanning"] = "Done Scanning"
--[[Translation missing --]]
TSM.L["Don't post after this many expires:"] = "Don't post after this many expires:"
--[[Translation missing --]]
TSM.L["Don't Post Items"] = "Don't Post Items"
--[[Translation missing --]]
TSM.L["Don't prompt to record trades"] = "Don't prompt to record trades"
--[[Translation missing --]]
TSM.L["DOWN"] = "DOWN"
--[[Translation missing --]]
TSM.L["Drag in Additional Items (%d/%d Items)"] = "Drag in Additional Items (%d/%d Items)"
--[[Translation missing --]]
TSM.L["Drag Item(s) Into Box"] = "Drag Item(s) Into Box"
--[[Translation missing --]]
TSM.L["Duplicate"] = "Duplicate"
--[[Translation missing --]]
TSM.L["Duplicate Profile Confirmation"] = "Duplicate Profile Confirmation"
TSM.L["Dust"] = "Polvo"
--[[Translation missing --]]
TSM.L["Elevate your gold-making!"] = "Elevate your gold-making!"
--[[Translation missing --]]
TSM.L["Embed TSM tooltips"] = "Embed TSM tooltips"
--[[Translation missing --]]
TSM.L["EMPTY BAGS"] = "EMPTY BAGS"
TSM.L["Empty parentheses are not allowed"] = "Paréntesis vacíos no permitidos"
TSM.L["Empty price string."] = "Cadena de precio vacía."
--[[Translation missing --]]
TSM.L["Enable automatic stack combination"] = "Enable automatic stack combination"
--[[Translation missing --]]
TSM.L["Enable buying?"] = "Enable buying?"
--[[Translation missing --]]
TSM.L["Enable inbox chat messages"] = "Enable inbox chat messages"
--[[Translation missing --]]
TSM.L["Enable restock?"] = "Enable restock?"
--[[Translation missing --]]
TSM.L["Enable selling?"] = "Enable selling?"
--[[Translation missing --]]
TSM.L["Enable sending chat messages"] = "Enable sending chat messages"
--[[Translation missing --]]
TSM.L["Enable smart crafting for quests"] = "Enable smart crafting for quests"
--[[Translation missing --]]
TSM.L["Enable TSM Tooltips"] = "Enable TSM Tooltips"
--[[Translation missing --]]
TSM.L["Enable tweet enhancement"] = "Enable tweet enhancement"
--[[Translation missing --]]
TSM.L["Enchant Vellum"] = "Enchant Vellum"
--[[Translation missing --]]
TSM.L["Enter a name for the new profile"] = "Enter a name for the new profile"
--[[Translation missing --]]
TSM.L["Enter Filter"] = "Enter Filter"
--[[Translation missing --]]
TSM.L["Enter Keyword"] = "Enter Keyword"
--[[Translation missing --]]
TSM.L["Enter name of logged-in character from other account"] = "Enter name of logged-in character from other account"
--[[Translation missing --]]
TSM.L["Enter player name"] = "Enter player name"
TSM.L["Essences"] = "Esencias"
TSM.L["Establishing connection to %s. Make sure that you've entered this character's name on the other account."] = "Establecimiendo conexión con %s. Asegúrate de que has introducido el nombre de este personaje en la otra cuenta."
--[[Translation missing --]]
TSM.L["Estimated Cost:"] = "Estimated Cost:"
--[[Translation missing --]]
TSM.L["Estimated Profit:"] = "Estimated Profit:"
--[[Translation missing --]]
TSM.L["Exact Match Only?"] = "Exact Match Only?"
--[[Translation missing --]]
TSM.L["Exclude crafts with cooldowns"] = "Exclude crafts with cooldowns"
--[[Translation missing --]]
TSM.L["Expenses"] = "Expenses"
--[[Translation missing --]]
TSM.L["EXPENSES"] = "EXPENSES"
--[[Translation missing --]]
TSM.L["Expired"] = "Expired"
--[[Translation missing --]]
TSM.L["Expired Since Last Sale"] = "Expired Since Last Sale"
--[[Translation missing --]]
TSM.L["Expires"] = "Expires"
--[[Translation missing --]]
TSM.L["EXPIRES"] = "EXPIRES"
TSM.L["Exploration"] = "Exploración"
--[[Translation missing --]]
TSM.L["Export"] = "Export"
--[[Translation missing --]]
TSM.L["Export List"] = "Export List"
--[[Translation missing --]]
TSM.L["Failed Auctions"] = "Failed Auctions"
--[[Translation missing --]]
TSM.L["Failed Since Last Sale (Expired/Cancelled)"] = "Failed Since Last Sale (Expired/Cancelled)"
--[[Translation missing --]]
TSM.L["Failed to bid on auction of %s."] = "Failed to bid on auction of %s."
--[[Translation missing --]]
TSM.L["Failed to buy auction of %s."] = "Failed to buy auction of %s."
--[[Translation missing --]]
TSM.L["Failed to find auction for %s, so removing it from the results."] = "Failed to find auction for %s, so removing it from the results."
--[[Translation missing --]]
TSM.L["Favorite Scans"] = "Favorite Scans"
--[[Translation missing --]]
TSM.L["Favorite Searches"] = "Favorite Searches"
--[[Translation missing --]]
TSM.L["Filter Auctions by Duration"] = "Filter Auctions by Duration"
--[[Translation missing --]]
TSM.L["Filter Auctions by Keyword"] = "Filter Auctions by Keyword"
--[[Translation missing --]]
TSM.L["FILTER BY KEYWORD"] = "FILTER BY KEYWORD"
--[[Translation missing --]]
TSM.L["Filter by Keyword"] = "Filter by Keyword"
--[[Translation missing --]]
TSM.L["Filter group item lists based on the following price source"] = "Filter group item lists based on the following price source"
--[[Translation missing --]]
TSM.L["Filter Items"] = "Filter Items"
--[[Translation missing --]]
TSM.L["Filter Shopping"] = "Filter Shopping"
--[[Translation missing --]]
TSM.L["Finding Selected Auction"] = "Finding Selected Auction"
TSM.L["Fishing Reel In"] = "Pesca - recoger el sedal"
--[[Translation missing --]]
TSM.L["Forget Character"] = "Forget Character"
--[[Translation missing --]]
TSM.L["Found auction sound"] = "Found auction sound"
--[[Translation missing --]]
TSM.L["Friends"] = "Friends"
--[[Translation missing --]]
TSM.L["From"] = "From"
TSM.L["Full"] = "Completo"
--[[Translation missing --]]
TSM.L["Garrison"] = "Garrison"
--[[Translation missing --]]
TSM.L["Gathering"] = "Gathering"
--[[Translation missing --]]
TSM.L["Gathering Search"] = "Gathering Search"
TSM.L["General Options"] = "Opciones Generales"
--[[Translation missing --]]
TSM.L["Get from Bank"] = "Get from Bank"
--[[Translation missing --]]
TSM.L["Get from Guild Bank"] = "Get from Guild Bank"
--[[Translation missing --]]
TSM.L["Global Data Tooltips"] = "Global Data Tooltips"
--[[Translation missing --]]
TSM.L["Global Historical Price"] = "Global Historical Price"
--[[Translation missing --]]
TSM.L["Global Market Value Avg"] = "Global Market Value Avg"
--[[Translation missing --]]
TSM.L["Global Min Buyout Avg"] = "Global Min Buyout Avg"
--[[Translation missing --]]
TSM.L["Global Operation Confirmation"] = "Global Operation Confirmation"
--[[Translation missing --]]
TSM.L["Global Sale Avg"] = "Global Sale Avg"
--[[Translation missing --]]
TSM.L["Gold"] = "Gold"
--[[Translation missing --]]
TSM.L["Gold Earned:"] = "Gold Earned:"
--[[Translation missing --]]
TSM.L["GOLD ON HAND"] = "GOLD ON HAND"
--[[Translation missing --]]
TSM.L["Gold Spent:"] = "Gold Spent:"
--[[Translation missing --]]
TSM.L["GREAT DEALS SEARCH"] = "GREAT DEALS SEARCH"
--[[Translation missing --]]
TSM.L["Group already exists."] = "Group already exists."
TSM.L["Group Management"] = "Administrar Grupo"
--[[Translation missing --]]
TSM.L["Group Operations"] = "Group Operations"
--[[Translation missing --]]
TSM.L["Group Settings"] = "Group Settings"
--[[Translation missing --]]
TSM.L["Grouped Items"] = "Grouped Items"
TSM.L["Groups"] = "Grupos"
--[[Translation missing --]]
TSM.L["Guild"] = "Guild"
--[[Translation missing --]]
TSM.L["Guild Bank"] = "Guild Bank"
--[[Translation missing --]]
TSM.L["GUILDS"] = "GUILDS"
TSM.L["GVault"] = "Cámara Herm."
--[[Translation missing --]]
TSM.L["Have"] = "Have"
--[[Translation missing --]]
TSM.L["Have Materials"] = "Have Materials"
--[[Translation missing --]]
TSM.L["Have Skill Up"] = "Have Skill Up"
--[[Translation missing --]]
TSM.L["Help & Info"] = "Help & Info"
--[[Translation missing --]]
TSM.L["Hide auctions with bids"] = "Hide auctions with bids"
--[[Translation missing --]]
TSM.L["Hide Description"] = "Hide Description"
--[[Translation missing --]]
TSM.L["Hide minimap icon"] = "Hide minimap icon"
--[[Translation missing --]]
TSM.L["Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."] = "Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."
--[[Translation missing --]]
TSM.L["Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."] = "Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."
--[[Translation missing --]]
TSM.L["High Bidder"] = "High Bidder"
--[[Translation missing --]]
TSM.L["Historical Price"] = "Historical Price"
--[[Translation missing --]]
TSM.L["Hold ALT to repair from the guild bank."] = "Hold ALT to repair from the guild bank."
--[[Translation missing --]]
TSM.L["Hr"] = "Hr"
--[[Translation missing --]]
TSM.L["Hrs"] = "Hrs"
--[[Translation missing --]]
TSM.L["I just bought [%s]x%d for %s! %s #TSM4 #warcraft"] = "I just bought [%s]x%d for %s! %s #TSM4 #warcraft"
--[[Translation missing --]]
TSM.L["I just sold [%s] for %s! %s #TSM4 #warcraft"] = "I just sold [%s] for %s! %s #TSM4 #warcraft"
--[[Translation missing --]]
TSM.L["If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."] = "If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."
TSM.L["If you have multiple profile set up with operations, enabling this will cause all but the current profile's operations to be irreversibly lost. Are you sure you want to continue?"] = "Si tienes otros Perfiles configurados con diferentes Operaciones, activar esto hará que todas las Operaciones salvo la del Perfil actual se pierdan de manera irreversible. ¿Seguro que quieres continuar?"
--[[Translation missing --]]
TSM.L["If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."] = "If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."
--[[Translation missing --]]
TSM.L["Ignore Auctions Below Min"] = "Ignore Auctions Below Min"
--[[Translation missing --]]
TSM.L["Ignore auctions by duration?"] = "Ignore auctions by duration?"
--[[Translation missing --]]
TSM.L["Ignore Characters"] = "Ignore Characters"
--[[Translation missing --]]
TSM.L["Ignore duplicate operations?"] = "Ignore duplicate operations?"
TSM.L["Ignore Guilds"] = "Ignorar Hermandades"
--[[Translation missing --]]
TSM.L["Ignore operation on characters:"] = "Ignore operation on characters:"
--[[Translation missing --]]
TSM.L["Ignore operation on faction-realms:"] = "Ignore operation on faction-realms:"
--[[Translation missing --]]
TSM.L["Ignore random enchants?"] = "Ignore random enchants?"
--[[Translation missing --]]
TSM.L["Ignored Cooldowns"] = "Ignored Cooldowns"
--[[Translation missing --]]
TSM.L["Ignored Items"] = "Ignored Items"
TSM.L["ilvl"] = "ilvl"
--[[Translation missing --]]
TSM.L["Import"] = "Import"
--[[Translation missing --]]
TSM.L["IMPORT"] = "IMPORT"
--[[Translation missing --]]
TSM.L["Import %d Items and %s Operations?"] = "Import %d Items and %s Operations?"
--[[Translation missing --]]
TSM.L["Import Groups & Operations"] = "Import Groups & Operations"
--[[Translation missing --]]
TSM.L["Imported Items"] = "Imported Items"
--[[Translation missing --]]
TSM.L["Imported Operations"] = "Imported Operations"
--[[Translation missing --]]
TSM.L["Inbox Settings"] = "Inbox Settings"
--[[Translation missing --]]
TSM.L["Include Attached Operations"] = "Include Attached Operations"
--[[Translation missing --]]
TSM.L["Include operations?"] = "Include operations?"
--[[Translation missing --]]
TSM.L["Include soulbound items"] = "Include soulbound items"
--[[Translation missing --]]
TSM.L["Information"] = "Information"
--[[Translation missing --]]
TSM.L["Invalid custom price entered."] = "Invalid custom price entered."
--[[Translation missing --]]
TSM.L["Invalid custom price source for %s. %s"] = "Invalid custom price source for %s. %s"
TSM.L["Invalid custom price."] = "Precio Personalizado no válido."
TSM.L["Invalid function."] = "Función no válida."
--[[Translation missing --]]
TSM.L["Invalid group name."] = "Invalid group name."
TSM.L["Invalid item link."] = "Enlace a objeto no válido."
--[[Translation missing --]]
TSM.L["Invalid operation name."] = "Invalid operation name."
TSM.L["Invalid operator at end of custom price."] = "Operador no válido al final del precio personalizado."
TSM.L["Invalid parameter to price source."] = "Parámetro no válido para fuente de precio."
--[[Translation missing --]]
TSM.L["Invalid player name."] = "Invalid player name."
TSM.L["Invalid price source in convert."] = "Fuente de precio en conversión no válida."
--[[Translation missing --]]
TSM.L["Invalid price source."] = "Invalid price source."
--[[Translation missing --]]
TSM.L["Invalid seller data returned by server."] = "Invalid seller data returned by server."
TSM.L["Invalid word: '%s'"] = "Palabra no válida: \"%s\""
--[[Translation missing --]]
TSM.L["Inventory"] = "Inventory"
--[[Translation missing --]]
TSM.L["Inventory / Mailing"] = "Inventory / Mailing"
--[[Translation missing --]]
TSM.L["Inventory Options"] = "Inventory Options"
--[[Translation missing --]]
TSM.L["Inventory Tooltip Format"] = "Inventory Tooltip Format"
TSM.L["It appears that you've manually copied your saved variables between accounts which will cause TSM's automatic sync'ing to not work. You'll need to undo this, and/or delete the TradeSkillMaster and TSM_Crafting saved variables files on both accounts (with WoW closed) in order to fix this."] = "Parece que has copiado manualmente tus \"savedvariables\" entre diferentes cuentas, lo cual provoca que la sincronización automática de TSM no funcione. Debes deshacer esto y/o eliminar las \"savedvariables\" de TradeSkillMaster y TSM_Crafting en ambas cuentas (con el WoW cerrado) para resolver esto."
TSM.L["Item"] = "Objeto"
--[[Translation missing --]]
TSM.L["ITEM CLASS"] = "ITEM CLASS"
--[[Translation missing --]]
TSM.L["Item Level"] = "Item Level"
--[[Translation missing --]]
TSM.L["ITEM LEVEL RANGE"] = "ITEM LEVEL RANGE"
TSM.L["Item links may only be used as parameters to price sources."] = "Los enlaces de objetos sólo pueden ser utilizados como parámetros para Fuentes de Precio."
TSM.L["Item Name"] = "Nombre de Objeto"
--[[Translation missing --]]
TSM.L["Item Quality"] = "Item Quality"
--[[Translation missing --]]
TSM.L["ITEM SEARCH"] = "ITEM SEARCH"
--[[Translation missing --]]
TSM.L["ITEM SUBCLASS"] = "ITEM SUBCLASS"
--[[Translation missing --]]
TSM.L["Item Value"] = "Item Value"
--[[Translation missing --]]
TSM.L["Item/Group is invalid (see chat)."] = "Item/Group is invalid (see chat)."
--[[Translation missing --]]
TSM.L["ITEMS"] = "ITEMS"
TSM.L["Items"] = "Objetos"
--[[Translation missing --]]
TSM.L["Items in Bags"] = "Items in Bags"
--[[Translation missing --]]
TSM.L["Keep in bags quantity:"] = "Keep in bags quantity:"
--[[Translation missing --]]
TSM.L["Keep in bank quantity:"] = "Keep in bank quantity:"
--[[Translation missing --]]
TSM.L["Keep posted:"] = "Keep posted:"
--[[Translation missing --]]
TSM.L["Keep quantity:"] = "Keep quantity:"
--[[Translation missing --]]
TSM.L["Keep this amount in bags:"] = "Keep this amount in bags:"
--[[Translation missing --]]
TSM.L["Keep this amount:"] = "Keep this amount:"
--[[Translation missing --]]
TSM.L["Keeping %d."] = "Keeping %d."
--[[Translation missing --]]
TSM.L["Keeping undercut auctions posted."] = "Keeping undercut auctions posted."
--[[Translation missing --]]
TSM.L["Last 14 Days"] = "Last 14 Days"
--[[Translation missing --]]
TSM.L["Last 3 Days"] = "Last 3 Days"
--[[Translation missing --]]
TSM.L["Last 30 Days"] = "Last 30 Days"
--[[Translation missing --]]
TSM.L["LAST 30 DAYS"] = "LAST 30 DAYS"
--[[Translation missing --]]
TSM.L["Last 60 Days"] = "Last 60 Days"
--[[Translation missing --]]
TSM.L["Last 7 Days"] = "Last 7 Days"
--[[Translation missing --]]
TSM.L["LAST 7 DAYS"] = "LAST 7 DAYS"
--[[Translation missing --]]
TSM.L["Last Data Update:"] = "Last Data Update:"
--[[Translation missing --]]
TSM.L["Last Purchased"] = "Last Purchased"
--[[Translation missing --]]
TSM.L["Last Sold"] = "Last Sold"
--[[Translation missing --]]
TSM.L["Level Up"] = "Level Up"
--[[Translation missing --]]
TSM.L["LIMIT"] = "LIMIT"
--[[Translation missing --]]
TSM.L["Link to Another Operation"] = "Link to Another Operation"
--[[Translation missing --]]
TSM.L["List"] = "List"
--[[Translation missing --]]
TSM.L["List materials in tooltip"] = "List materials in tooltip"
--[[Translation missing --]]
TSM.L["Loading Mails..."] = "Loading Mails..."
--[[Translation missing --]]
TSM.L["Loading..."] = "Loading..."
TSM.L["Looks like TradeSkillMaster has encountered an error. Please help the author fix this error by following the instructions shown."] = "Parece que TradeSkillMaster ha encontrado un error. Por favor, ayudar al autor corregir este error, siga las instrucciones que se muestran."
TSM.L["Loop detected in the following custom price:"] = "Reduncia cíclica detectada en el precio personalizado seguido:"
--[[Translation missing --]]
TSM.L["Lowest auction by whitelisted player."] = "Lowest auction by whitelisted player."
TSM.L["Macro created and scroll wheel bound!"] = "Macro creado y rueda de desplazamiento enlazada!"
TSM.L["Macro Setup"] = "Configuración de macro."
TSM.L["Mail"] = "Correo."
--[[Translation missing --]]
TSM.L["Mail Disenchantables"] = "Mail Disenchantables"
--[[Translation missing --]]
TSM.L["Mail Disenchantables Max Quality"] = "Mail Disenchantables Max Quality"
--[[Translation missing --]]
TSM.L["MAIL SELECTED GROUPS"] = "MAIL SELECTED GROUPS"
--[[Translation missing --]]
TSM.L["Mail to %s"] = "Mail to %s"
--[[Translation missing --]]
TSM.L["Mailing"] = "Mailing"
--[[Translation missing --]]
TSM.L["Mailing all to %s."] = "Mailing all to %s."
--[[Translation missing --]]
TSM.L["Mailing Options"] = "Mailing Options"
--[[Translation missing --]]
TSM.L["Mailing up to %d to %s."] = "Mailing up to %d to %s."
--[[Translation missing --]]
TSM.L["Main Settings"] = "Main Settings"
--[[Translation missing --]]
TSM.L["Make Cash On Delivery?"] = "Make Cash On Delivery?"
--[[Translation missing --]]
TSM.L["Management Options"] = "Management Options"
--[[Translation missing --]]
TSM.L["Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."] = "Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."
--[[Translation missing --]]
TSM.L["Map Ping"] = "Map Ping"
--[[Translation missing --]]
TSM.L["Market Value"] = "Market Value"
--[[Translation missing --]]
TSM.L["Market Value Price Source"] = "Market Value Price Source"
--[[Translation missing --]]
TSM.L["Market Value Source"] = "Market Value Source"
--[[Translation missing --]]
TSM.L["Mat Cost"] = "Mat Cost"
--[[Translation missing --]]
TSM.L["Mat Price"] = "Mat Price"
--[[Translation missing --]]
TSM.L["Match stack size?"] = "Match stack size?"
--[[Translation missing --]]
TSM.L["Match whitelisted players"] = "Match whitelisted players"
--[[Translation missing --]]
TSM.L["Material Name"] = "Material Name"
--[[Translation missing --]]
TSM.L["Materials"] = "Materials"
--[[Translation missing --]]
TSM.L["Materials to Gather"] = "Materials to Gather"
--[[Translation missing --]]
TSM.L["Max Destroy Value"] = "Max Destroy Value"
--[[Translation missing --]]
TSM.L["MAX EXPIRES TO BANK"] = "MAX EXPIRES TO BANK"
--[[Translation missing --]]
TSM.L["Max Market Value"] = "Max Market Value"
--[[Translation missing --]]
TSM.L["Max Shopping Price"] = "Max Shopping Price"
--[[Translation missing --]]
TSM.L["Maximum amount already posted."] = "Maximum amount already posted."
--[[Translation missing --]]
TSM.L["Maximum Auction Price (Per Item)"] = "Maximum Auction Price (Per Item)"
--[[Translation missing --]]
TSM.L["Maximum Destroy Value (Enter '0c' to disable)"] = "Maximum Destroy Value (Enter '0c' to disable)"
--[[Translation missing --]]
TSM.L["Maximum disenchant level:"] = "Maximum disenchant level:"
--[[Translation missing --]]
TSM.L["Maximum Disenchant Quality"] = "Maximum Disenchant Quality"
--[[Translation missing --]]
TSM.L["Maximum disenchant search percentage:"] = "Maximum disenchant search percentage:"
--[[Translation missing --]]
TSM.L["Maximum Market Value (Enter '0c' to disable)"] = "Maximum Market Value (Enter '0c' to disable)"
--[[Translation missing --]]
TSM.L["MAXIMUM QUANTITY TO BUY:"] = "MAXIMUM QUANTITY TO BUY:"
--[[Translation missing --]]
TSM.L["Maximum quantity:"] = "Maximum quantity:"
--[[Translation missing --]]
TSM.L["Maximum restock quantity:"] = "Maximum restock quantity:"
--[[Translation missing --]]
TSM.L["Mill Value"] = "Mill Value"
--[[Translation missing --]]
TSM.L["Min"] = "Min"
--[[Translation missing --]]
TSM.L["Min Buyout"] = "Min Buyout"
--[[Translation missing --]]
TSM.L["Min/Normal/Max Prices"] = "Min/Normal/Max Prices"
--[[Translation missing --]]
TSM.L["Minimum Days Old"] = "Minimum Days Old"
--[[Translation missing --]]
TSM.L["Minimum disenchant level:"] = "Minimum disenchant level:"
--[[Translation missing --]]
TSM.L["Minimum expires:"] = "Minimum expires:"
--[[Translation missing --]]
TSM.L["Minimum profit:"] = "Minimum profit:"
--[[Translation missing --]]
TSM.L["MINIMUM RARITY"] = "MINIMUM RARITY"
--[[Translation missing --]]
TSM.L["Minimum restock quantity:"] = "Minimum restock quantity:"
TSM.L["Misplaced comma"] = "Coma fuera de lugar."
--[[Translation missing --]]
TSM.L["Missing Materials"] = "Missing Materials"
--[[Translation missing --]]
TSM.L["MM/DD/YY HH:MM"] = "MM/DD/YY HH:MM"
TSM.L["Modifiers:"] = "Modificado."
--[[Translation missing --]]
TSM.L["Money Frame Open"] = "Money Frame Open"
--[[Translation missing --]]
TSM.L["Money Transfer"] = "Money Transfer"
--[[Translation missing --]]
TSM.L["Most Profitable Item:"] = "Most Profitable Item:"
--[[Translation missing --]]
TSM.L["MOVE"] = "MOVE"
--[[Translation missing --]]
TSM.L["Move already grouped items?"] = "Move already grouped items?"
--[[Translation missing --]]
TSM.L["Move Quantity Settings"] = "Move Quantity Settings"
--[[Translation missing --]]
TSM.L["MOVE TO BAGS"] = "MOVE TO BAGS"
--[[Translation missing --]]
TSM.L["MOVE TO BANK"] = "MOVE TO BANK"
--[[Translation missing --]]
TSM.L["MOVING"] = "MOVING"
--[[Translation missing --]]
TSM.L["Moving"] = "Moving"
--[[Translation missing --]]
TSM.L["Multiple Items"] = "Multiple Items"
--[[Translation missing --]]
TSM.L["My Auctions"] = "My Auctions"
--[[Translation missing --]]
TSM.L["My Auctions 'CANCEL' Button"] = "My Auctions 'CANCEL' Button"
--[[Translation missing --]]
TSM.L["Neat Stacks only?"] = "Neat Stacks only?"
--[[Translation missing --]]
TSM.L["NEED MATS"] = "NEED MATS"
TSM.L["New Group"] = "Nuevo Grupo"
TSM.L["New Operation"] = "Nueva operación."
--[[Translation missing --]]
TSM.L["NEWS AND INFORMATION"] = "NEWS AND INFORMATION"
--[[Translation missing --]]
TSM.L["No Attachments"] = "No Attachments"
--[[Translation missing --]]
TSM.L["No Data"] = "No Data"
--[[Translation missing --]]
TSM.L["No group selected"] = "No group selected"
--[[Translation missing --]]
TSM.L["No item specified. Usage: /tsm restock_help [ITEM_LINK]"] = "No item specified. Usage: /tsm restock_help [ITEM_LINK]"
--[[Translation missing --]]
TSM.L["NO ITEMS"] = "NO ITEMS"
--[[Translation missing --]]
TSM.L["No Materials to Gather"] = "No Materials to Gather"
--[[Translation missing --]]
TSM.L["No Operation Selected"] = "No Operation Selected"
--[[Translation missing --]]
TSM.L["No posting."] = "No posting."
--[[Translation missing --]]
TSM.L["No Profession Opened"] = "No Profession Opened"
--[[Translation missing --]]
TSM.L["No Profession Selected"] = "No Profession Selected"
TSM.L["No profile specified. Possible profiles: '%s'"] = "Perfil no especificado. Perfiles posibles: '% s'"
--[[Translation missing --]]
TSM.L["No recent AuctionDB scan data found."] = "No recent AuctionDB scan data found."
TSM.L["No Sound"] = "Sin sonido."
TSM.L["None"] = "Ninguno."
TSM.L["None (Always Show)"] = "Ninguno (Mostrar siempre)"
--[[Translation missing --]]
TSM.L["None Selected"] = "None Selected"
--[[Translation missing --]]
TSM.L["NONGROUP TO BANK"] = "NONGROUP TO BANK"
--[[Translation missing --]]
TSM.L["Normal"] = "Normal"
--[[Translation missing --]]
TSM.L["Not canceling auction at reset price."] = "Not canceling auction at reset price."
--[[Translation missing --]]
TSM.L["Not canceling auction below min price."] = "Not canceling auction below min price."
--[[Translation missing --]]
TSM.L["Not canceling."] = "Not canceling."
--[[Translation missing --]]
TSM.L["Not enough items in bags."] = "Not enough items in bags."
--[[Translation missing --]]
TSM.L["NOT OPEN"] = "NOT OPEN"
--[[Translation missing --]]
TSM.L["Not Scanned"] = "Not Scanned"
--[[Translation missing --]]
TSM.L["NPC"] = "NPC"
--[[Translation missing --]]
TSM.L["Number Owned"] = "Number Owned"
--[[Translation missing --]]
TSM.L["of"] = "of"
TSM.L["Offline"] = "Desconectado."
--[[Translation missing --]]
TSM.L["Old TSM addons detected. TSM has disabled them and requires a reload."] = "Old TSM addons detected. TSM has disabled them and requires a reload."
--[[Translation missing --]]
TSM.L["On Cooldown"] = "On Cooldown"
--[[Translation missing --]]
TSM.L["Only show craftable"] = "Only show craftable"
--[[Translation missing --]]
TSM.L["Only show items with disenchant value above custom price"] = "Only show items with disenchant value above custom price"
--[[Translation missing --]]
TSM.L["OPEN"] = "OPEN"
--[[Translation missing --]]
TSM.L["Open all bags when auctioning"] = "Open all bags when auctioning"
--[[Translation missing --]]
TSM.L["OPEN ALL MAIL"] = "OPEN ALL MAIL"
--[[Translation missing --]]
TSM.L["Open Mail"] = "Open Mail"
--[[Translation missing --]]
TSM.L["Open Mail Complete Sound"] = "Open Mail Complete Sound"
--[[Translation missing --]]
TSM.L["Open Task List"] = "Open Task List"
--[[Translation missing --]]
TSM.L["Operation"] = "Operation"
TSM.L["Operations"] = "Operaciones"
--[[Translation missing --]]
TSM.L["Other Character"] = "Other Character"
--[[Translation missing --]]
TSM.L["Other Settings"] = "Other Settings"
--[[Translation missing --]]
TSM.L["Other Shopping Searches"] = "Other Shopping Searches"
--[[Translation missing --]]
TSM.L["Override default craft value method?"] = "Override default craft value method?"
--[[Translation missing --]]
TSM.L["Override parent operations"] = "Override parent operations"
--[[Translation missing --]]
TSM.L["Parent Items"] = "Parent Items"
--[[Translation missing --]]
TSM.L["Past 7 Days"] = "Past 7 Days"
--[[Translation missing --]]
TSM.L["Past Day"] = "Past Day"
--[[Translation missing --]]
TSM.L["Past Month"] = "Past Month"
--[[Translation missing --]]
TSM.L["Past Year"] = "Past Year"
--[[Translation missing --]]
TSM.L["Paste string here"] = "Paste string here"
--[[Translation missing --]]
TSM.L["Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."] = "Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."
--[[Translation missing --]]
TSM.L["Per Item"] = "Per Item"
--[[Translation missing --]]
TSM.L["Per Stack"] = "Per Stack"
--[[Translation missing --]]
TSM.L["Per Unit"] = "Per Unit"
TSM.L["Player Gold"] = "Oro de personaje."
TSM.L["Player Invite Accept"] = "Aceptar invitación de jugador."
--[[Translation missing --]]
TSM.L["Please select a group to export"] = "Please select a group to export"
--[[Translation missing --]]
TSM.L["POST"] = "POST"
--[[Translation missing --]]
TSM.L["Post at Maximum Price"] = "Post at Maximum Price"
--[[Translation missing --]]
TSM.L["Post at Minimum Price"] = "Post at Minimum Price"
--[[Translation missing --]]
TSM.L["Post at Normal Price"] = "Post at Normal Price"
--[[Translation missing --]]
TSM.L["POST CAP TO BAGS"] = "POST CAP TO BAGS"
--[[Translation missing --]]
TSM.L["Post Scan"] = "Post Scan"
--[[Translation missing --]]
TSM.L["POST SELECTED"] = "POST SELECTED"
--[[Translation missing --]]
TSM.L["POSTAGE"] = "POSTAGE"
--[[Translation missing --]]
TSM.L["Postage"] = "Postage"
--[[Translation missing --]]
TSM.L["Posted at whitelisted player's price."] = "Posted at whitelisted player's price."
--[[Translation missing --]]
TSM.L["Posted Auctions %s:"] = "Posted Auctions %s:"
--[[Translation missing --]]
TSM.L["Posting"] = "Posting"
--[[Translation missing --]]
TSM.L["Posting %d / %d"] = "Posting %d / %d"
--[[Translation missing --]]
TSM.L["Posting %d stack(s) of %d for %d hours."] = "Posting %d stack(s) of %d for %d hours."
--[[Translation missing --]]
TSM.L["Posting at normal price."] = "Posting at normal price."
--[[Translation missing --]]
TSM.L["Posting at whitelisted player's price."] = "Posting at whitelisted player's price."
--[[Translation missing --]]
TSM.L["Posting at your current price."] = "Posting at your current price."
--[[Translation missing --]]
TSM.L["Posting disabled."] = "Posting disabled."
--[[Translation missing --]]
TSM.L["Posting Settings"] = "Posting Settings"
--[[Translation missing --]]
TSM.L["Potential"] = "Potential"
--[[Translation missing --]]
TSM.L["Price Settings"] = "Price Settings"
--[[Translation missing --]]
TSM.L["PRICE SOURCE"] = "PRICE SOURCE"
--[[Translation missing --]]
TSM.L["Price source with name '%s' already exists."] = "Price source with name '%s' already exists."
--[[Translation missing --]]
TSM.L["Price Variables"] = "Price Variables"
--[[Translation missing --]]
TSM.L["Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."] = "Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."
--[[Translation missing --]]
TSM.L["PROFESSION"] = "PROFESSION"
--[[Translation missing --]]
TSM.L["Profession Filters"] = "Profession Filters"
--[[Translation missing --]]
TSM.L["Profession loading..."] = "Profession loading..."
--[[Translation missing --]]
TSM.L["Professions Used In"] = "Professions Used In"
TSM.L["Profile changed to '%s'."] = "Perfil cambiado a '%s'."
TSM.L["Profiles"] = "Perfiles"
--[[Translation missing --]]
TSM.L["Profit"] = "Profit"
--[[Translation missing --]]
TSM.L["PROFIT"] = "PROFIT"
--[[Translation missing --]]
TSM.L["Profit Deduction"] = "Profit Deduction"
--[[Translation missing --]]
TSM.L["Profit, Craftable Quantity"] = "Profit, Craftable Quantity"
--[[Translation missing --]]
TSM.L["Prospect Value"] = "Prospect Value"
--[[Translation missing --]]
TSM.L["PURCHASE DATA"] = "PURCHASE DATA"
--[[Translation missing --]]
TSM.L["Purchased (Min/Avg/Max Price)"] = "Purchased (Min/Avg/Max Price)"
--[[Translation missing --]]
TSM.L["Purchased (Total Price)"] = "Purchased (Total Price)"
--[[Translation missing --]]
TSM.L["Purchases"] = "Purchases"
--[[Translation missing --]]
TSM.L["Qty"] = "Qty"
--[[Translation missing --]]
TSM.L["Quantity Bought:"] = "Quantity Bought:"
--[[Translation missing --]]
TSM.L["Quantity Sold:"] = "Quantity Sold:"
--[[Translation missing --]]
TSM.L["Quantity to move:"] = "Quantity to move:"
TSM.L["Quest Added"] = "Misión añadida."
TSM.L["Quest Completed"] = "Misión completada."
TSM.L["Quest Objectives Complete"] = "Objetivos de misión completados."
--[[Translation missing --]]
TSM.L["QUEUE"] = "QUEUE"
--[[Translation missing --]]
TSM.L["Queue Sorting Method"] = "Queue Sorting Method"
--[[Translation missing --]]
TSM.L["Quick Sell"] = "Quick Sell"
--[[Translation missing --]]
TSM.L["Quick Sell Options"] = "Quick Sell Options"
--[[Translation missing --]]
TSM.L["Quickly mail all excess disenchantable items to a character"] = "Quickly mail all excess disenchantable items to a character"
--[[Translation missing --]]
TSM.L["Quickly mail all excess gold (limited to a certain amount) to a character"] = "Quickly mail all excess gold (limited to a certain amount) to a character"
TSM.L["Raid Warning"] = "Alerta de Raid"
--[[Translation missing --]]
TSM.L["Read More"] = "Read More"
--[[Translation missing --]]
TSM.L["Ready Check"] = "Ready Check"
--[[Translation missing --]]
TSM.L["Ready to Cancel"] = "Ready to Cancel"
--[[Translation missing --]]
TSM.L["Reagent Bank"] = "Reagent Bank"
--[[Translation missing --]]
TSM.L["Realm Data Tooltips"] = "Realm Data Tooltips"
--[[Translation missing --]]
TSM.L["Recent Scans"] = "Recent Scans"
--[[Translation missing --]]
TSM.L["Recent Searches"] = "Recent Searches"
--[[Translation missing --]]
TSM.L["Recently Mailed"] = "Recently Mailed"
--[[Translation missing --]]
TSM.L["RECIPIENT"] = "RECIPIENT"
--[[Translation missing --]]
TSM.L["Region Avg Daily Sold"] = "Region Avg Daily Sold"
--[[Translation missing --]]
TSM.L["Region Data Tooltips"] = "Region Data Tooltips"
--[[Translation missing --]]
TSM.L["Region Historical Price"] = "Region Historical Price"
--[[Translation missing --]]
TSM.L["Region Market Value Avg"] = "Region Market Value Avg"
--[[Translation missing --]]
TSM.L["Region Min Buyout Avg"] = "Region Min Buyout Avg"
--[[Translation missing --]]
TSM.L["Region Sale Avg"] = "Region Sale Avg"
--[[Translation missing --]]
TSM.L["Region Sale Rate"] = "Region Sale Rate"
--[[Translation missing --]]
TSM.L["Reload"] = "Reload"
--[[Translation missing --]]
TSM.L["REMOVE %d ITEMS"] = "REMOVE %d ITEMS"
--[[Translation missing --]]
TSM.L["Removed a total of %s old records."] = "Removed a total of %s old records."
--[[Translation missing --]]
TSM.L["REPAIR"] = "REPAIR"
--[[Translation missing --]]
TSM.L["Repair Bill"] = "Repair Bill"
TSM.L["Replace"] = "Reemplazar"
--[[Translation missing --]]
TSM.L["REPLY"] = "REPLY"
--[[Translation missing --]]
TSM.L["REPORT SPAM"] = "REPORT SPAM"
--[[Translation missing --]]
TSM.L["Repost Higher Threshold"] = "Repost Higher Threshold"
--[[Translation missing --]]
TSM.L["Required Level"] = "Required Level"
--[[Translation missing --]]
TSM.L["REQUIRED LEVEL RANGE"] = "REQUIRED LEVEL RANGE"
--[[Translation missing --]]
TSM.L["Requires TSM Desktop Application"] = "Requires TSM Desktop Application"
--[[Translation missing --]]
TSM.L["Resale"] = "Resale"
--[[Translation missing --]]
TSM.L["RESCAN"] = "RESCAN"
--[[Translation missing --]]
TSM.L["RESET"] = "RESET"
--[[Translation missing --]]
TSM.L["Reset All"] = "Reset All"
--[[Translation missing --]]
TSM.L["Reset Filters"] = "Reset Filters"
--[[Translation missing --]]
TSM.L["Reset Profile Confirmation"] = "Reset Profile Confirmation"
--[[Translation missing --]]
TSM.L["RESTART"] = "RESTART"
--[[Translation missing --]]
TSM.L["Restart Delay (minutes)"] = "Restart Delay (minutes)"
--[[Translation missing --]]
TSM.L["RESTOCK BAGS"] = "RESTOCK BAGS"
--[[Translation missing --]]
TSM.L["Restock help for %s:"] = "Restock help for %s:"
--[[Translation missing --]]
TSM.L["Restock Quantity Settings"] = "Restock Quantity Settings"
--[[Translation missing --]]
TSM.L["Restock quantity:"] = "Restock quantity:"
--[[Translation missing --]]
TSM.L["RESTOCK SELECTED GROUPS"] = "RESTOCK SELECTED GROUPS"
--[[Translation missing --]]
TSM.L["Restock Settings"] = "Restock Settings"
--[[Translation missing --]]
TSM.L["Restock target to max quantity?"] = "Restock target to max quantity?"
--[[Translation missing --]]
TSM.L["Restocking to %d."] = "Restocking to %d."
--[[Translation missing --]]
TSM.L["Restocking to a max of %d (min of %d) with a min profit."] = "Restocking to a max of %d (min of %d) with a min profit."
--[[Translation missing --]]
TSM.L["Restocking to a max of %d (min of %d) with no min profit."] = "Restocking to a max of %d (min of %d) with no min profit."
--[[Translation missing --]]
TSM.L["RESTORE BAGS"] = "RESTORE BAGS"
--[[Translation missing --]]
TSM.L["Resume Scan"] = "Resume Scan"
--[[Translation missing --]]
TSM.L["Retrying %d auction(s) which failed."] = "Retrying %d auction(s) which failed."
--[[Translation missing --]]
TSM.L["Revenue"] = "Revenue"
--[[Translation missing --]]
TSM.L["Round normal price"] = "Round normal price"
--[[Translation missing --]]
TSM.L["RUN ADVANCED ITEM SEARCH"] = "RUN ADVANCED ITEM SEARCH"
--[[Translation missing --]]
TSM.L["Run Bid Sniper"] = "Run Bid Sniper"
--[[Translation missing --]]
TSM.L["Run Buyout Sniper"] = "Run Buyout Sniper"
--[[Translation missing --]]
TSM.L["RUN CANCEL SCAN"] = "RUN CANCEL SCAN"
--[[Translation missing --]]
TSM.L["RUN POST SCAN"] = "RUN POST SCAN"
--[[Translation missing --]]
TSM.L["RUN SHOPPING SCAN"] = "RUN SHOPPING SCAN"
--[[Translation missing --]]
TSM.L["Running Sniper Scan"] = "Running Sniper Scan"
--[[Translation missing --]]
TSM.L["Sale"] = "Sale"
--[[Translation missing --]]
TSM.L["SALE DATA"] = "SALE DATA"
--[[Translation missing --]]
TSM.L["Sale Rate"] = "Sale Rate"
--[[Translation missing --]]
TSM.L["Sales"] = "Sales"
--[[Translation missing --]]
TSM.L["SALES"] = "SALES"
--[[Translation missing --]]
TSM.L["Sales Summary"] = "Sales Summary"
--[[Translation missing --]]
TSM.L["SCAN ALL"] = "SCAN ALL"
--[[Translation missing --]]
TSM.L["Scan Complete Sound"] = "Scan Complete Sound"
--[[Translation missing --]]
TSM.L["Scan Paused"] = "Scan Paused"
--[[Translation missing --]]
TSM.L["SCANNING"] = "SCANNING"
--[[Translation missing --]]
TSM.L["Scanning %d / %d (Page %d / %d)"] = "Scanning %d / %d (Page %d / %d)"
--[[Translation missing --]]
TSM.L["Scroll wheel direction:"] = "Scroll wheel direction:"
--[[Translation missing --]]
TSM.L["Search"] = "Search"
--[[Translation missing --]]
TSM.L["Search Bags"] = "Search Bags"
--[[Translation missing --]]
TSM.L["Search for Item"] = "Search for Item"
--[[Translation missing --]]
TSM.L["Search Groups"] = "Search Groups"
--[[Translation missing --]]
TSM.L["Search Inbox"] = "Search Inbox"
--[[Translation missing --]]
TSM.L["Search Operations"] = "Search Operations"
--[[Translation missing --]]
TSM.L["Search Patterns"] = "Search Patterns"
--[[Translation missing --]]
TSM.L["Search Usable Items Only?"] = "Search Usable Items Only?"
--[[Translation missing --]]
TSM.L["Search Vendor"] = "Search Vendor"
--[[Translation missing --]]
TSM.L["Select a Source"] = "Select a Source"
--[[Translation missing --]]
TSM.L["Select Action"] = "Select Action"
TSM.L["Select All Groups"] = "Seleccionar todos los Grupos"
--[[Translation missing --]]
TSM.L["Select All Items"] = "Select All Items"
--[[Translation missing --]]
TSM.L["Select Auction to Cancel"] = "Select Auction to Cancel"
--[[Translation missing --]]
TSM.L["Select crafter"] = "Select crafter"
--[[Translation missing --]]
TSM.L["Select custom price sources to include in item tooltips"] = "Select custom price sources to include in item tooltips"
--[[Translation missing --]]
TSM.L["Select Duration"] = "Select Duration"
--[[Translation missing --]]
TSM.L["Select Items to Add"] = "Select Items to Add"
--[[Translation missing --]]
TSM.L["Select Items to Remove"] = "Select Items to Remove"
--[[Translation missing --]]
TSM.L["Select Operation"] = "Select Operation"
--[[Translation missing --]]
TSM.L["Select professions"] = "Select professions"
--[[Translation missing --]]
TSM.L["Select which accounting information to display in item tooltips."] = "Select which accounting information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which auctioning information to display in item tooltips."] = "Select which auctioning information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which crafting information to display in item tooltips."] = "Select which crafting information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which destroying information to display in item tooltips."] = "Select which destroying information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which shopping information to display in item tooltips."] = "Select which shopping information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Selected Groups"] = "Selected Groups"
--[[Translation missing --]]
TSM.L["SELECTED ITEM"] = "SELECTED ITEM"
--[[Translation missing --]]
TSM.L["Selected Operations"] = "Selected Operations"
--[[Translation missing --]]
TSM.L["Sell"] = "Sell"
--[[Translation missing --]]
TSM.L["SELL ALL"] = "SELL ALL"
--[[Translation missing --]]
TSM.L["SELL BOES"] = "SELL BOES"
--[[Translation missing --]]
TSM.L["SELL GROUPS"] = "SELL GROUPS"
--[[Translation missing --]]
TSM.L["Sell Options"] = "Sell Options"
--[[Translation missing --]]
TSM.L["Sell soulbound items?"] = "Sell soulbound items?"
TSM.L["Sell to Vendor"] = "Vender al Vendedor"
--[[Translation missing --]]
TSM.L["SELL TRASH"] = "SELL TRASH"
--[[Translation missing --]]
TSM.L["Seller"] = "Seller"
--[[Translation missing --]]
TSM.L["Selling soulbound items."] = "Selling soulbound items."
--[[Translation missing --]]
TSM.L["Send"] = "Send"
--[[Translation missing --]]
TSM.L["SEND DISENCHANTABLES"] = "SEND DISENCHANTABLES"
--[[Translation missing --]]
TSM.L["Send Excess Gold to Banker"] = "Send Excess Gold to Banker"
--[[Translation missing --]]
TSM.L["SEND GOLD"] = "SEND GOLD"
--[[Translation missing --]]
TSM.L["Send grouped items individually"] = "Send grouped items individually"
--[[Translation missing --]]
TSM.L["SEND MAIL"] = "SEND MAIL"
--[[Translation missing --]]
TSM.L["Send Money"] = "Send Money"
--[[Translation missing --]]
TSM.L["SENDING"] = "SENDING"
--[[Translation missing --]]
TSM.L["Sending %s individually to %s"] = "Sending %s individually to %s"
--[[Translation missing --]]
TSM.L["Sending %s to %s"] = "Sending %s to %s"
--[[Translation missing --]]
TSM.L["Sending %s to %s with a COD of %s"] = "Sending %s to %s with a COD of %s"
--[[Translation missing --]]
TSM.L["Sending Settings"] = "Sending Settings"
--[[Translation missing --]]
TSM.L["SENDING..."] = "SENDING..."
--[[Translation missing --]]
TSM.L["Set auction duration to:"] = "Set auction duration to:"
--[[Translation missing --]]
TSM.L["Set bid as percentage of buyout:"] = "Set bid as percentage of buyout:"
--[[Translation missing --]]
TSM.L["Set keep in bags quantity?"] = "Set keep in bags quantity?"
--[[Translation missing --]]
TSM.L["Set keep in bank quantity?"] = "Set keep in bank quantity?"
--[[Translation missing --]]
TSM.L["Set Maximum Price:"] = "Set Maximum Price:"
--[[Translation missing --]]
TSM.L["Set maximum quantity?"] = "Set maximum quantity?"
--[[Translation missing --]]
TSM.L["Set Minimum Price:"] = "Set Minimum Price:"
--[[Translation missing --]]
TSM.L["Set minimum profit?"] = "Set minimum profit?"
--[[Translation missing --]]
TSM.L["Set move quantity?"] = "Set move quantity?"
--[[Translation missing --]]
TSM.L["Set Normal Price:"] = "Set Normal Price:"
--[[Translation missing --]]
TSM.L["Set post cap to:"] = "Set post cap to:"
--[[Translation missing --]]
TSM.L["Set posted stack size to:"] = "Set posted stack size to:"
--[[Translation missing --]]
TSM.L["Set stack size for bags?"] = "Set stack size for bags?"
--[[Translation missing --]]
TSM.L["Setup"] = "Setup"
--[[Translation missing --]]
TSM.L["SETUP ACCOUNT SYNC"] = "SETUP ACCOUNT SYNC"
TSM.L["Shards"] = "Fragmentos"
--[[Translation missing --]]
TSM.L["Shopping"] = "Shopping"
--[[Translation missing --]]
TSM.L["Shopping 'BUYOUT' Button"] = "Shopping 'BUYOUT' Button"
--[[Translation missing --]]
TSM.L["Shopping for auctions including those above the max price."] = "Shopping for auctions including those above the max price."
--[[Translation missing --]]
TSM.L["Shopping for auctions with a max price set."] = "Shopping for auctions with a max price set."
--[[Translation missing --]]
TSM.L["Shopping for even stacks including those above the max price"] = "Shopping for even stacks including those above the max price"
--[[Translation missing --]]
TSM.L["Shopping for even stacks with a max price set."] = "Shopping for even stacks with a max price set."
--[[Translation missing --]]
TSM.L["Shopping Tooltips"] = "Shopping Tooltips"
--[[Translation missing --]]
TSM.L["SHORTFALL TO BAGS"] = "SHORTFALL TO BAGS"
--[[Translation missing --]]
TSM.L["Show auctions above max price?"] = "Show auctions above max price?"
--[[Translation missing --]]
TSM.L["Show Description"] = "Show Description"
--[[Translation missing --]]
TSM.L["Show Destroying frame automatically"] = "Show Destroying frame automatically"
--[[Translation missing --]]
TSM.L["Show material cost"] = "Show material cost"
--[[Translation missing --]]
TSM.L["Show on Modifier"] = "Show on Modifier"
--[[Translation missing --]]
TSM.L["Showing %d Mail"] = "Showing %d Mail"
--[[Translation missing --]]
TSM.L["Showing %d of %d Mail"] = "Showing %d of %d Mail"
--[[Translation missing --]]
TSM.L["Showing %d of %d Mails"] = "Showing %d of %d Mails"
--[[Translation missing --]]
TSM.L["Showing all %d Mails"] = "Showing all %d Mails"
TSM.L["Simple"] = "Sencillo."
--[[Translation missing --]]
TSM.L["SKIP"] = "SKIP"
--[[Translation missing --]]
TSM.L["Skip Import / Export confirmations?"] = "Skip Import / Export confirmations?"
--[[Translation missing --]]
TSM.L["Skipped: No assigned operation"] = "Skipped: No assigned operation"
TSM.L["Slash Commands:"] = "Comandos de barra:"
--[[Translation missing --]]
TSM.L["Sniper 'BUYOUT' Button"] = "Sniper 'BUYOUT' Button"
--[[Translation missing --]]
TSM.L["Sniper Options"] = "Sniper Options"
--[[Translation missing --]]
TSM.L["Sniper Settings"] = "Sniper Settings"
--[[Translation missing --]]
TSM.L["Sniping items below a max price"] = "Sniping items below a max price"
--[[Translation missing --]]
TSM.L["Sold"] = "Sold"
--[[Translation missing --]]
TSM.L["Sold %s worth of items."] = "Sold %s worth of items."
--[[Translation missing --]]
TSM.L["Sold (Min/Avg/Max Price)"] = "Sold (Min/Avg/Max Price)"
--[[Translation missing --]]
TSM.L["Sold (Total Price)"] = "Sold (Total Price)"
--[[Translation missing --]]
TSM.L["Sold [%s]x%d for %s to %s"] = "Sold [%s]x%d for %s to %s"
--[[Translation missing --]]
TSM.L["Sold Auctions %s:"] = "Sold Auctions %s:"
--[[Translation missing --]]
TSM.L["Source"] = "Source"
--[[Translation missing --]]
TSM.L["SOURCE %d"] = "SOURCE %d"
--[[Translation missing --]]
TSM.L["SOURCES"] = "SOURCES"
TSM.L["Sources"] = "Fuentes"
--[[Translation missing --]]
TSM.L["Sources to include for restock:"] = "Sources to include for restock:"
--[[Translation missing --]]
TSM.L["Stack"] = "Stack"
--[[Translation missing --]]
TSM.L["Stack / Quantity"] = "Stack / Quantity"
--[[Translation missing --]]
TSM.L["Stack size multiple:"] = "Stack size multiple:"
--[[Translation missing --]]
TSM.L["Start either a 'Buyout' or 'Bid' sniper using the buttons above."] = "Start either a 'Buyout' or 'Bid' sniper using the buttons above."
--[[Translation missing --]]
TSM.L["Starting Scan..."] = "Starting Scan..."
--[[Translation missing --]]
TSM.L["STOP"] = "STOP"
--[[Translation missing --]]
TSM.L["Store operations globally"] = "Store operations globally"
--[[Translation missing --]]
TSM.L["Subject"] = "Subject"
--[[Translation missing --]]
TSM.L["SUBJECT"] = "SUBJECT"
--[[Translation missing --]]
TSM.L["Switch to %s"] = "Switch to %s"
--[[Translation missing --]]
TSM.L["Switch to WoW UI"] = "Switch to WoW UI"
--[[Translation missing --]]
TSM.L["Sync Setup Error: The specified player on the other account is not currently online."] = "Sync Setup Error: The specified player on the other account is not currently online."
--[[Translation missing --]]
TSM.L["Sync Setup Error: This character is already part of a known account."] = "Sync Setup Error: This character is already part of a known account."
--[[Translation missing --]]
TSM.L["Sync Setup Error: You entered the name of the current character and not the character on the other account."] = "Sync Setup Error: You entered the name of the current character and not the character on the other account."
--[[Translation missing --]]
TSM.L["TAKE ALL"] = "TAKE ALL"
--[[Translation missing --]]
TSM.L["Take Attachments"] = "Take Attachments"
--[[Translation missing --]]
TSM.L["Target Character"] = "Target Character"
--[[Translation missing --]]
TSM.L["TARGET SHORTFALL TO BAGS"] = "TARGET SHORTFALL TO BAGS"
--[[Translation missing --]]
TSM.L["Tasks Added to Task List"] = "Tasks Added to Task List"
TSM.L["Text (%s)"] = "Texto (%s)"
--[[Translation missing --]]
TSM.L["The canlearn filter was ignored because the CanIMogIt addon was not found."] = "The canlearn filter was ignored because the CanIMogIt addon was not found."
--[[Translation missing --]]
TSM.L["The 'Craft Value Method' (%s) did not return a value for this item."] = "The 'Craft Value Method' (%s) did not return a value for this item."
--[[Translation missing --]]
TSM.L["The 'disenchant' price source has been replaced by the more general 'destroy' price source. Please update your custom prices."] = "The 'disenchant' price source has been replaced by the more general 'destroy' price source. Please update your custom prices."
--[[Translation missing --]]
TSM.L["The min profit (%s) did not evalulate to a valid value for this item."] = "The min profit (%s) did not evalulate to a valid value for this item."
TSM.L["The name can ONLY contain letters. No spaces, numbers, or special characters."] = "El nombre SOLO puede contener letras. No puede contener espacios, números o caracteres especiales."
--[[Translation missing --]]
TSM.L["The number which would be queued (%d) is less than the min restock quantity (%d)."] = "The number which would be queued (%d) is less than the min restock quantity (%d)."
--[[Translation missing --]]
TSM.L["The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."] = "The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."
--[[Translation missing --]]
TSM.L["The player \"%s\" is already on your whitelist."] = "The player \"%s\" is already on your whitelist."
--[[Translation missing --]]
TSM.L["The profit of this item (%s) is below the min profit (%s)."] = "The profit of this item (%s) is below the min profit (%s)."
--[[Translation missing --]]
TSM.L["The seller name of the lowest auction for %s was not given by the server. Skipping this item."] = "The seller name of the lowest auction for %s was not given by the server. Skipping this item."
--[[Translation missing --]]
TSM.L["The TradeSkillMaster_AppHelper addon is not enabled and is required for proper operation of TSM. TSM has enabled it and requires a reload."] = "The TradeSkillMaster_AppHelper addon is not enabled and is required for proper operation of TSM. TSM has enabled it and requires a reload."
--[[Translation missing --]]
TSM.L["The TradeSkillMaster_AppHelper addon is not installed and is required for proper operation of TSM."] = "The TradeSkillMaster_AppHelper addon is not installed and is required for proper operation of TSM."
--[[Translation missing --]]
TSM.L["The unlearned filter was ignored because the CanIMogIt addon was not found."] = "The unlearned filter was ignored because the CanIMogIt addon was not found."
--[[Translation missing --]]
TSM.L["There is a crafting cost and crafted item value, but TSM_Crafting wasn't able to calculate a profit. This shouldn't happen!"] = "There is a crafting cost and crafted item value, but TSM_Crafting wasn't able to calculate a profit. This shouldn't happen!"
--[[Translation missing --]]
TSM.L["There is no TSM_Crafting operation applied to this item's TSM group (%s)."] = "There is no TSM_Crafting operation applied to this item's TSM group (%s)."
TSM.L["This group already has operations. Would you like to add another one or replace the last one?"] = "Este grupo ya tiene operaciones. ¿Te gustaría añadir otro o reemplazar el último?"
TSM.L["This group already has the max number of operation. Would you like to replace the last one?"] = "Este grupo ya tiene el número máximo de operación. ¿Desea reemplazar el último?"
TSM.L["This is not a valid profile name. Profile names must be at least one character long and may not contain '@' characters."] = "Este no es un nombre de perfil válido. Los nombres de perfil tienen que tener ser al menos un carácter de longitud y no pueden tener '@'."
--[[Translation missing --]]
TSM.L["This item does not have a crafting cost. Check that all of its mats have mat prices."] = "This item does not have a crafting cost. Check that all of its mats have mat prices."
--[[Translation missing --]]
TSM.L["This item is not in a TSM group."] = "This item is not in a TSM group."
--[[Translation missing --]]
TSM.L["This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general TSM_Crafting options."] = "This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general TSM_Crafting options."
TSM.L["This looks like an exported operation and not a custom price."] = "Esto parece una operación exportada y no un precio personalizado."
--[[Translation missing --]]
TSM.L["This will copy the settings from '%s' into your currently-active one."] = "This will copy the settings from '%s' into your currently-active one."
--[[Translation missing --]]
TSM.L["This will permanently delete the '%s' profile."] = "This will permanently delete the '%s' profile."
--[[Translation missing --]]
TSM.L["This will reset all groups and operations (if not stored globally) to be wiped from this profile."] = "This will reset all groups and operations (if not stored globally) to be wiped from this profile."
--[[Translation missing --]]
TSM.L["Time"] = "Time"
--[[Translation missing --]]
TSM.L["Time Format"] = "Time Format"
--[[Translation missing --]]
TSM.L["Time Frame"] = "Time Frame"
--[[Translation missing --]]
TSM.L["TIME FRAME"] = "TIME FRAME"
--[[Translation missing --]]
TSM.L["TINKER"] = "TINKER"
--[[Translation missing --]]
TSM.L["Tooltip Price Format"] = "Tooltip Price Format"
--[[Translation missing --]]
TSM.L["Tooltip Settings"] = "Tooltip Settings"
--[[Translation missing --]]
TSM.L["Top Buyers:"] = "Top Buyers:"
--[[Translation missing --]]
TSM.L["Top Item:"] = "Top Item:"
--[[Translation missing --]]
TSM.L["Top Sellers:"] = "Top Sellers:"
TSM.L["Total"] = "Total"
--[[Translation missing --]]
TSM.L["Total Gold"] = "Total Gold"
--[[Translation missing --]]
TSM.L["Total Gold Earned:"] = "Total Gold Earned:"
--[[Translation missing --]]
TSM.L["Total Gold Spent:"] = "Total Gold Spent:"
--[[Translation missing --]]
TSM.L["Total Price"] = "Total Price"
--[[Translation missing --]]
TSM.L["Total Profit:"] = "Total Profit:"
TSM.L["Total Value"] = "Valor total"
--[[Translation missing --]]
TSM.L["Total Value of All Items: "] = "Total Value of All Items: "
--[[Translation missing --]]
TSM.L["Track Sales / Purchases via trade"] = "Track Sales / Purchases via trade"
--[[Translation missing --]]
TSM.L["TradeSkillMaster Info"] = "TradeSkillMaster Info"
--[[Translation missing --]]
TSM.L["Transform Value"] = "Transform Value"
--[[Translation missing --]]
TSM.L["TSM Banking"] = "TSM Banking"
--[[Translation missing --]]
TSM.L["TSM can sync data automatically between multiple accounts."] = "TSM can sync data automatically between multiple accounts."
--[[Translation missing --]]
TSM.L["TSM Crafting"] = "TSM Crafting"
--[[Translation missing --]]
TSM.L["TSM Destroying"] = "TSM Destroying"
--[[Translation missing --]]
TSM.L["TSM failed to scan some auctions. Please rerun the scan."] = "TSM failed to scan some auctions. Please rerun the scan."
--[[Translation missing --]]
TSM.L["TSM Groups"] = "TSM Groups"
--[[Translation missing --]]
TSM.L["TSM is missing important information from the TSM Desktop Application. Please ensure the TSM Desktop Application is running and is properly configured."] = "TSM is missing important information from the TSM Desktop Application. Please ensure the TSM Desktop Application is running and is properly configured."
--[[Translation missing --]]
TSM.L["TSM Mailing"] = "TSM Mailing"
--[[Translation missing --]]
TSM.L["TSM TASK LIST"] = "TSM TASK LIST"
--[[Translation missing --]]
TSM.L["TSM Vendoring"] = "TSM Vendoring"
TSM.L["TSM Version Info:"] = "TSM Versión Info:"
--[[Translation missing --]]
TSM.L["TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"] = "TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"
--[[Translation missing --]]
TSM.L["TSM4"] = "TSM4"
--[[Translation missing --]]
TSM.L["TUJ 3-Day Price"] = "TUJ 3-Day Price"
TSM.L["Twitter Integration"] = "Integración de Twitter"
--[[Translation missing --]]
TSM.L["Twitter Integration Not Enabled"] = "Twitter Integration Not Enabled"
--[[Translation missing --]]
TSM.L["Type"] = "Type"
--[[Translation missing --]]
TSM.L["Type Something"] = "Type Something"
TSM.L["Unbalanced parentheses."] = "Paréntesis no balanceados."
--[[Translation missing --]]
TSM.L["Undercut amount:"] = "Undercut amount:"
--[[Translation missing --]]
TSM.L["Undercut by whitelisted player."] = "Undercut by whitelisted player."
--[[Translation missing --]]
TSM.L["Undercutting blacklisted player."] = "Undercutting blacklisted player."
--[[Translation missing --]]
TSM.L["Undercutting competition."] = "Undercutting competition."
--[[Translation missing --]]
TSM.L["Ungrouped Items"] = "Ungrouped Items"
--[[Translation missing --]]
TSM.L["Unknown Item"] = "Unknown Item"
TSM.L["Unwrap Gift"] = "Abrir regalo"
TSM.L["Up"] = "Arriba"
--[[Translation missing --]]
TSM.L["UPDATE EXISTING MACRO"] = "UPDATE EXISTING MACRO"
TSM.L["Usage: /tsm price <ItemLink> <Price String>"] = "Uso: / tsm price <ItemLink> <Price String>"
--[[Translation missing --]]
TSM.L["Use smart average for purchase price"] = "Use smart average for purchase price"
--[[Translation missing --]]
TSM.L["Use the field below to search the auction house by filter"] = "Use the field below to search the auction house by filter"
--[[Translation missing --]]
TSM.L["Use the list to the left to select groups, & operations you'd like to create export strings for."] = "Use the list to the left to select groups, & operations you'd like to create export strings for."
--[[Translation missing --]]
TSM.L["VALUE PRICE SOURCE"] = "VALUE PRICE SOURCE"
--[[Translation missing --]]
TSM.L["ValueSources"] = "ValueSources"
--[[Translation missing --]]
TSM.L["Variable Name"] = "Variable Name"
--[[Translation missing --]]
TSM.L["Vendor"] = "Vendor"
--[[Translation missing --]]
TSM.L["Vendor Buy Price"] = "Vendor Buy Price"
--[[Translation missing --]]
TSM.L["Vendor Search"] = "Vendor Search"
--[[Translation missing --]]
TSM.L["VENDOR SEARCH"] = "VENDOR SEARCH"
--[[Translation missing --]]
TSM.L["Vendor Sell"] = "Vendor Sell"
--[[Translation missing --]]
TSM.L["Vendor Sell Price"] = "Vendor Sell Price"
--[[Translation missing --]]
TSM.L["Vendoring 'SELL ALL' Button"] = "Vendoring 'SELL ALL' Button"
--[[Translation missing --]]
TSM.L["View ignored items in the Destroying options."] = "View ignored items in the Destroying options."
--[[Translation missing --]]
TSM.L["Warehousing"] = "Warehousing"
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group."] = "Warehousing will move a max of %d of each item in this group."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group."] = "Warehousing will move all of the items in this group."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["WARNING: The macro was too long, so was truncated to fit by WoW."] = "WARNING: The macro was too long, so was truncated to fit by WoW."
--[[Translation missing --]]
TSM.L["WARNING: You minimum price for %s is below its vendorsell price (with AH cut taken into account). Consider raising your minimum price, or vendoring the item."] = "WARNING: You minimum price for %s is below its vendorsell price (with AH cut taken into account). Consider raising your minimum price, or vendoring the item."
--[[Translation missing --]]
TSM.L["When above maximum:"] = "When above maximum:"
--[[Translation missing --]]
TSM.L["When below minimum:"] = "When below minimum:"
--[[Translation missing --]]
TSM.L["Whitelist"] = "Whitelist"
--[[Translation missing --]]
TSM.L["Whitelisted Players"] = "Whitelisted Players"
--[[Translation missing --]]
TSM.L["You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"] = "You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"
--[[Translation missing --]]
TSM.L["You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."] = "You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."
TSM.L["You cannot use %s as part of this custom price."] = "No se puede utilizar %s como parte de este precio personalizado."
--[[Translation missing --]]
TSM.L["You cannot use %s within convert() as part of this custom price."] = "You cannot use %s within convert() as part of this custom price."
--[[Translation missing --]]
TSM.L["You do not need to add \"%s\", alts are whitelisted automatically."] = "You do not need to add \"%s\", alts are whitelisted automatically."
--[[Translation missing --]]
TSM.L["You don't know how to craft this item."] = "You don't know how to craft this item."
TSM.L["You must reload your UI for these settings to take effect. Reload now?"] = "Debes volver a cargar la interfaz de usuario para esta configuración surta efecto. ¿Actualizar ahora?"
TSM.L["You won an auction for %sx%d for %s"] = "Has ganado el artículo %sx%d en subasta por %s"
--[[Translation missing --]]
TSM.L["Your auction has not been undercut."] = "Your auction has not been undercut."
--[[Translation missing --]]
TSM.L["Your auction of %s expired"] = "Your auction of %s expired"
TSM.L["Your auction of %s has sold for %s!"] = "Tu subasta %s ha sido vendida por %s!"
--[[Translation missing --]]
TSM.L["Your Buyout"] = "Your Buyout"
--[[Translation missing --]]
TSM.L["Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"] = "Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"
--[[Translation missing --]]
TSM.L["Your default craft value method was invalid so it has been returned to the default. Details: %s"] = "Your default craft value method was invalid so it has been returned to the default. Details: %s"
--[[Translation missing --]]
TSM.L["Your task list is currently empty."] = "Your task list is currently empty."
--[[Translation missing --]]
TSM.L["You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."] = "You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."
--[[Translation missing --]]
TSM.L["You've been undercut."] = "You've been undercut."
--[[Translation missing --]]
TSM.L["YY/MM/DD HH:MM"] = "YY/MM/DD HH:MM"
	elseif locale == "esMX" then
TSM.L = TSM.L or {}
--[[Translation missing --]]
TSM.L["%d |4Group:Groups; Selected (%d |4Item:Items;)"] = "%d |4Group:Groups; Selected (%d |4Item:Items;)"
TSM.L["%d auctions"] = "%d subastas"
TSM.L["%d Groups"] = "%d Grupos"
TSM.L["%d Items"] = "%d Objetos"
TSM.L["%d of %d"] = "%d de %d"
TSM.L["%d Operations"] = "%d Operaciones"
TSM.L["%d Posted Auctions"] = "%d Subastas publicadas"
TSM.L["%d Sold Auctions"] = "%d Subastas vendidas"
TSM.L["%s (%s bags, %s bank, %s AH, %s mail)"] = "%s (%s Bolsas, %s Banco, %s Casa de subastas, %s Correo)"
TSM.L["%s (%s player, %s alts, %s guild, %s AH)"] = "%s (%s Jugador, %s Alters, %s Hermandad, %s Casa de subastas)"
--[[Translation missing --]]
TSM.L["%s (%s profit)"] = "%s (%s profit)"
--[[Translation missing --]]
TSM.L["%s ago"] = "%s ago"
TSM.L["%s Crafts"] = "%s Creaciones"
TSM.L["%s in guild vault"] = "en cámara de la Hermandad"
TSM.L["%s is a valid custom price but %s is an invalid item."] = "%s es un precio válido, pero% no es un objeto válido."
TSM.L["%s is a valid custom price but did not give a value for %s."] = "%s es un precio válido pero no dio un valor para %s."
--[[Translation missing --]]
TSM.L["'%s' is an invalid operation! Min restock of %d is higher than max restock of %d."] = "'%s' is an invalid operation! Min restock of %d is higher than max restock of %d."
TSM.L["%s is not a valid custom price and gave the following error: %s"] = "%s no es un precio válido y dio el siguiente error:"
TSM.L["%s operation(s)"] = "%s operación(es)"
TSM.L["%s removed."] = "%s eliminado."
--[[Translation missing --]]
TSM.L["%s sent you %s"] = "%s sent you %s"
--[[Translation missing --]]
TSM.L["%s sent you %s and %s"] = "%s sent you %s and %s"
--[[Translation missing --]]
TSM.L["%s sent you a COD of %s for %s"] = "%s sent you a COD of %s for %s"
--[[Translation missing --]]
TSM.L["%s sent you a message: %s"] = "%s sent you a message: %s"
TSM.L["%s total"] = "%s total"
TSM.L["%sDrag%s to move this button"] = "%sArrastra%s para mover este botón "
TSM.L["%sLeft-Click%s to open the main window"] = "%sClick Izquierdo%s para abrir la ventana principal"
TSM.L["(%d/500 Characters)"] = "(%d/500 Personajes)"
TSM.L["(max %d)"] = "(máx %d)"
TSM.L["(max 200)"] = "(máx 200)"
TSM.L["(max 5000)"] = "(máx 5000)"
TSM.L["(min %d - max %d)"] = "(mín %d - máx %d)"
TSM.L["(min 0 - max 10000)"] = "(mín 0 - máx 10000)"
TSM.L["(minimum 0 - maximum 2)"] = "(mínimo 0 - máximo 2)"
TSM.L["(minimum 0 - maximum 20)"] = "(mínimo 0 - máximo 20)"
TSM.L["(minimum 0 - maximum 2000)"] = "(mínimo 0 - máximo 2000)"
TSM.L["(minimum 0 - maximum 30)"] = "(mínimo 0 - máximo 30)"
TSM.L["(minimum 0 - maximum 905)"] = "(mínimo 0 - máximo 905)"
TSM.L["(minimum 0% - maximum 50%)"] = "(mínimo 0% - máximo 50%)"
TSM.L["(minimum 0.5 - maximum 10)"] = "(mínimo 0,5 - máximo 10)"
TSM.L["(minimum 1 - maximum 100)"] = "(mínimo 1 - máximo 100)"
TSM.L["(minimum 8 - maximum 25)"] = "(mínimo 8 - máximo 25)"
--[[Translation missing --]]
TSM.L["(New group(s) will be created)"] = "(New group(s) will be created)"
TSM.L["/tsm help|r - Shows this help listing"] = "/tsm help|r - Muestra este listado de ayuda."
TSM.L["/tsm|r - opens the main TSM window."] = "/tsm|r - Abre la ventana principal de TSM."
--[[Translation missing --]]
TSM.L["_ Hr _ Min ago"] = "_ Hr _ Min ago"
--[[Translation missing --]]
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."] = "|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."
--[[Translation missing --]]
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."] = "|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."
--[[Translation missing --]]
TSM.L["|cffff0000WARNING:|r TSM_AuctionDB doesn't currently have any pricing data for your realm. Either download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update TSM_AuctionDB's data, or run a manual scan in-game."] = "|cffff0000WARNING:|r TSM_AuctionDB doesn't currently have any pricing data for your realm. Either download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update TSM_AuctionDB's data, or run a manual scan in-game."
--[[Translation missing --]]
TSM.L["|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."] = "|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."
--[[Translation missing --]]
TSM.L["|cffffd839Left-Click|r to ignore an item this session."] = "|cffffd839Left-Click|r to ignore an item this session."
--[[Translation missing --]]
TSM.L["|cffffd839Shift-Left-Click|r to ignore it permanently."] = "|cffffd839Shift-Left-Click|r to ignore it permanently."
TSM.L["1 Group"] = "1 Grupo"
TSM.L["1 Item"] = "1 Objeto"
TSM.L["12 hr"] = "12 horas"
TSM.L["24 hr"] = "24 horas"
TSM.L["48 hr"] = "48 horas"
TSM.L["A custom price of %s for %s evaluates to %s."] = "Un precio personalizado de %s para %s se estima en %s."
TSM.L["A maximum of 1 convert() function is allowed."] = "Sólo se permite una única función convert()."
--[[Translation missing --]]
TSM.L["A scan is already in progress. Please stop that scan before starting another one."] = "A scan is already in progress. Please stop that scan before starting another one."
--[[Translation missing --]]
TSM.L["Above max expires."] = "Above max expires."
--[[Translation missing --]]
TSM.L["Above max price. Not posting."] = "Above max price. Not posting."
--[[Translation missing --]]
TSM.L["Above max price. Posting at max price."] = "Above max price. Posting at max price."
--[[Translation missing --]]
TSM.L["Above max price. Posting at min price."] = "Above max price. Posting at min price."
--[[Translation missing --]]
TSM.L["Above max price. Posting at normal price."] = "Above max price. Posting at normal price."
--[[Translation missing --]]
TSM.L["Accepting these item(s) will cost"] = "Accepting these item(s) will cost"
--[[Translation missing --]]
TSM.L["Accepting this item will cost"] = "Accepting this item will cost"
--[[Translation missing --]]
TSM.L["Account sync removed. Please delete the account sync from the other account as well."] = "Account sync removed. Please delete the account sync from the other account as well."
TSM.L["Account Syncing"] = "Sincronizar Cuentas"
--[[Translation missing --]]
TSM.L["Accounting"] = "Accounting"
--[[Translation missing --]]
TSM.L["Accounting Tooltips"] = "Accounting Tooltips"
--[[Translation missing --]]
TSM.L["Activity Type"] = "Activity Type"
TSM.L["ADD %d ITEMS"] = "AGREGAR %d OBJETOS"
TSM.L["Add / Remove Items"] = "Agregar / Eliminar Objetos"
--[[Translation missing --]]
TSM.L["ADD NEW CUSTOM PRICE SOURCE"] = "ADD NEW CUSTOM PRICE SOURCE"
TSM.L["ADD OPERATION"] = "AGREGAR OPERACIÓN"
--[[Translation missing --]]
TSM.L["Add Player"] = "Add Player"
--[[Translation missing --]]
TSM.L["Add Subject / Description"] = "Add Subject / Description"
--[[Translation missing --]]
TSM.L["Add Subject / Description (Optional)"] = "Add Subject / Description (Optional)"
--[[Translation missing --]]
TSM.L["ADD TO MAIL"] = "ADD TO MAIL"
TSM.L["Additional error suppressed"] = "Error Adicional Suprimido"
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be auctioned."] = "Adjust the settings below to set how groups attached to this operation will be auctioned."
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be cancelled."] = "Adjust the settings below to set how groups attached to this operation will be cancelled."
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be priced."] = "Adjust the settings below to set how groups attached to this operation will be priced."
--[[Translation missing --]]
TSM.L["Advanced Item Search"] = "Advanced Item Search"
TSM.L["Advanced Options"] = "Opciones avanzadas"
TSM.L["AH"] = "Casa de Subastas"
--[[Translation missing --]]
TSM.L["AH (Crafting)"] = "AH (Crafting)"
TSM.L["AH (Disenchanting)"] = "Casa de subastas (Desencantando)"
--[[Translation missing --]]
TSM.L["AH BUSY"] = "AH BUSY"
--[[Translation missing --]]
TSM.L["AH Frame Options"] = "AH Frame Options"
--[[Translation missing --]]
TSM.L["AH Rows Shown (requires reload)"] = "AH Rows Shown (requires reload)"
TSM.L["Alarm Clock"] = "Alarma"
TSM.L["All Auctions"] = "Todas las subastas"
TSM.L["All Characters and Guilds"] = "Todos los personajes y hermandades"
TSM.L["All Professions"] = "Todas las profesiones"
--[[Translation missing --]]
TSM.L["Allow partial stack?"] = "Allow partial stack?"
--[[Translation missing --]]
TSM.L["Alt Guild Bank"] = "Alt Guild Bank"
--[[Translation missing --]]
TSM.L["Alts"] = "Alts"
--[[Translation missing --]]
TSM.L["Alts AH"] = "Alts AH"
--[[Translation missing --]]
TSM.L["Amount"] = "Amount"
--[[Translation missing --]]
TSM.L["AMOUNT"] = "AMOUNT"
--[[Translation missing --]]
TSM.L["Amount of Bag Space to Keep Free"] = "Amount of Bag Space to Keep Free"
TSM.L["Applied %s to %s."] = "Aplicado %s a %s."
--[[Translation missing --]]
TSM.L["APPLY FILTERS"] = "APPLY FILTERS"
--[[Translation missing --]]
TSM.L["Apply operation to group:"] = "Apply operation to group:"
--[[Translation missing --]]
TSM.L["Are you sure you want to clear old accounting data?"] = "Are you sure you want to clear old accounting data?"
TSM.L["Are you sure you want to delete this group?"] = "¿Seguro que quieres eliminar el grupo seleccionado?"
TSM.L["Are you sure you want to delete this operation?"] = [=[¿Seguro que quieres eliminar esta operación?
]=]
--[[Translation missing --]]
TSM.L["Are you sure you want to reset all operation settings?"] = "Are you sure you want to reset all operation settings?"
--[[Translation missing --]]
TSM.L["At above max price and not undercut."] = "At above max price and not undercut."
--[[Translation missing --]]
TSM.L["At normal price and not undercut."] = "At normal price and not undercut."
TSM.L["Auction"] = "Subasta"
TSM.L["AUCTION DETAILS"] = "DETALLES DE LA SUBASTA"
TSM.L["Auction Duration"] = "Duración de la subasta"
--[[Translation missing --]]
TSM.L["Auction has been bid on."] = "Auction has been bid on."
TSM.L["Auction Window Close"] = "Cerrar Ventana de Subasta"
TSM.L["Auction Window Open"] = "Abrir Ventana de Subasta"
TSM.L["Auctionator - Auction Value"] = "Subastador - Valor de la subasta"
TSM.L["Auctioneer - Appraiser"] = "Subastador - Valuador"
TSM.L["Auctioneer - Market Value"] = "Subastador - Valor de mercado"
TSM.L["Auctioneer - Minimum Buyout"] = "Subastador - Precio mínimo de compra"
--[[Translation missing --]]
TSM.L["Auctioning"] = "Auctioning"
--[[Translation missing --]]
TSM.L["Auctioning Log"] = "Auctioning Log"
--[[Translation missing --]]
TSM.L["Auctioning Operation"] = "Auctioning Operation"
--[[Translation missing --]]
TSM.L["Auctioning 'POST'/'CANCEL' Button"] = "Auctioning 'POST'/'CANCEL' Button"
TSM.L["Auctions"] = "Subastas"
TSM.L["Auto Quest Complete"] = "Auto misión Completa"
--[[Translation missing --]]
TSM.L["Automatically sell vendor trash?"] = "Automatically sell vendor trash?"
--[[Translation missing --]]
TSM.L["Average Earned Per Day:"] = "Average Earned Per Day:"
--[[Translation missing --]]
TSM.L["Average Prices:"] = "Average Prices:"
--[[Translation missing --]]
TSM.L["Average Profit Per Day:"] = "Average Profit Per Day:"
--[[Translation missing --]]
TSM.L["Average Spent Per Day:"] = "Average Spent Per Day:"
TSM.L["Avg Buy Price"] = "Precio medio de compra"
--[[Translation missing --]]
TSM.L["Avg Resale Profit"] = "Avg Resale Profit"
TSM.L["Avg Sell Price"] = "Precio medio de venta"
--[[Translation missing --]]
TSM.L["BACK TO LIST"] = "BACK TO LIST"
--[[Translation missing --]]
TSM.L["Back to List"] = "Back to List"
TSM.L["Bag"] = "Bolsa"
TSM.L["Bags"] = "Bolsas"
TSM.L["Banks"] = "Bancos"
TSM.L["BankUI Move Delay"] = "Retraso de Movimientos en Interfaz de Banco"
--[[Translation missing --]]
TSM.L["Base Group"] = "Base Group"
--[[Translation missing --]]
TSM.L["Base Item"] = "Base Item"
--[[Translation missing --]]
TSM.L["Batch size"] = "Batch size"
TSM.L["Below are your currently available price sources organized by module. The %skey|r is what you would type into a custom price box."] = "A continuación se encuentran las fuentes de precios actualmente disponibles organizadas por módulo. El %skey|r es lo que escribirías en un cuadro de precio personalizado."
--[[Translation missing --]]
TSM.L["Below custom price:"] = "Below custom price:"
--[[Translation missing --]]
TSM.L["Below min price. Posting at max price."] = "Below min price. Posting at max price."
--[[Translation missing --]]
TSM.L["Below min price. Posting at min price."] = "Below min price. Posting at min price."
--[[Translation missing --]]
TSM.L["Below min price. Posting at normal price."] = "Below min price. Posting at normal price."
--[[Translation missing --]]
TSM.L["Below, you can manage your profiles which allow you to have entirely different sets of groups."] = "Below, you can manage your profiles which allow you to have entirely different sets of groups."
--[[Translation missing --]]
TSM.L["Bid %d / %d"] = "Bid %d / %d"
--[[Translation missing --]]
TSM.L["Bid (item)"] = "Bid (item)"
--[[Translation missing --]]
TSM.L["Bid (stack)"] = "Bid (stack)"
--[[Translation missing --]]
TSM.L["Bid Price"] = "Bid Price"
--[[Translation missing --]]
TSM.L["Bid Sniper Paused"] = "Bid Sniper Paused"
--[[Translation missing --]]
TSM.L["Bid Sniper Running"] = "Bid Sniper Running"
--[[Translation missing --]]
TSM.L["Blacklisted players:"] = "Blacklisted players:"
--[[Translation missing --]]
TSM.L["Bought"] = "Bought"
--[[Translation missing --]]
TSM.L["Bought %sx%d for %s from %s"] = "Bought %sx%d for %s from %s"
--[[Translation missing --]]
TSM.L["Bound Actions"] = "Bound Actions"
--[[Translation missing --]]
TSM.L["BUSY"] = "BUSY"
--[[Translation missing --]]
TSM.L["BUY"] = "BUY"
--[[Translation missing --]]
TSM.L["Buy"] = "Buy"
--[[Translation missing --]]
TSM.L["Buy %d / %d"] = "Buy %d / %d"
--[[Translation missing --]]
TSM.L["Buy %d / %d (Confirming %d / %d)"] = "Buy %d / %d (Confirming %d / %d)"
--[[Translation missing --]]
TSM.L["Buy from AH"] = "Buy from AH"
TSM.L["Buy from Vendor"] = "Comprar al Vendedor"
--[[Translation missing --]]
TSM.L["BUY GROUPS"] = "BUY GROUPS"
--[[Translation missing --]]
TSM.L["Buy Options"] = "Buy Options"
--[[Translation missing --]]
TSM.L["BUYBACK ALL"] = "BUYBACK ALL"
--[[Translation missing --]]
TSM.L["Buyer/Seller"] = "Buyer/Seller"
--[[Translation missing --]]
TSM.L["Buyout (item)"] = "Buyout (item)"
--[[Translation missing --]]
TSM.L["Buyout (stack)"] = "Buyout (stack)"
--[[Translation missing --]]
TSM.L["Buyout Price"] = "Buyout Price"
--[[Translation missing --]]
TSM.L["Buyout Sniper Paused"] = "Buyout Sniper Paused"
--[[Translation missing --]]
TSM.L["Buyout Sniper Running"] = "Buyout Sniper Running"
--[[Translation missing --]]
TSM.L["BUYS"] = "BUYS"
--[[Translation missing --]]
TSM.L["By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."] = "By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."
--[[Translation missing --]]
TSM.L["Can Craft At Least One, Profit, Craftable Quantity"] = "Can Craft At Least One, Profit, Craftable Quantity"
--[[Translation missing --]]
TSM.L["Cancel auctions with bids"] = "Cancel auctions with bids"
TSM.L["Cancel Scan"] = "Cancelar escaneo"
--[[Translation missing --]]
TSM.L["Cancel to repost higher?"] = "Cancel to repost higher?"
--[[Translation missing --]]
TSM.L["Cancel undercut auctions?"] = "Cancel undercut auctions?"
TSM.L["Canceling"] = "Cancelando"
--[[Translation missing --]]
TSM.L["Canceling %d / %d"] = "Canceling %d / %d"
TSM.L["Canceling %d Auctions..."] = "Cancelando %d Subastas..."
TSM.L["Canceling all auctions."] = "Cancelando todas las subastas."
--[[Translation missing --]]
TSM.L["Canceling auction which you've undercut."] = "Canceling auction which you've undercut."
--[[Translation missing --]]
TSM.L["Canceling disabled."] = "Canceling disabled."
TSM.L["Canceling Settings"] = "Cancelando ajustes"
--[[Translation missing --]]
TSM.L["Canceling to repost at higher price."] = "Canceling to repost at higher price."
--[[Translation missing --]]
TSM.L["Canceling to repost at reset price."] = "Canceling to repost at reset price."
--[[Translation missing --]]
TSM.L["Canceling to repost higher."] = "Canceling to repost higher."
--[[Translation missing --]]
TSM.L["Canceling undercut auctions and to repost higher."] = "Canceling undercut auctions and to repost higher."
--[[Translation missing --]]
TSM.L["Canceling undercut auctions."] = "Canceling undercut auctions."
TSM.L["Cancelled"] = "Cancelado"
--[[Translation missing --]]
TSM.L["Cancelled auction of %sx%d"] = "Cancelled auction of %sx%d"
--[[Translation missing --]]
TSM.L["Cancelled Since Last Sale"] = "Cancelled Since Last Sale"
--[[Translation missing --]]
TSM.L["CANCELS"] = "CANCELS"
--[[Translation missing --]]
TSM.L["Cannot repair from the guild bank!"] = "Cannot repair from the guild bank!"
TSM.L["Can't load TSM tooltip while in combat"] = "No se puede cargar la descripción emergente de TSM mientras se está en combate"
TSM.L["Cash Register"] = "Caja registradora"
TSM.L["Character"] = "Personaje"
TSM.L["CHARACTER"] = "PERSONAJE"
TSM.L["Character Bags"] = "Bolsas del personaje"
TSM.L["Character Bank"] = "Banco del personaje"
TSM.L["CHARACTERS"] = "PERSONAJES"
TSM.L["Chat Tab"] = "Pestaña de Chat"
--[[Translation missing --]]
TSM.L["Cheapest auction below min price."] = "Cheapest auction below min price."
TSM.L["Clean Automatically"] = "Borrar automáticamente"
TSM.L["Clear"] = "Limpiar"
TSM.L["Clear All"] = "Borrar todo"
TSM.L["CLEAR DATA"] = "Borrar data"
TSM.L["Clear Filters"] = "Filtros de borrado"
--[[Translation missing --]]
TSM.L["Clear Log After 'X' Amount of Days"] = "Clear Log After 'X' Amount of Days"
--[[Translation missing --]]
TSM.L["Clear Old Data"] = "Clear Old Data"
--[[Translation missing --]]
TSM.L["Clear Old Data Confirmation"] = "Clear Old Data Confirmation"
--[[Translation missing --]]
TSM.L["Clear Queue"] = "Clear Queue"
TSM.L["Clear Selection"] = "Limpiar Seleccion"
--[[Translation missing --]]
TSM.L["COD"] = "COD"
TSM.L["Coins (%s)"] = [=[Monedas (%s)
]=]
--[[Translation missing --]]
TSM.L["Combine Partial Stacks"] = "Combine Partial Stacks"
TSM.L["Combining..."] = "Combinando..."
TSM.L["Configuration Scroll Wheel"] = "Configuración de la rueda del ratón"
TSM.L["Confirm"] = "Confirmar"
--[[Translation missing --]]
TSM.L["Confirm Complete Sound"] = "Confirm Complete Sound"
TSM.L["Confirming %d / %d"] = "Confirmando %d / %d"
TSM.L["Connected to %s"] = "Conectado a %s"
TSM.L["Connecting to %s"] = "Conectando a %s"
--[[Translation missing --]]
TSM.L["CONTACTS"] = "CONTACTS"
--[[Translation missing --]]
TSM.L["Contacts Menu"] = "Contacts Menu"
--[[Translation missing --]]
TSM.L["Cooldown"] = "Cooldown"
--[[Translation missing --]]
TSM.L["Cooldowns"] = "Cooldowns"
--[[Translation missing --]]
TSM.L["Cost"] = "Cost"
--[[Translation missing --]]
TSM.L["Could not apply %s operation %s to %s - it has too many operations already."] = "Could not apply %s operation %s to %s - it has too many operations already."
--[[Translation missing --]]
TSM.L["Could not apply %s operation to group %s because the group does not exist"] = "Could not apply %s operation to group %s because the group does not exist"
--[[Translation missing --]]
TSM.L["Could not create macro as you already have too many. Delete one of your existing macros and try again."] = "Could not create macro as you already have too many. Delete one of your existing macros and try again."
--[[Translation missing --]]
TSM.L["Could not deserialize input"] = "Could not deserialize input"
--[[Translation missing --]]
TSM.L["Could not find enchanted item from"] = "Could not find enchanted item from"
--[[Translation missing --]]
TSM.L["Could not find pet"] = "Could not find pet"
TSM.L["Could not find profile '%s'. Possible profiles: '%s'"] = "No se pudo encontrar el perfil '%s'. Posibles perfiles: '%s'"
--[[Translation missing --]]
TSM.L["Could not sell items due to not having free bag space available to split a stack of items."] = "Could not sell items due to not having free bag space available to split a stack of items."
--[[Translation missing --]]
TSM.L["Craft"] = "Craft"
--[[Translation missing --]]
TSM.L["CRAFT"] = "CRAFT"
--[[Translation missing --]]
TSM.L["Craft (Unprofitable)"] = "Craft (Unprofitable)"
--[[Translation missing --]]
TSM.L["Craft (When Profitable)"] = "Craft (When Profitable)"
--[[Translation missing --]]
TSM.L["Craft All"] = "Craft All"
--[[Translation missing --]]
TSM.L["CRAFT ALL"] = "CRAFT ALL"
--[[Translation missing --]]
TSM.L["Craft Name"] = "Craft Name"
--[[Translation missing --]]
TSM.L["CRAFT NEXT"] = "CRAFT NEXT"
--[[Translation missing --]]
TSM.L["Craft value method:"] = "Craft value method:"
--[[Translation missing --]]
TSM.L["Craftable Quantity, Profit"] = "Craftable Quantity, Profit"
--[[Translation missing --]]
TSM.L["CRAFTER"] = "CRAFTER"
--[[Translation missing --]]
TSM.L["CRAFTING"] = "CRAFTING"
--[[Translation missing --]]
TSM.L["Crafting"] = "Crafting"
--[[Translation missing --]]
TSM.L["Crafting Cost"] = "Crafting Cost"
--[[Translation missing --]]
TSM.L["Crafting 'CRAFT NEXT' Button"] = "Crafting 'CRAFT NEXT' Button"
--[[Translation missing --]]
TSM.L["Crafting Queue"] = "Crafting Queue"
--[[Translation missing --]]
TSM.L["Crafting Tooltips"] = "Crafting Tooltips"
--[[Translation missing --]]
TSM.L["Crafts"] = "Crafts"
--[[Translation missing --]]
TSM.L["Crafts %d"] = "Crafts %d"
--[[Translation missing --]]
TSM.L["CREATE MACRO"] = "CREATE MACRO"
TSM.L["Create New Operation"] = "Crear Nueva Operación"
--[[Translation missing --]]
TSM.L["CREATE NEW PROFILE"] = "CREATE NEW PROFILE"
TSM.L["Crystals"] = "Cristales"
--[[Translation missing --]]
TSM.L["Current Profiles"] = "Current Profiles"
--[[Translation missing --]]
TSM.L["CURRENT SEARCH"] = "CURRENT SEARCH"
--[[Translation missing --]]
TSM.L["CUSTOM POST"] = "CUSTOM POST"
--[[Translation missing --]]
TSM.L["Custom Price"] = "Custom Price"
TSM.L["Custom Price Source"] = "Fuente de Precio Personalizado"
--[[Translation missing --]]
TSM.L["Custom Sources"] = "Custom Sources"
--[[Translation missing --]]
TSM.L["Database Sources"] = "Database Sources"
--[[Translation missing --]]
TSM.L["DD/MM/YY HH:MM"] = "DD/MM/YY HH:MM"
--[[Translation missing --]]
TSM.L["Default Craft Value Method:"] = "Default Craft Value Method:"
--[[Translation missing --]]
TSM.L["Default Material Cost Method:"] = "Default Material Cost Method:"
--[[Translation missing --]]
TSM.L["Default Price"] = "Default Price"
--[[Translation missing --]]
TSM.L["Default Price Configuration"] = "Default Price Configuration"
--[[Translation missing --]]
TSM.L["Default vendoring page"] = "Default vendoring page"
--[[Translation missing --]]
TSM.L["Define whet priority Gathering gives certain sources."] = "Define whet priority Gathering gives certain sources."
--[[Translation missing --]]
TSM.L["Delete Profile Confirmation"] = "Delete Profile Confirmation"
--[[Translation missing --]]
TSM.L["DEPOSIT REAGENTS"] = "DEPOSIT REAGENTS"
TSM.L["Deselect All Groups"] = "Desmarcar Todos los Grupos"
--[[Translation missing --]]
TSM.L["Deselect All Items"] = "Deselect All Items"
--[[Translation missing --]]
TSM.L["Destroy Next"] = "Destroy Next"
TSM.L["Destroy Value"] = "Borrar Valor"
--[[Translation missing --]]
TSM.L["Destroy Value Source"] = "Destroy Value Source"
--[[Translation missing --]]
TSM.L["Destroying"] = "Destroying"
--[[Translation missing --]]
TSM.L["Destroying 'DESTROY NEXT' Button"] = "Destroying 'DESTROY NEXT' Button"
--[[Translation missing --]]
TSM.L["Destroying Tooltips"] = "Destroying Tooltips"
--[[Translation missing --]]
TSM.L["Destroying..."] = "Destroying..."
TSM.L["Details"] = "Detalles"
--[[Translation missing --]]
TSM.L["Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."] = "Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your maximum price (%s) is invalid. Check your settings."] = "Did not cancel %s because your maximum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your minimum price (%s) is invalid. Check your settings."] = "Did not cancel %s because your minimum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your normal price (%s) is invalid. Check your settings."] = "Did not cancel %s because your normal price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your undercut (%s) is invalid. Check your settings."] = "Did not cancel %s because your undercut (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."] = "Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."
--[[Translation missing --]]
TSM.L["Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."] = "Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."
--[[Translation missing --]]
TSM.L["Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."] = "Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."
--[[Translation missing --]]
TSM.L["Did not post %s because your maximum price (%s) is invalid. Check your settings."] = "Did not post %s because your maximum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your minimum price (%s) is invalid. Check your settings."] = "Did not post %s because your minimum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your normal price (%s) is invalid. Check your settings."] = "Did not post %s because your normal price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your stack size (%d) is higher than the max stack size of the item (%d)."] = "Did not post %s because your stack size (%d) is higher than the max stack size of the item (%d)."
--[[Translation missing --]]
TSM.L["Did not post %s because your undercut (%s) is invalid. Check your settings."] = "Did not post %s because your undercut (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Disable invalid price warnings"] = "Disable invalid price warnings"
--[[Translation missing --]]
TSM.L["Disenchant Search"] = "Disenchant Search"
--[[Translation missing --]]
TSM.L["DISENCHANT SEARCH"] = "DISENCHANT SEARCH"
--[[Translation missing --]]
TSM.L["Disenchant Search Options"] = "Disenchant Search Options"
--[[Translation missing --]]
TSM.L["Disenchant Value"] = "Disenchant Value"
--[[Translation missing --]]
TSM.L["Disenchanting Options"] = "Disenchanting Options"
--[[Translation missing --]]
TSM.L["Display auctioning values"] = "Display auctioning values"
--[[Translation missing --]]
TSM.L["Display cancelled since last sale"] = "Display cancelled since last sale"
--[[Translation missing --]]
TSM.L["Display crafting cost"] = "Display crafting cost"
--[[Translation missing --]]
TSM.L["Display detailed destroy info"] = "Display detailed destroy info"
--[[Translation missing --]]
TSM.L["Display disenchant value"] = "Display disenchant value"
--[[Translation missing --]]
TSM.L["Display global historical price"] = "Display global historical price"
--[[Translation missing --]]
TSM.L["Display global market value avg"] = "Display global market value avg"
--[[Translation missing --]]
TSM.L["Display global min buyout avg"] = "Display global min buyout avg"
--[[Translation missing --]]
TSM.L["Display global sale avg"] = "Display global sale avg"
--[[Translation missing --]]
TSM.L["Display group name"] = "Display group name"
--[[Translation missing --]]
TSM.L["Display historical price"] = "Display historical price"
--[[Translation missing --]]
TSM.L["Display market value"] = "Display market value"
--[[Translation missing --]]
TSM.L["Display mill value"] = "Display mill value"
--[[Translation missing --]]
TSM.L["Display min buyout"] = "Display min buyout"
--[[Translation missing --]]
TSM.L["Display Operation Names"] = "Display Operation Names"
--[[Translation missing --]]
TSM.L["Display prospect value"] = "Display prospect value"
--[[Translation missing --]]
TSM.L["Display purchase info"] = "Display purchase info"
--[[Translation missing --]]
TSM.L["Display region historical price"] = "Display region historical price"
--[[Translation missing --]]
TSM.L["Display region market value avg"] = "Display region market value avg"
--[[Translation missing --]]
TSM.L["Display region min buyout avg"] = "Display region min buyout avg"
--[[Translation missing --]]
TSM.L["Display region sale avg"] = "Display region sale avg"
--[[Translation missing --]]
TSM.L["Display region sale rate"] = "Display region sale rate"
--[[Translation missing --]]
TSM.L["Display region sold per day"] = "Display region sold per day"
--[[Translation missing --]]
TSM.L["Display sale info"] = "Display sale info"
--[[Translation missing --]]
TSM.L["Display sale rate"] = "Display sale rate"
--[[Translation missing --]]
TSM.L["Display shopping max price"] = "Display shopping max price"
--[[Translation missing --]]
TSM.L["Display total money recieved in chat?"] = "Display total money recieved in chat?"
--[[Translation missing --]]
TSM.L["Display transform value"] = "Display transform value"
--[[Translation missing --]]
TSM.L["Display vendor buy price"] = "Display vendor buy price"
--[[Translation missing --]]
TSM.L["Display vendor sell price"] = "Display vendor sell price"
--[[Translation missing --]]
TSM.L["Doing so will also remove any sub-groups attached to this group."] = "Doing so will also remove any sub-groups attached to this group."
--[[Translation missing --]]
TSM.L["Done Canceling"] = "Done Canceling"
--[[Translation missing --]]
TSM.L["Done Posting"] = "Done Posting"
--[[Translation missing --]]
TSM.L["Done Scanning"] = "Done Scanning"
--[[Translation missing --]]
TSM.L["Don't post after this many expires:"] = "Don't post after this many expires:"
--[[Translation missing --]]
TSM.L["Don't Post Items"] = "Don't Post Items"
--[[Translation missing --]]
TSM.L["Don't prompt to record trades"] = "Don't prompt to record trades"
--[[Translation missing --]]
TSM.L["DOWN"] = "DOWN"
--[[Translation missing --]]
TSM.L["Drag in Additional Items (%d/%d Items)"] = "Drag in Additional Items (%d/%d Items)"
--[[Translation missing --]]
TSM.L["Drag Item(s) Into Box"] = "Drag Item(s) Into Box"
--[[Translation missing --]]
TSM.L["Duplicate"] = "Duplicate"
--[[Translation missing --]]
TSM.L["Duplicate Profile Confirmation"] = "Duplicate Profile Confirmation"
TSM.L["Dust"] = "Polvo"
--[[Translation missing --]]
TSM.L["Elevate your gold-making!"] = "Elevate your gold-making!"
--[[Translation missing --]]
TSM.L["Embed TSM tooltips"] = "Embed TSM tooltips"
--[[Translation missing --]]
TSM.L["EMPTY BAGS"] = "EMPTY BAGS"
TSM.L["Empty parentheses are not allowed"] = "Los paréntesis vacíos no están permitidos"
TSM.L["Empty price string."] = "Cadena de precio vacía."
--[[Translation missing --]]
TSM.L["Enable automatic stack combination"] = "Enable automatic stack combination"
--[[Translation missing --]]
TSM.L["Enable buying?"] = "Enable buying?"
--[[Translation missing --]]
TSM.L["Enable inbox chat messages"] = "Enable inbox chat messages"
--[[Translation missing --]]
TSM.L["Enable restock?"] = "Enable restock?"
--[[Translation missing --]]
TSM.L["Enable selling?"] = "Enable selling?"
--[[Translation missing --]]
TSM.L["Enable sending chat messages"] = "Enable sending chat messages"
--[[Translation missing --]]
TSM.L["Enable smart crafting for quests"] = "Enable smart crafting for quests"
--[[Translation missing --]]
TSM.L["Enable TSM Tooltips"] = "Enable TSM Tooltips"
--[[Translation missing --]]
TSM.L["Enable tweet enhancement"] = "Enable tweet enhancement"
--[[Translation missing --]]
TSM.L["Enchant Vellum"] = "Enchant Vellum"
--[[Translation missing --]]
TSM.L["Enter a name for the new profile"] = "Enter a name for the new profile"
--[[Translation missing --]]
TSM.L["Enter Filter"] = "Enter Filter"
--[[Translation missing --]]
TSM.L["Enter Keyword"] = "Enter Keyword"
--[[Translation missing --]]
TSM.L["Enter name of logged-in character from other account"] = "Enter name of logged-in character from other account"
--[[Translation missing --]]
TSM.L["Enter player name"] = "Enter player name"
TSM.L["Essences"] = "Esencias"
TSM.L["Establishing connection to %s. Make sure that you've entered this character's name on the other account."] = "Estableciendo conexión a %s. Asegúrate de haber ingresado el nombre de este personaje en la otra cuenta."
--[[Translation missing --]]
TSM.L["Estimated Cost:"] = "Estimated Cost:"
--[[Translation missing --]]
TSM.L["Estimated Profit:"] = "Estimated Profit:"
--[[Translation missing --]]
TSM.L["Exact Match Only?"] = "Exact Match Only?"
--[[Translation missing --]]
TSM.L["Exclude crafts with cooldowns"] = "Exclude crafts with cooldowns"
--[[Translation missing --]]
TSM.L["Expenses"] = "Expenses"
--[[Translation missing --]]
TSM.L["EXPENSES"] = "EXPENSES"
--[[Translation missing --]]
TSM.L["Expired"] = "Expired"
--[[Translation missing --]]
TSM.L["Expired Since Last Sale"] = "Expired Since Last Sale"
--[[Translation missing --]]
TSM.L["Expires"] = "Expires"
--[[Translation missing --]]
TSM.L["EXPIRES"] = "EXPIRES"
TSM.L["Exploration"] = "Exploración"
--[[Translation missing --]]
TSM.L["Export"] = "Export"
--[[Translation missing --]]
TSM.L["Export List"] = "Export List"
--[[Translation missing --]]
TSM.L["Failed Auctions"] = "Failed Auctions"
--[[Translation missing --]]
TSM.L["Failed Since Last Sale (Expired/Cancelled)"] = "Failed Since Last Sale (Expired/Cancelled)"
--[[Translation missing --]]
TSM.L["Failed to bid on auction of %s."] = "Failed to bid on auction of %s."
--[[Translation missing --]]
TSM.L["Failed to buy auction of %s."] = "Failed to buy auction of %s."
--[[Translation missing --]]
TSM.L["Failed to find auction for %s, so removing it from the results."] = "Failed to find auction for %s, so removing it from the results."
--[[Translation missing --]]
TSM.L["Favorite Scans"] = "Favorite Scans"
--[[Translation missing --]]
TSM.L["Favorite Searches"] = "Favorite Searches"
--[[Translation missing --]]
TSM.L["Filter Auctions by Duration"] = "Filter Auctions by Duration"
--[[Translation missing --]]
TSM.L["Filter Auctions by Keyword"] = "Filter Auctions by Keyword"
--[[Translation missing --]]
TSM.L["FILTER BY KEYWORD"] = "FILTER BY KEYWORD"
--[[Translation missing --]]
TSM.L["Filter by Keyword"] = "Filter by Keyword"
--[[Translation missing --]]
TSM.L["Filter group item lists based on the following price source"] = "Filter group item lists based on the following price source"
--[[Translation missing --]]
TSM.L["Filter Items"] = "Filter Items"
--[[Translation missing --]]
TSM.L["Filter Shopping"] = "Filter Shopping"
--[[Translation missing --]]
TSM.L["Finding Selected Auction"] = "Finding Selected Auction"
TSM.L["Fishing Reel In"] = "Pesca - recoger el sedal"
--[[Translation missing --]]
TSM.L["Forget Character"] = "Forget Character"
--[[Translation missing --]]
TSM.L["Found auction sound"] = "Found auction sound"
--[[Translation missing --]]
TSM.L["Friends"] = "Friends"
--[[Translation missing --]]
TSM.L["From"] = "From"
TSM.L["Full"] = "Completo"
--[[Translation missing --]]
TSM.L["Garrison"] = "Garrison"
--[[Translation missing --]]
TSM.L["Gathering"] = "Gathering"
--[[Translation missing --]]
TSM.L["Gathering Search"] = "Gathering Search"
TSM.L["General Options"] = "Opciones Generales"
--[[Translation missing --]]
TSM.L["Get from Bank"] = "Get from Bank"
--[[Translation missing --]]
TSM.L["Get from Guild Bank"] = "Get from Guild Bank"
--[[Translation missing --]]
TSM.L["Global Data Tooltips"] = "Global Data Tooltips"
--[[Translation missing --]]
TSM.L["Global Historical Price"] = "Global Historical Price"
--[[Translation missing --]]
TSM.L["Global Market Value Avg"] = "Global Market Value Avg"
--[[Translation missing --]]
TSM.L["Global Min Buyout Avg"] = "Global Min Buyout Avg"
--[[Translation missing --]]
TSM.L["Global Operation Confirmation"] = "Global Operation Confirmation"
--[[Translation missing --]]
TSM.L["Global Sale Avg"] = "Global Sale Avg"
--[[Translation missing --]]
TSM.L["Gold"] = "Gold"
--[[Translation missing --]]
TSM.L["Gold Earned:"] = "Gold Earned:"
--[[Translation missing --]]
TSM.L["GOLD ON HAND"] = "GOLD ON HAND"
--[[Translation missing --]]
TSM.L["Gold Spent:"] = "Gold Spent:"
--[[Translation missing --]]
TSM.L["GREAT DEALS SEARCH"] = "GREAT DEALS SEARCH"
--[[Translation missing --]]
TSM.L["Group already exists."] = "Group already exists."
TSM.L["Group Management"] = "Administrar Grupo"
--[[Translation missing --]]
TSM.L["Group Operations"] = "Group Operations"
--[[Translation missing --]]
TSM.L["Group Settings"] = "Group Settings"
--[[Translation missing --]]
TSM.L["Grouped Items"] = "Grouped Items"
TSM.L["Groups"] = "Grupos"
--[[Translation missing --]]
TSM.L["Guild"] = "Guild"
--[[Translation missing --]]
TSM.L["Guild Bank"] = "Guild Bank"
--[[Translation missing --]]
TSM.L["GUILDS"] = "GUILDS"
TSM.L["GVault"] = "Cámara Herm."
--[[Translation missing --]]
TSM.L["Have"] = "Have"
--[[Translation missing --]]
TSM.L["Have Materials"] = "Have Materials"
--[[Translation missing --]]
TSM.L["Have Skill Up"] = "Have Skill Up"
--[[Translation missing --]]
TSM.L["Help & Info"] = "Help & Info"
--[[Translation missing --]]
TSM.L["Hide auctions with bids"] = "Hide auctions with bids"
--[[Translation missing --]]
TSM.L["Hide Description"] = "Hide Description"
--[[Translation missing --]]
TSM.L["Hide minimap icon"] = "Hide minimap icon"
--[[Translation missing --]]
TSM.L["Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."] = "Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."
--[[Translation missing --]]
TSM.L["Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."] = "Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."
--[[Translation missing --]]
TSM.L["High Bidder"] = "High Bidder"
--[[Translation missing --]]
TSM.L["Historical Price"] = "Historical Price"
--[[Translation missing --]]
TSM.L["Hold ALT to repair from the guild bank."] = "Hold ALT to repair from the guild bank."
--[[Translation missing --]]
TSM.L["Hr"] = "Hr"
--[[Translation missing --]]
TSM.L["Hrs"] = "Hrs"
--[[Translation missing --]]
TSM.L["I just bought [%s]x%d for %s! %s #TSM4 #warcraft"] = "I just bought [%s]x%d for %s! %s #TSM4 #warcraft"
--[[Translation missing --]]
TSM.L["I just sold [%s] for %s! %s #TSM4 #warcraft"] = "I just sold [%s] for %s! %s #TSM4 #warcraft"
--[[Translation missing --]]
TSM.L["If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."] = "If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."
TSM.L["If you have multiple profile set up with operations, enabling this will cause all but the current profile's operations to be irreversibly lost. Are you sure you want to continue?"] = "Si tienes múltiples perfiles configurados con operaciones, habilitar esto hará que todas las operaciones, excepto las del perfil actual, se pierdan irreversiblemente. Estás seguro de que quieres continuar?"
--[[Translation missing --]]
TSM.L["If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."] = "If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."
--[[Translation missing --]]
TSM.L["Ignore Auctions Below Min"] = "Ignore Auctions Below Min"
--[[Translation missing --]]
TSM.L["Ignore auctions by duration?"] = "Ignore auctions by duration?"
--[[Translation missing --]]
TSM.L["Ignore Characters"] = "Ignore Characters"
--[[Translation missing --]]
TSM.L["Ignore duplicate operations?"] = "Ignore duplicate operations?"
TSM.L["Ignore Guilds"] = "Ignorar Hermandades"
--[[Translation missing --]]
TSM.L["Ignore operation on characters:"] = "Ignore operation on characters:"
--[[Translation missing --]]
TSM.L["Ignore operation on faction-realms:"] = "Ignore operation on faction-realms:"
--[[Translation missing --]]
TSM.L["Ignore random enchants?"] = "Ignore random enchants?"
--[[Translation missing --]]
TSM.L["Ignored Cooldowns"] = "Ignored Cooldowns"
--[[Translation missing --]]
TSM.L["Ignored Items"] = "Ignored Items"
TSM.L["ilvl"] = "Nivel de objeto"
--[[Translation missing --]]
TSM.L["Import"] = "Import"
--[[Translation missing --]]
TSM.L["IMPORT"] = "IMPORT"
--[[Translation missing --]]
TSM.L["Import %d Items and %s Operations?"] = "Import %d Items and %s Operations?"
--[[Translation missing --]]
TSM.L["Import Groups & Operations"] = "Import Groups & Operations"
--[[Translation missing --]]
TSM.L["Imported Items"] = "Imported Items"
--[[Translation missing --]]
TSM.L["Imported Operations"] = "Imported Operations"
--[[Translation missing --]]
TSM.L["Inbox Settings"] = "Inbox Settings"
--[[Translation missing --]]
TSM.L["Include Attached Operations"] = "Include Attached Operations"
--[[Translation missing --]]
TSM.L["Include operations?"] = "Include operations?"
--[[Translation missing --]]
TSM.L["Include soulbound items"] = "Include soulbound items"
--[[Translation missing --]]
TSM.L["Information"] = "Information"
--[[Translation missing --]]
TSM.L["Invalid custom price entered."] = "Invalid custom price entered."
--[[Translation missing --]]
TSM.L["Invalid custom price source for %s. %s"] = "Invalid custom price source for %s. %s"
TSM.L["Invalid custom price."] = "Precio personalizado no válido"
TSM.L["Invalid function."] = "Función inválida."
--[[Translation missing --]]
TSM.L["Invalid group name."] = "Invalid group name."
TSM.L["Invalid item link."] = "Enlace de Objeto inválido."
--[[Translation missing --]]
TSM.L["Invalid operation name."] = "Invalid operation name."
TSM.L["Invalid operator at end of custom price."] = "Operador inválido al final del precio personalizado."
TSM.L["Invalid parameter to price source."] = "Parámetro no válido para la fuente de precio."
--[[Translation missing --]]
TSM.L["Invalid player name."] = "Invalid player name."
TSM.L["Invalid price source in convert."] = "Fuente de precio inválida en convertir."
--[[Translation missing --]]
TSM.L["Invalid price source."] = "Invalid price source."
--[[Translation missing --]]
TSM.L["Invalid seller data returned by server."] = "Invalid seller data returned by server."
TSM.L["Invalid word: '%s'"] = "Palabra inválida: '%s'"
--[[Translation missing --]]
TSM.L["Inventory"] = "Inventory"
--[[Translation missing --]]
TSM.L["Inventory / Mailing"] = "Inventory / Mailing"
--[[Translation missing --]]
TSM.L["Inventory Options"] = "Inventory Options"
--[[Translation missing --]]
TSM.L["Inventory Tooltip Format"] = "Inventory Tooltip Format"
TSM.L["It appears that you've manually copied your saved variables between accounts which will cause TSM's automatic sync'ing to not work. You'll need to undo this, and/or delete the TradeSkillMaster and TSM_Crafting saved variables files on both accounts (with WoW closed) in order to fix this."] = "Parece que ha copiado manualmente las variables guardadas entre cuentas, lo que provocará que la sincronización automática de TSM no funcione. Tendrás que deshacer esto, y / o eliminar los archivos de variables guardadas de TradeSkillMaster y TSM_Crafting en ambas cuentas (con WoW cerrado) para solucionarlo."
TSM.L["Item"] = "Objeto"
--[[Translation missing --]]
TSM.L["ITEM CLASS"] = "ITEM CLASS"
--[[Translation missing --]]
TSM.L["Item Level"] = "Item Level"
--[[Translation missing --]]
TSM.L["ITEM LEVEL RANGE"] = "ITEM LEVEL RANGE"
TSM.L["Item links may only be used as parameters to price sources."] = "Los enlaces de objetos solo se pueden usar como parámetros para las fuentes de precios."
TSM.L["Item Name"] = "Nombre de Objeto"
--[[Translation missing --]]
TSM.L["Item Quality"] = "Item Quality"
--[[Translation missing --]]
TSM.L["ITEM SEARCH"] = "ITEM SEARCH"
--[[Translation missing --]]
TSM.L["ITEM SUBCLASS"] = "ITEM SUBCLASS"
--[[Translation missing --]]
TSM.L["Item Value"] = "Item Value"
--[[Translation missing --]]
TSM.L["Item/Group is invalid (see chat)."] = "Item/Group is invalid (see chat)."
--[[Translation missing --]]
TSM.L["ITEMS"] = "ITEMS"
TSM.L["Items"] = "Objetos"
--[[Translation missing --]]
TSM.L["Items in Bags"] = "Items in Bags"
--[[Translation missing --]]
TSM.L["Keep in bags quantity:"] = "Keep in bags quantity:"
--[[Translation missing --]]
TSM.L["Keep in bank quantity:"] = "Keep in bank quantity:"
--[[Translation missing --]]
TSM.L["Keep posted:"] = "Keep posted:"
--[[Translation missing --]]
TSM.L["Keep quantity:"] = "Keep quantity:"
--[[Translation missing --]]
TSM.L["Keep this amount in bags:"] = "Keep this amount in bags:"
--[[Translation missing --]]
TSM.L["Keep this amount:"] = "Keep this amount:"
--[[Translation missing --]]
TSM.L["Keeping %d."] = "Keeping %d."
--[[Translation missing --]]
TSM.L["Keeping undercut auctions posted."] = "Keeping undercut auctions posted."
--[[Translation missing --]]
TSM.L["Last 14 Days"] = "Last 14 Days"
--[[Translation missing --]]
TSM.L["Last 3 Days"] = "Last 3 Days"
--[[Translation missing --]]
TSM.L["Last 30 Days"] = "Last 30 Days"
--[[Translation missing --]]
TSM.L["LAST 30 DAYS"] = "LAST 30 DAYS"
--[[Translation missing --]]
TSM.L["Last 60 Days"] = "Last 60 Days"
--[[Translation missing --]]
TSM.L["Last 7 Days"] = "Last 7 Days"
--[[Translation missing --]]
TSM.L["LAST 7 DAYS"] = "LAST 7 DAYS"
--[[Translation missing --]]
TSM.L["Last Data Update:"] = "Last Data Update:"
--[[Translation missing --]]
TSM.L["Last Purchased"] = "Last Purchased"
--[[Translation missing --]]
TSM.L["Last Sold"] = "Last Sold"
TSM.L["Level Up"] = "Subida de Nivel"
--[[Translation missing --]]
TSM.L["LIMIT"] = "LIMIT"
--[[Translation missing --]]
TSM.L["Link to Another Operation"] = "Link to Another Operation"
--[[Translation missing --]]
TSM.L["List"] = "List"
--[[Translation missing --]]
TSM.L["List materials in tooltip"] = "List materials in tooltip"
--[[Translation missing --]]
TSM.L["Loading Mails..."] = "Loading Mails..."
--[[Translation missing --]]
TSM.L["Loading..."] = "Loading..."
TSM.L["Looks like TradeSkillMaster has encountered an error. Please help the author fix this error by following the instructions shown."] = "Parece que TradeSkillMaster ha encontrado un error. Por favor, ayuda el autor solucionar este error, siguiendo las instrucciones que se muestran."
TSM.L["Loop detected in the following custom price:"] = "bucle detectado en el siguiente precio personalizado:"
--[[Translation missing --]]
TSM.L["Lowest auction by whitelisted player."] = "Lowest auction by whitelisted player."
TSM.L["Macro created and scroll wheel bound!"] = "¡Macro creada y rueda de desplazamiento enlazada!"
TSM.L["Macro Setup"] = "Configuración de macro."
TSM.L["Mail"] = "Correo"
--[[Translation missing --]]
TSM.L["Mail Disenchantables"] = "Mail Disenchantables"
--[[Translation missing --]]
TSM.L["Mail Disenchantables Max Quality"] = "Mail Disenchantables Max Quality"
--[[Translation missing --]]
TSM.L["MAIL SELECTED GROUPS"] = "MAIL SELECTED GROUPS"
--[[Translation missing --]]
TSM.L["Mail to %s"] = "Mail to %s"
--[[Translation missing --]]
TSM.L["Mailing"] = "Mailing"
--[[Translation missing --]]
TSM.L["Mailing all to %s."] = "Mailing all to %s."
--[[Translation missing --]]
TSM.L["Mailing Options"] = "Mailing Options"
--[[Translation missing --]]
TSM.L["Mailing up to %d to %s."] = "Mailing up to %d to %s."
--[[Translation missing --]]
TSM.L["Main Settings"] = "Main Settings"
--[[Translation missing --]]
TSM.L["Make Cash On Delivery?"] = "Make Cash On Delivery?"
--[[Translation missing --]]
TSM.L["Management Options"] = "Management Options"
--[[Translation missing --]]
TSM.L["Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."] = "Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."
TSM.L["Map Ping"] = "Ping en Mapa"
--[[Translation missing --]]
TSM.L["Market Value"] = "Market Value"
--[[Translation missing --]]
TSM.L["Market Value Price Source"] = "Market Value Price Source"
--[[Translation missing --]]
TSM.L["Market Value Source"] = "Market Value Source"
--[[Translation missing --]]
TSM.L["Mat Cost"] = "Mat Cost"
--[[Translation missing --]]
TSM.L["Mat Price"] = "Mat Price"
--[[Translation missing --]]
TSM.L["Match stack size?"] = "Match stack size?"
--[[Translation missing --]]
TSM.L["Match whitelisted players"] = "Match whitelisted players"
--[[Translation missing --]]
TSM.L["Material Name"] = "Material Name"
--[[Translation missing --]]
TSM.L["Materials"] = "Materials"
--[[Translation missing --]]
TSM.L["Materials to Gather"] = "Materials to Gather"
--[[Translation missing --]]
TSM.L["Max Destroy Value"] = "Max Destroy Value"
--[[Translation missing --]]
TSM.L["MAX EXPIRES TO BANK"] = "MAX EXPIRES TO BANK"
--[[Translation missing --]]
TSM.L["Max Market Value"] = "Max Market Value"
--[[Translation missing --]]
TSM.L["Max Shopping Price"] = "Max Shopping Price"
--[[Translation missing --]]
TSM.L["Maximum amount already posted."] = "Maximum amount already posted."
--[[Translation missing --]]
TSM.L["Maximum Auction Price (Per Item)"] = "Maximum Auction Price (Per Item)"
--[[Translation missing --]]
TSM.L["Maximum Destroy Value (Enter '0c' to disable)"] = "Maximum Destroy Value (Enter '0c' to disable)"
--[[Translation missing --]]
TSM.L["Maximum disenchant level:"] = "Maximum disenchant level:"
--[[Translation missing --]]
TSM.L["Maximum Disenchant Quality"] = "Maximum Disenchant Quality"
--[[Translation missing --]]
TSM.L["Maximum disenchant search percentage:"] = "Maximum disenchant search percentage:"
--[[Translation missing --]]
TSM.L["Maximum Market Value (Enter '0c' to disable)"] = "Maximum Market Value (Enter '0c' to disable)"
--[[Translation missing --]]
TSM.L["MAXIMUM QUANTITY TO BUY:"] = "MAXIMUM QUANTITY TO BUY:"
--[[Translation missing --]]
TSM.L["Maximum quantity:"] = "Maximum quantity:"
--[[Translation missing --]]
TSM.L["Maximum restock quantity:"] = "Maximum restock quantity:"
--[[Translation missing --]]
TSM.L["Mill Value"] = "Mill Value"
--[[Translation missing --]]
TSM.L["Min"] = "Min"
--[[Translation missing --]]
TSM.L["Min Buyout"] = "Min Buyout"
--[[Translation missing --]]
TSM.L["Min/Normal/Max Prices"] = "Min/Normal/Max Prices"
--[[Translation missing --]]
TSM.L["Minimum Days Old"] = "Minimum Days Old"
--[[Translation missing --]]
TSM.L["Minimum disenchant level:"] = "Minimum disenchant level:"
--[[Translation missing --]]
TSM.L["Minimum expires:"] = "Minimum expires:"
--[[Translation missing --]]
TSM.L["Minimum profit:"] = "Minimum profit:"
--[[Translation missing --]]
TSM.L["MINIMUM RARITY"] = "MINIMUM RARITY"
--[[Translation missing --]]
TSM.L["Minimum restock quantity:"] = "Minimum restock quantity:"
TSM.L["Misplaced comma"] = "Coma fuera de lugar"
--[[Translation missing --]]
TSM.L["Missing Materials"] = "Missing Materials"
--[[Translation missing --]]
TSM.L["MM/DD/YY HH:MM"] = "MM/DD/YY HH:MM"
TSM.L["Modifiers:"] = "Modificadores:"
TSM.L["Money Frame Open"] = "Marco de dinero abierto"
--[[Translation missing --]]
TSM.L["Money Transfer"] = "Money Transfer"
--[[Translation missing --]]
TSM.L["Most Profitable Item:"] = "Most Profitable Item:"
--[[Translation missing --]]
TSM.L["MOVE"] = "MOVE"
--[[Translation missing --]]
TSM.L["Move already grouped items?"] = "Move already grouped items?"
--[[Translation missing --]]
TSM.L["Move Quantity Settings"] = "Move Quantity Settings"
--[[Translation missing --]]
TSM.L["MOVE TO BAGS"] = "MOVE TO BAGS"
--[[Translation missing --]]
TSM.L["MOVE TO BANK"] = "MOVE TO BANK"
--[[Translation missing --]]
TSM.L["MOVING"] = "MOVING"
--[[Translation missing --]]
TSM.L["Moving"] = "Moving"
--[[Translation missing --]]
TSM.L["Multiple Items"] = "Multiple Items"
--[[Translation missing --]]
TSM.L["My Auctions"] = "My Auctions"
--[[Translation missing --]]
TSM.L["My Auctions 'CANCEL' Button"] = "My Auctions 'CANCEL' Button"
--[[Translation missing --]]
TSM.L["Neat Stacks only?"] = "Neat Stacks only?"
--[[Translation missing --]]
TSM.L["NEED MATS"] = "NEED MATS"
TSM.L["New Group"] = "Nuevo grupo"
TSM.L["New Operation"] = "Nueva Operación"
--[[Translation missing --]]
TSM.L["NEWS AND INFORMATION"] = "NEWS AND INFORMATION"
--[[Translation missing --]]
TSM.L["No Attachments"] = "No Attachments"
--[[Translation missing --]]
TSM.L["No Data"] = "No Data"
--[[Translation missing --]]
TSM.L["No group selected"] = "No group selected"
--[[Translation missing --]]
TSM.L["No item specified. Usage: /tsm restock_help [ITEM_LINK]"] = "No item specified. Usage: /tsm restock_help [ITEM_LINK]"
--[[Translation missing --]]
TSM.L["NO ITEMS"] = "NO ITEMS"
--[[Translation missing --]]
TSM.L["No Materials to Gather"] = "No Materials to Gather"
--[[Translation missing --]]
TSM.L["No Operation Selected"] = "No Operation Selected"
--[[Translation missing --]]
TSM.L["No posting."] = "No posting."
--[[Translation missing --]]
TSM.L["No Profession Opened"] = "No Profession Opened"
--[[Translation missing --]]
TSM.L["No Profession Selected"] = "No Profession Selected"
TSM.L["No profile specified. Possible profiles: '%s'"] = "Sin perfil especificado. Posibles perfiles: '%s' "
--[[Translation missing --]]
TSM.L["No recent AuctionDB scan data found."] = "No recent AuctionDB scan data found."
TSM.L["No Sound"] = "Sin sonido"
TSM.L["None"] = "Ninguno"
TSM.L["None (Always Show)"] = "Ninguno (Mostrar siempre)"
--[[Translation missing --]]
TSM.L["None Selected"] = "None Selected"
--[[Translation missing --]]
TSM.L["NONGROUP TO BANK"] = "NONGROUP TO BANK"
--[[Translation missing --]]
TSM.L["Normal"] = "Normal"
--[[Translation missing --]]
TSM.L["Not canceling auction at reset price."] = "Not canceling auction at reset price."
--[[Translation missing --]]
TSM.L["Not canceling auction below min price."] = "Not canceling auction below min price."
--[[Translation missing --]]
TSM.L["Not canceling."] = "Not canceling."
--[[Translation missing --]]
TSM.L["Not enough items in bags."] = "Not enough items in bags."
--[[Translation missing --]]
TSM.L["NOT OPEN"] = "NOT OPEN"
--[[Translation missing --]]
TSM.L["Not Scanned"] = "Not Scanned"
--[[Translation missing --]]
TSM.L["NPC"] = "NPC"
--[[Translation missing --]]
TSM.L["Number Owned"] = "Number Owned"
--[[Translation missing --]]
TSM.L["of"] = "of"
TSM.L["Offline"] = "Desconectado"
--[[Translation missing --]]
TSM.L["Old TSM addons detected. TSM has disabled them and requires a reload."] = "Old TSM addons detected. TSM has disabled them and requires a reload."
--[[Translation missing --]]
TSM.L["On Cooldown"] = "On Cooldown"
--[[Translation missing --]]
TSM.L["Only show craftable"] = "Only show craftable"
--[[Translation missing --]]
TSM.L["Only show items with disenchant value above custom price"] = "Only show items with disenchant value above custom price"
--[[Translation missing --]]
TSM.L["OPEN"] = "OPEN"
--[[Translation missing --]]
TSM.L["Open all bags when auctioning"] = "Open all bags when auctioning"
--[[Translation missing --]]
TSM.L["OPEN ALL MAIL"] = "OPEN ALL MAIL"
--[[Translation missing --]]
TSM.L["Open Mail"] = "Open Mail"
--[[Translation missing --]]
TSM.L["Open Mail Complete Sound"] = "Open Mail Complete Sound"
--[[Translation missing --]]
TSM.L["Open Task List"] = "Open Task List"
--[[Translation missing --]]
TSM.L["Operation"] = "Operation"
TSM.L["Operations"] = "Operaciones"
--[[Translation missing --]]
TSM.L["Other Character"] = "Other Character"
--[[Translation missing --]]
TSM.L["Other Settings"] = "Other Settings"
--[[Translation missing --]]
TSM.L["Other Shopping Searches"] = "Other Shopping Searches"
--[[Translation missing --]]
TSM.L["Override default craft value method?"] = "Override default craft value method?"
--[[Translation missing --]]
TSM.L["Override parent operations"] = "Override parent operations"
--[[Translation missing --]]
TSM.L["Parent Items"] = "Parent Items"
--[[Translation missing --]]
TSM.L["Past 7 Days"] = "Past 7 Days"
--[[Translation missing --]]
TSM.L["Past Day"] = "Past Day"
--[[Translation missing --]]
TSM.L["Past Month"] = "Past Month"
--[[Translation missing --]]
TSM.L["Past Year"] = "Past Year"
--[[Translation missing --]]
TSM.L["Paste string here"] = "Paste string here"
--[[Translation missing --]]
TSM.L["Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."] = "Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."
--[[Translation missing --]]
TSM.L["Per Item"] = "Per Item"
--[[Translation missing --]]
TSM.L["Per Stack"] = "Per Stack"
--[[Translation missing --]]
TSM.L["Per Unit"] = "Per Unit"
TSM.L["Player Gold"] = "Oro de Personaje."
TSM.L["Player Invite Accept"] = "Aceptar invitación de jugador."
--[[Translation missing --]]
TSM.L["Please select a group to export"] = "Please select a group to export"
--[[Translation missing --]]
TSM.L["POST"] = "POST"
--[[Translation missing --]]
TSM.L["Post at Maximum Price"] = "Post at Maximum Price"
--[[Translation missing --]]
TSM.L["Post at Minimum Price"] = "Post at Minimum Price"
--[[Translation missing --]]
TSM.L["Post at Normal Price"] = "Post at Normal Price"
--[[Translation missing --]]
TSM.L["POST CAP TO BAGS"] = "POST CAP TO BAGS"
--[[Translation missing --]]
TSM.L["Post Scan"] = "Post Scan"
--[[Translation missing --]]
TSM.L["POST SELECTED"] = "POST SELECTED"
--[[Translation missing --]]
TSM.L["POSTAGE"] = "POSTAGE"
--[[Translation missing --]]
TSM.L["Postage"] = "Postage"
--[[Translation missing --]]
TSM.L["Posted at whitelisted player's price."] = "Posted at whitelisted player's price."
--[[Translation missing --]]
TSM.L["Posted Auctions %s:"] = "Posted Auctions %s:"
--[[Translation missing --]]
TSM.L["Posting"] = "Posting"
--[[Translation missing --]]
TSM.L["Posting %d / %d"] = "Posting %d / %d"
--[[Translation missing --]]
TSM.L["Posting %d stack(s) of %d for %d hours."] = "Posting %d stack(s) of %d for %d hours."
--[[Translation missing --]]
TSM.L["Posting at normal price."] = "Posting at normal price."
--[[Translation missing --]]
TSM.L["Posting at whitelisted player's price."] = "Posting at whitelisted player's price."
--[[Translation missing --]]
TSM.L["Posting at your current price."] = "Posting at your current price."
--[[Translation missing --]]
TSM.L["Posting disabled."] = "Posting disabled."
--[[Translation missing --]]
TSM.L["Posting Settings"] = "Posting Settings"
--[[Translation missing --]]
TSM.L["Potential"] = "Potential"
--[[Translation missing --]]
TSM.L["Price Settings"] = "Price Settings"
--[[Translation missing --]]
TSM.L["PRICE SOURCE"] = "PRICE SOURCE"
--[[Translation missing --]]
TSM.L["Price source with name '%s' already exists."] = "Price source with name '%s' already exists."
--[[Translation missing --]]
TSM.L["Price Variables"] = "Price Variables"
--[[Translation missing --]]
TSM.L["Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."] = "Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."
--[[Translation missing --]]
TSM.L["PROFESSION"] = "PROFESSION"
--[[Translation missing --]]
TSM.L["Profession Filters"] = "Profession Filters"
--[[Translation missing --]]
TSM.L["Profession loading..."] = "Profession loading..."
--[[Translation missing --]]
TSM.L["Professions Used In"] = "Professions Used In"
TSM.L["Profile changed to '%s'."] = "Perfil cambiado a '%s'."
TSM.L["Profiles"] = "Perfiles"
--[[Translation missing --]]
TSM.L["Profit"] = "Profit"
--[[Translation missing --]]
TSM.L["PROFIT"] = "PROFIT"
--[[Translation missing --]]
TSM.L["Profit Deduction"] = "Profit Deduction"
--[[Translation missing --]]
TSM.L["Profit, Craftable Quantity"] = "Profit, Craftable Quantity"
--[[Translation missing --]]
TSM.L["Prospect Value"] = "Prospect Value"
--[[Translation missing --]]
TSM.L["PURCHASE DATA"] = "PURCHASE DATA"
--[[Translation missing --]]
TSM.L["Purchased (Min/Avg/Max Price)"] = "Purchased (Min/Avg/Max Price)"
--[[Translation missing --]]
TSM.L["Purchased (Total Price)"] = "Purchased (Total Price)"
--[[Translation missing --]]
TSM.L["Purchases"] = "Purchases"
--[[Translation missing --]]
TSM.L["Qty"] = "Qty"
--[[Translation missing --]]
TSM.L["Quantity Bought:"] = "Quantity Bought:"
--[[Translation missing --]]
TSM.L["Quantity Sold:"] = "Quantity Sold:"
--[[Translation missing --]]
TSM.L["Quantity to move:"] = "Quantity to move:"
TSM.L["Quest Added"] = "Misión Agregada"
TSM.L["Quest Completed"] = "Misión Completada"
TSM.L["Quest Objectives Complete"] = "Objetivos de misión completados."
--[[Translation missing --]]
TSM.L["QUEUE"] = "QUEUE"
--[[Translation missing --]]
TSM.L["Queue Sorting Method"] = "Queue Sorting Method"
--[[Translation missing --]]
TSM.L["Quick Sell"] = "Quick Sell"
--[[Translation missing --]]
TSM.L["Quick Sell Options"] = "Quick Sell Options"
--[[Translation missing --]]
TSM.L["Quickly mail all excess disenchantable items to a character"] = "Quickly mail all excess disenchantable items to a character"
--[[Translation missing --]]
TSM.L["Quickly mail all excess gold (limited to a certain amount) to a character"] = "Quickly mail all excess gold (limited to a certain amount) to a character"
TSM.L["Raid Warning"] = "Alerta de Banda"
--[[Translation missing --]]
TSM.L["Read More"] = "Read More"
TSM.L["Ready Check"] = "Comprobación de listo"
--[[Translation missing --]]
TSM.L["Ready to Cancel"] = "Ready to Cancel"
--[[Translation missing --]]
TSM.L["Reagent Bank"] = "Reagent Bank"
--[[Translation missing --]]
TSM.L["Realm Data Tooltips"] = "Realm Data Tooltips"
--[[Translation missing --]]
TSM.L["Recent Scans"] = "Recent Scans"
--[[Translation missing --]]
TSM.L["Recent Searches"] = "Recent Searches"
--[[Translation missing --]]
TSM.L["Recently Mailed"] = "Recently Mailed"
--[[Translation missing --]]
TSM.L["RECIPIENT"] = "RECIPIENT"
--[[Translation missing --]]
TSM.L["Region Avg Daily Sold"] = "Region Avg Daily Sold"
--[[Translation missing --]]
TSM.L["Region Data Tooltips"] = "Region Data Tooltips"
--[[Translation missing --]]
TSM.L["Region Historical Price"] = "Region Historical Price"
--[[Translation missing --]]
TSM.L["Region Market Value Avg"] = "Region Market Value Avg"
--[[Translation missing --]]
TSM.L["Region Min Buyout Avg"] = "Region Min Buyout Avg"
--[[Translation missing --]]
TSM.L["Region Sale Avg"] = "Region Sale Avg"
--[[Translation missing --]]
TSM.L["Region Sale Rate"] = "Region Sale Rate"
--[[Translation missing --]]
TSM.L["Reload"] = "Reload"
--[[Translation missing --]]
TSM.L["REMOVE %d ITEMS"] = "REMOVE %d ITEMS"
--[[Translation missing --]]
TSM.L["Removed a total of %s old records."] = "Removed a total of %s old records."
--[[Translation missing --]]
TSM.L["REPAIR"] = "REPAIR"
--[[Translation missing --]]
TSM.L["Repair Bill"] = "Repair Bill"
TSM.L["Replace"] = "Reemplazar"
--[[Translation missing --]]
TSM.L["REPLY"] = "REPLY"
--[[Translation missing --]]
TSM.L["REPORT SPAM"] = "REPORT SPAM"
--[[Translation missing --]]
TSM.L["Repost Higher Threshold"] = "Repost Higher Threshold"
--[[Translation missing --]]
TSM.L["Required Level"] = "Required Level"
--[[Translation missing --]]
TSM.L["REQUIRED LEVEL RANGE"] = "REQUIRED LEVEL RANGE"
--[[Translation missing --]]
TSM.L["Requires TSM Desktop Application"] = "Requires TSM Desktop Application"
--[[Translation missing --]]
TSM.L["Resale"] = "Resale"
--[[Translation missing --]]
TSM.L["RESCAN"] = "RESCAN"
--[[Translation missing --]]
TSM.L["RESET"] = "RESET"
--[[Translation missing --]]
TSM.L["Reset All"] = "Reset All"
--[[Translation missing --]]
TSM.L["Reset Filters"] = "Reset Filters"
--[[Translation missing --]]
TSM.L["Reset Profile Confirmation"] = "Reset Profile Confirmation"
--[[Translation missing --]]
TSM.L["RESTART"] = "RESTART"
--[[Translation missing --]]
TSM.L["Restart Delay (minutes)"] = "Restart Delay (minutes)"
--[[Translation missing --]]
TSM.L["RESTOCK BAGS"] = "RESTOCK BAGS"
--[[Translation missing --]]
TSM.L["Restock help for %s:"] = "Restock help for %s:"
--[[Translation missing --]]
TSM.L["Restock Quantity Settings"] = "Restock Quantity Settings"
--[[Translation missing --]]
TSM.L["Restock quantity:"] = "Restock quantity:"
--[[Translation missing --]]
TSM.L["RESTOCK SELECTED GROUPS"] = "RESTOCK SELECTED GROUPS"
--[[Translation missing --]]
TSM.L["Restock Settings"] = "Restock Settings"
--[[Translation missing --]]
TSM.L["Restock target to max quantity?"] = "Restock target to max quantity?"
--[[Translation missing --]]
TSM.L["Restocking to %d."] = "Restocking to %d."
--[[Translation missing --]]
TSM.L["Restocking to a max of %d (min of %d) with a min profit."] = "Restocking to a max of %d (min of %d) with a min profit."
--[[Translation missing --]]
TSM.L["Restocking to a max of %d (min of %d) with no min profit."] = "Restocking to a max of %d (min of %d) with no min profit."
--[[Translation missing --]]
TSM.L["RESTORE BAGS"] = "RESTORE BAGS"
--[[Translation missing --]]
TSM.L["Resume Scan"] = "Resume Scan"
--[[Translation missing --]]
TSM.L["Retrying %d auction(s) which failed."] = "Retrying %d auction(s) which failed."
--[[Translation missing --]]
TSM.L["Revenue"] = "Revenue"
--[[Translation missing --]]
TSM.L["Round normal price"] = "Round normal price"
--[[Translation missing --]]
TSM.L["RUN ADVANCED ITEM SEARCH"] = "RUN ADVANCED ITEM SEARCH"
--[[Translation missing --]]
TSM.L["Run Bid Sniper"] = "Run Bid Sniper"
--[[Translation missing --]]
TSM.L["Run Buyout Sniper"] = "Run Buyout Sniper"
--[[Translation missing --]]
TSM.L["RUN CANCEL SCAN"] = "RUN CANCEL SCAN"
--[[Translation missing --]]
TSM.L["RUN POST SCAN"] = "RUN POST SCAN"
--[[Translation missing --]]
TSM.L["RUN SHOPPING SCAN"] = "RUN SHOPPING SCAN"
--[[Translation missing --]]
TSM.L["Running Sniper Scan"] = "Running Sniper Scan"
--[[Translation missing --]]
TSM.L["Sale"] = "Sale"
--[[Translation missing --]]
TSM.L["SALE DATA"] = "SALE DATA"
--[[Translation missing --]]
TSM.L["Sale Rate"] = "Sale Rate"
--[[Translation missing --]]
TSM.L["Sales"] = "Sales"
--[[Translation missing --]]
TSM.L["SALES"] = "SALES"
--[[Translation missing --]]
TSM.L["Sales Summary"] = "Sales Summary"
--[[Translation missing --]]
TSM.L["SCAN ALL"] = "SCAN ALL"
--[[Translation missing --]]
TSM.L["Scan Complete Sound"] = "Scan Complete Sound"
--[[Translation missing --]]
TSM.L["Scan Paused"] = "Scan Paused"
--[[Translation missing --]]
TSM.L["SCANNING"] = "SCANNING"
--[[Translation missing --]]
TSM.L["Scanning %d / %d (Page %d / %d)"] = "Scanning %d / %d (Page %d / %d)"
--[[Translation missing --]]
TSM.L["Scroll wheel direction:"] = "Scroll wheel direction:"
--[[Translation missing --]]
TSM.L["Search"] = "Search"
--[[Translation missing --]]
TSM.L["Search Bags"] = "Search Bags"
--[[Translation missing --]]
TSM.L["Search for Item"] = "Search for Item"
--[[Translation missing --]]
TSM.L["Search Groups"] = "Search Groups"
--[[Translation missing --]]
TSM.L["Search Inbox"] = "Search Inbox"
--[[Translation missing --]]
TSM.L["Search Operations"] = "Search Operations"
--[[Translation missing --]]
TSM.L["Search Patterns"] = "Search Patterns"
--[[Translation missing --]]
TSM.L["Search Usable Items Only?"] = "Search Usable Items Only?"
--[[Translation missing --]]
TSM.L["Search Vendor"] = "Search Vendor"
--[[Translation missing --]]
TSM.L["Select a Source"] = "Select a Source"
--[[Translation missing --]]
TSM.L["Select Action"] = "Select Action"
TSM.L["Select All Groups"] = "Seleccionar todos los grupos"
--[[Translation missing --]]
TSM.L["Select All Items"] = "Select All Items"
--[[Translation missing --]]
TSM.L["Select Auction to Cancel"] = "Select Auction to Cancel"
--[[Translation missing --]]
TSM.L["Select crafter"] = "Select crafter"
--[[Translation missing --]]
TSM.L["Select custom price sources to include in item tooltips"] = "Select custom price sources to include in item tooltips"
--[[Translation missing --]]
TSM.L["Select Duration"] = "Select Duration"
--[[Translation missing --]]
TSM.L["Select Items to Add"] = "Select Items to Add"
--[[Translation missing --]]
TSM.L["Select Items to Remove"] = "Select Items to Remove"
--[[Translation missing --]]
TSM.L["Select Operation"] = "Select Operation"
--[[Translation missing --]]
TSM.L["Select professions"] = "Select professions"
--[[Translation missing --]]
TSM.L["Select which accounting information to display in item tooltips."] = "Select which accounting information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which auctioning information to display in item tooltips."] = "Select which auctioning information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which crafting information to display in item tooltips."] = "Select which crafting information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which destroying information to display in item tooltips."] = "Select which destroying information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which shopping information to display in item tooltips."] = "Select which shopping information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Selected Groups"] = "Selected Groups"
--[[Translation missing --]]
TSM.L["SELECTED ITEM"] = "SELECTED ITEM"
--[[Translation missing --]]
TSM.L["Selected Operations"] = "Selected Operations"
--[[Translation missing --]]
TSM.L["Sell"] = "Sell"
--[[Translation missing --]]
TSM.L["SELL ALL"] = "SELL ALL"
--[[Translation missing --]]
TSM.L["SELL BOES"] = "SELL BOES"
--[[Translation missing --]]
TSM.L["SELL GROUPS"] = "SELL GROUPS"
--[[Translation missing --]]
TSM.L["Sell Options"] = "Sell Options"
--[[Translation missing --]]
TSM.L["Sell soulbound items?"] = "Sell soulbound items?"
TSM.L["Sell to Vendor"] = "Vender al vendedor"
--[[Translation missing --]]
TSM.L["SELL TRASH"] = "SELL TRASH"
--[[Translation missing --]]
TSM.L["Seller"] = "Seller"
--[[Translation missing --]]
TSM.L["Selling soulbound items."] = "Selling soulbound items."
--[[Translation missing --]]
TSM.L["Send"] = "Send"
--[[Translation missing --]]
TSM.L["SEND DISENCHANTABLES"] = "SEND DISENCHANTABLES"
--[[Translation missing --]]
TSM.L["Send Excess Gold to Banker"] = "Send Excess Gold to Banker"
--[[Translation missing --]]
TSM.L["SEND GOLD"] = "SEND GOLD"
--[[Translation missing --]]
TSM.L["Send grouped items individually"] = "Send grouped items individually"
--[[Translation missing --]]
TSM.L["SEND MAIL"] = "SEND MAIL"
--[[Translation missing --]]
TSM.L["Send Money"] = "Send Money"
--[[Translation missing --]]
TSM.L["SENDING"] = "SENDING"
--[[Translation missing --]]
TSM.L["Sending %s individually to %s"] = "Sending %s individually to %s"
--[[Translation missing --]]
TSM.L["Sending %s to %s"] = "Sending %s to %s"
--[[Translation missing --]]
TSM.L["Sending %s to %s with a COD of %s"] = "Sending %s to %s with a COD of %s"
--[[Translation missing --]]
TSM.L["Sending Settings"] = "Sending Settings"
--[[Translation missing --]]
TSM.L["SENDING..."] = "SENDING..."
--[[Translation missing --]]
TSM.L["Set auction duration to:"] = "Set auction duration to:"
--[[Translation missing --]]
TSM.L["Set bid as percentage of buyout:"] = "Set bid as percentage of buyout:"
--[[Translation missing --]]
TSM.L["Set keep in bags quantity?"] = "Set keep in bags quantity?"
--[[Translation missing --]]
TSM.L["Set keep in bank quantity?"] = "Set keep in bank quantity?"
--[[Translation missing --]]
TSM.L["Set Maximum Price:"] = "Set Maximum Price:"
--[[Translation missing --]]
TSM.L["Set maximum quantity?"] = "Set maximum quantity?"
--[[Translation missing --]]
TSM.L["Set Minimum Price:"] = "Set Minimum Price:"
--[[Translation missing --]]
TSM.L["Set minimum profit?"] = "Set minimum profit?"
--[[Translation missing --]]
TSM.L["Set move quantity?"] = "Set move quantity?"
--[[Translation missing --]]
TSM.L["Set Normal Price:"] = "Set Normal Price:"
--[[Translation missing --]]
TSM.L["Set post cap to:"] = "Set post cap to:"
--[[Translation missing --]]
TSM.L["Set posted stack size to:"] = "Set posted stack size to:"
--[[Translation missing --]]
TSM.L["Set stack size for bags?"] = "Set stack size for bags?"
--[[Translation missing --]]
TSM.L["Setup"] = "Setup"
--[[Translation missing --]]
TSM.L["SETUP ACCOUNT SYNC"] = "SETUP ACCOUNT SYNC"
TSM.L["Shards"] = "Fragmentos"
--[[Translation missing --]]
TSM.L["Shopping"] = "Shopping"
--[[Translation missing --]]
TSM.L["Shopping 'BUYOUT' Button"] = "Shopping 'BUYOUT' Button"
--[[Translation missing --]]
TSM.L["Shopping for auctions including those above the max price."] = "Shopping for auctions including those above the max price."
--[[Translation missing --]]
TSM.L["Shopping for auctions with a max price set."] = "Shopping for auctions with a max price set."
--[[Translation missing --]]
TSM.L["Shopping for even stacks including those above the max price"] = "Shopping for even stacks including those above the max price"
--[[Translation missing --]]
TSM.L["Shopping for even stacks with a max price set."] = "Shopping for even stacks with a max price set."
--[[Translation missing --]]
TSM.L["Shopping Tooltips"] = "Shopping Tooltips"
--[[Translation missing --]]
TSM.L["SHORTFALL TO BAGS"] = "SHORTFALL TO BAGS"
--[[Translation missing --]]
TSM.L["Show auctions above max price?"] = "Show auctions above max price?"
--[[Translation missing --]]
TSM.L["Show Description"] = "Show Description"
--[[Translation missing --]]
TSM.L["Show Destroying frame automatically"] = "Show Destroying frame automatically"
--[[Translation missing --]]
TSM.L["Show material cost"] = "Show material cost"
--[[Translation missing --]]
TSM.L["Show on Modifier"] = "Show on Modifier"
--[[Translation missing --]]
TSM.L["Showing %d Mail"] = "Showing %d Mail"
--[[Translation missing --]]
TSM.L["Showing %d of %d Mail"] = "Showing %d of %d Mail"
--[[Translation missing --]]
TSM.L["Showing %d of %d Mails"] = "Showing %d of %d Mails"
--[[Translation missing --]]
TSM.L["Showing all %d Mails"] = "Showing all %d Mails"
TSM.L["Simple"] = "Sencillo"
--[[Translation missing --]]
TSM.L["SKIP"] = "SKIP"
--[[Translation missing --]]
TSM.L["Skip Import / Export confirmations?"] = "Skip Import / Export confirmations?"
--[[Translation missing --]]
TSM.L["Skipped: No assigned operation"] = "Skipped: No assigned operation"
TSM.L["Slash Commands:"] = "Comandos de Diagonal:"
--[[Translation missing --]]
TSM.L["Sniper 'BUYOUT' Button"] = "Sniper 'BUYOUT' Button"
--[[Translation missing --]]
TSM.L["Sniper Options"] = "Sniper Options"
--[[Translation missing --]]
TSM.L["Sniper Settings"] = "Sniper Settings"
--[[Translation missing --]]
TSM.L["Sniping items below a max price"] = "Sniping items below a max price"
--[[Translation missing --]]
TSM.L["Sold"] = "Sold"
--[[Translation missing --]]
TSM.L["Sold %s worth of items."] = "Sold %s worth of items."
--[[Translation missing --]]
TSM.L["Sold (Min/Avg/Max Price)"] = "Sold (Min/Avg/Max Price)"
--[[Translation missing --]]
TSM.L["Sold (Total Price)"] = "Sold (Total Price)"
--[[Translation missing --]]
TSM.L["Sold [%s]x%d for %s to %s"] = "Sold [%s]x%d for %s to %s"
--[[Translation missing --]]
TSM.L["Sold Auctions %s:"] = "Sold Auctions %s:"
--[[Translation missing --]]
TSM.L["Source"] = "Source"
--[[Translation missing --]]
TSM.L["SOURCE %d"] = "SOURCE %d"
--[[Translation missing --]]
TSM.L["SOURCES"] = "SOURCES"
TSM.L["Sources"] = "Fuentes"
--[[Translation missing --]]
TSM.L["Sources to include for restock:"] = "Sources to include for restock:"
--[[Translation missing --]]
TSM.L["Stack"] = "Stack"
--[[Translation missing --]]
TSM.L["Stack / Quantity"] = "Stack / Quantity"
--[[Translation missing --]]
TSM.L["Stack size multiple:"] = "Stack size multiple:"
--[[Translation missing --]]
TSM.L["Start either a 'Buyout' or 'Bid' sniper using the buttons above."] = "Start either a 'Buyout' or 'Bid' sniper using the buttons above."
--[[Translation missing --]]
TSM.L["Starting Scan..."] = "Starting Scan..."
--[[Translation missing --]]
TSM.L["STOP"] = "STOP"
--[[Translation missing --]]
TSM.L["Store operations globally"] = "Store operations globally"
--[[Translation missing --]]
TSM.L["Subject"] = "Subject"
--[[Translation missing --]]
TSM.L["SUBJECT"] = "SUBJECT"
--[[Translation missing --]]
TSM.L["Switch to %s"] = "Switch to %s"
--[[Translation missing --]]
TSM.L["Switch to WoW UI"] = "Switch to WoW UI"
TSM.L["Sync Setup Error: The specified player on the other account is not currently online."] = "Error de configuración de sincronización: el jugador especificado en la otra cuenta no está en línea."
TSM.L["Sync Setup Error: This character is already part of a known account."] = "Error de configuración de sincronización: este personaje ya es parte de una cuenta enlazada."
TSM.L["Sync Setup Error: You entered the name of the current character and not the character on the other account."] = "Error de configuración de sincronización: ingresó el nombre del personaje actual y no el personaje de la otra cuenta."
--[[Translation missing --]]
TSM.L["TAKE ALL"] = "TAKE ALL"
--[[Translation missing --]]
TSM.L["Take Attachments"] = "Take Attachments"
--[[Translation missing --]]
TSM.L["Target Character"] = "Target Character"
--[[Translation missing --]]
TSM.L["TARGET SHORTFALL TO BAGS"] = "TARGET SHORTFALL TO BAGS"
--[[Translation missing --]]
TSM.L["Tasks Added to Task List"] = "Tasks Added to Task List"
TSM.L["Text (%s)"] = "Texto (%s)"
--[[Translation missing --]]
TSM.L["The canlearn filter was ignored because the CanIMogIt addon was not found."] = "The canlearn filter was ignored because the CanIMogIt addon was not found."
--[[Translation missing --]]
TSM.L["The 'Craft Value Method' (%s) did not return a value for this item."] = "The 'Craft Value Method' (%s) did not return a value for this item."
TSM.L["The 'disenchant' price source has been replaced by the more general 'destroy' price source. Please update your custom prices."] = "La fuente de precio 'disenchant' ha sido reemplazada por la fuente más general 'destroy'. Por favor actualice sus precios personalizados."
--[[Translation missing --]]
TSM.L["The min profit (%s) did not evalulate to a valid value for this item."] = "The min profit (%s) did not evalulate to a valid value for this item."
TSM.L["The name can ONLY contain letters. No spaces, numbers, or special characters."] = "El nombre SÓLO puede contener letras. Sin espacios, números o caracteres especiales."
--[[Translation missing --]]
TSM.L["The number which would be queued (%d) is less than the min restock quantity (%d)."] = "The number which would be queued (%d) is less than the min restock quantity (%d)."
--[[Translation missing --]]
TSM.L["The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."] = "The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."
--[[Translation missing --]]
TSM.L["The player \"%s\" is already on your whitelist."] = "The player \"%s\" is already on your whitelist."
--[[Translation missing --]]
TSM.L["The profit of this item (%s) is below the min profit (%s)."] = "The profit of this item (%s) is below the min profit (%s)."
--[[Translation missing --]]
TSM.L["The seller name of the lowest auction for %s was not given by the server. Skipping this item."] = "The seller name of the lowest auction for %s was not given by the server. Skipping this item."
--[[Translation missing --]]
TSM.L["The TradeSkillMaster_AppHelper addon is not enabled and is required for proper operation of TSM. TSM has enabled it and requires a reload."] = "The TradeSkillMaster_AppHelper addon is not enabled and is required for proper operation of TSM. TSM has enabled it and requires a reload."
--[[Translation missing --]]
TSM.L["The TradeSkillMaster_AppHelper addon is not installed and is required for proper operation of TSM."] = "The TradeSkillMaster_AppHelper addon is not installed and is required for proper operation of TSM."
--[[Translation missing --]]
TSM.L["The unlearned filter was ignored because the CanIMogIt addon was not found."] = "The unlearned filter was ignored because the CanIMogIt addon was not found."
--[[Translation missing --]]
TSM.L["There is a crafting cost and crafted item value, but TSM_Crafting wasn't able to calculate a profit. This shouldn't happen!"] = "There is a crafting cost and crafted item value, but TSM_Crafting wasn't able to calculate a profit. This shouldn't happen!"
--[[Translation missing --]]
TSM.L["There is no TSM_Crafting operation applied to this item's TSM group (%s)."] = "There is no TSM_Crafting operation applied to this item's TSM group (%s)."
TSM.L["This group already has operations. Would you like to add another one or replace the last one?"] = "Este grupo ya tiene operaciones. ¿Te gustaría agregar otro o reemplazar el último?"
TSM.L["This group already has the max number of operation. Would you like to replace the last one?"] = "Este grupo ya tiene el número máximo de operaciones. ¿Te gustaría reemplazar el último?"
TSM.L["This is not a valid profile name. Profile names must be at least one character long and may not contain '@' characters."] = "Este no es un nombre de perfil válido. Los nombres de perfil deben tener al menos un carácter y no contener caracteres '@'."
--[[Translation missing --]]
TSM.L["This item does not have a crafting cost. Check that all of its mats have mat prices."] = "This item does not have a crafting cost. Check that all of its mats have mat prices."
--[[Translation missing --]]
TSM.L["This item is not in a TSM group."] = "This item is not in a TSM group."
--[[Translation missing --]]
TSM.L["This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general TSM_Crafting options."] = "This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general TSM_Crafting options."
TSM.L["This looks like an exported operation and not a custom price."] = "Esto parece una operación exportada y no un precio personalizado."
--[[Translation missing --]]
TSM.L["This will copy the settings from '%s' into your currently-active one."] = "This will copy the settings from '%s' into your currently-active one."
--[[Translation missing --]]
TSM.L["This will permanently delete the '%s' profile."] = "This will permanently delete the '%s' profile."
--[[Translation missing --]]
TSM.L["This will reset all groups and operations (if not stored globally) to be wiped from this profile."] = "This will reset all groups and operations (if not stored globally) to be wiped from this profile."
--[[Translation missing --]]
TSM.L["Time"] = "Time"
--[[Translation missing --]]
TSM.L["Time Format"] = "Time Format"
--[[Translation missing --]]
TSM.L["Time Frame"] = "Time Frame"
--[[Translation missing --]]
TSM.L["TIME FRAME"] = "TIME FRAME"
--[[Translation missing --]]
TSM.L["TINKER"] = "TINKER"
--[[Translation missing --]]
TSM.L["Tooltip Price Format"] = "Tooltip Price Format"
--[[Translation missing --]]
TSM.L["Tooltip Settings"] = "Tooltip Settings"
--[[Translation missing --]]
TSM.L["Top Buyers:"] = "Top Buyers:"
--[[Translation missing --]]
TSM.L["Top Item:"] = "Top Item:"
--[[Translation missing --]]
TSM.L["Top Sellers:"] = "Top Sellers:"
TSM.L["Total"] = "Total"
--[[Translation missing --]]
TSM.L["Total Gold"] = "Total Gold"
--[[Translation missing --]]
TSM.L["Total Gold Earned:"] = "Total Gold Earned:"
--[[Translation missing --]]
TSM.L["Total Gold Spent:"] = "Total Gold Spent:"
--[[Translation missing --]]
TSM.L["Total Price"] = "Total Price"
--[[Translation missing --]]
TSM.L["Total Profit:"] = "Total Profit:"
TSM.L["Total Value"] = "Valor total"
--[[Translation missing --]]
TSM.L["Total Value of All Items: "] = "Total Value of All Items: "
--[[Translation missing --]]
TSM.L["Track Sales / Purchases via trade"] = "Track Sales / Purchases via trade"
--[[Translation missing --]]
TSM.L["TradeSkillMaster Info"] = "TradeSkillMaster Info"
--[[Translation missing --]]
TSM.L["Transform Value"] = "Transform Value"
--[[Translation missing --]]
TSM.L["TSM Banking"] = "TSM Banking"
--[[Translation missing --]]
TSM.L["TSM can sync data automatically between multiple accounts."] = "TSM can sync data automatically between multiple accounts."
--[[Translation missing --]]
TSM.L["TSM Crafting"] = "TSM Crafting"
--[[Translation missing --]]
TSM.L["TSM Destroying"] = "TSM Destroying"
--[[Translation missing --]]
TSM.L["TSM failed to scan some auctions. Please rerun the scan."] = "TSM failed to scan some auctions. Please rerun the scan."
--[[Translation missing --]]
TSM.L["TSM Groups"] = "TSM Groups"
--[[Translation missing --]]
TSM.L["TSM is missing important information from the TSM Desktop Application. Please ensure the TSM Desktop Application is running and is properly configured."] = "TSM is missing important information from the TSM Desktop Application. Please ensure the TSM Desktop Application is running and is properly configured."
--[[Translation missing --]]
TSM.L["TSM Mailing"] = "TSM Mailing"
--[[Translation missing --]]
TSM.L["TSM TASK LIST"] = "TSM TASK LIST"
--[[Translation missing --]]
TSM.L["TSM Vendoring"] = "TSM Vendoring"
TSM.L["TSM Version Info:"] = "Información de la versión de TSM:"
--[[Translation missing --]]
TSM.L["TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"] = "TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"
--[[Translation missing --]]
TSM.L["TSM4"] = "TSM4"
TSM.L["TUJ 3-Day Price"] = "TUJ Precio de 3 días"
TSM.L["Twitter Integration"] = "Integración de Twitter"
--[[Translation missing --]]
TSM.L["Twitter Integration Not Enabled"] = "Twitter Integration Not Enabled"
--[[Translation missing --]]
TSM.L["Type"] = "Type"
--[[Translation missing --]]
TSM.L["Type Something"] = "Type Something"
TSM.L["Unbalanced parentheses."] = "Paréntesis desequilibrado."
--[[Translation missing --]]
TSM.L["Undercut amount:"] = "Undercut amount:"
--[[Translation missing --]]
TSM.L["Undercut by whitelisted player."] = "Undercut by whitelisted player."
--[[Translation missing --]]
TSM.L["Undercutting blacklisted player."] = "Undercutting blacklisted player."
--[[Translation missing --]]
TSM.L["Undercutting competition."] = "Undercutting competition."
--[[Translation missing --]]
TSM.L["Ungrouped Items"] = "Ungrouped Items"
--[[Translation missing --]]
TSM.L["Unknown Item"] = "Unknown Item"
TSM.L["Unwrap Gift"] = "Desenvolver el regalo"
TSM.L["Up"] = "Arriba"
--[[Translation missing --]]
TSM.L["UPDATE EXISTING MACRO"] = "UPDATE EXISTING MACRO"
TSM.L["Usage: /tsm price <ItemLink> <Price String>"] = "Uso: /tsm price <ItemLink> <Price String>"
--[[Translation missing --]]
TSM.L["Use smart average for purchase price"] = "Use smart average for purchase price"
--[[Translation missing --]]
TSM.L["Use the field below to search the auction house by filter"] = "Use the field below to search the auction house by filter"
--[[Translation missing --]]
TSM.L["Use the list to the left to select groups, & operations you'd like to create export strings for."] = "Use the list to the left to select groups, & operations you'd like to create export strings for."
--[[Translation missing --]]
TSM.L["VALUE PRICE SOURCE"] = "VALUE PRICE SOURCE"
--[[Translation missing --]]
TSM.L["ValueSources"] = "ValueSources"
--[[Translation missing --]]
TSM.L["Variable Name"] = "Variable Name"
--[[Translation missing --]]
TSM.L["Vendor"] = "Vendor"
--[[Translation missing --]]
TSM.L["Vendor Buy Price"] = "Vendor Buy Price"
--[[Translation missing --]]
TSM.L["Vendor Search"] = "Vendor Search"
--[[Translation missing --]]
TSM.L["VENDOR SEARCH"] = "VENDOR SEARCH"
--[[Translation missing --]]
TSM.L["Vendor Sell"] = "Vendor Sell"
--[[Translation missing --]]
TSM.L["Vendor Sell Price"] = "Vendor Sell Price"
--[[Translation missing --]]
TSM.L["Vendoring 'SELL ALL' Button"] = "Vendoring 'SELL ALL' Button"
--[[Translation missing --]]
TSM.L["View ignored items in the Destroying options."] = "View ignored items in the Destroying options."
--[[Translation missing --]]
TSM.L["Warehousing"] = "Warehousing"
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group."] = "Warehousing will move a max of %d of each item in this group."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group."] = "Warehousing will move all of the items in this group."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."
TSM.L["WARNING: The macro was too long, so was truncated to fit by WoW."] = "ADVERTENCIA: La macro era demasiado larga, por lo que WoW lo recorto para que cupiera."
--[[Translation missing --]]
TSM.L["WARNING: You minimum price for %s is below its vendorsell price (with AH cut taken into account). Consider raising your minimum price, or vendoring the item."] = "WARNING: You minimum price for %s is below its vendorsell price (with AH cut taken into account). Consider raising your minimum price, or vendoring the item."
--[[Translation missing --]]
TSM.L["When above maximum:"] = "When above maximum:"
--[[Translation missing --]]
TSM.L["When below minimum:"] = "When below minimum:"
--[[Translation missing --]]
TSM.L["Whitelist"] = "Whitelist"
--[[Translation missing --]]
TSM.L["Whitelisted Players"] = "Whitelisted Players"
--[[Translation missing --]]
TSM.L["You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"] = "You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"
--[[Translation missing --]]
TSM.L["You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."] = "You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."
TSM.L["You cannot use %s as part of this custom price."] = "No puede usar %s  como parte de este precio personalizado."
TSM.L["You cannot use %s within convert() as part of this custom price."] = "No puede usar %s  dentro de convert() como parte de este precio personalizado."
--[[Translation missing --]]
TSM.L["You do not need to add \"%s\", alts are whitelisted automatically."] = "You do not need to add \"%s\", alts are whitelisted automatically."
--[[Translation missing --]]
TSM.L["You don't know how to craft this item."] = "You don't know how to craft this item."
TSM.L["You must reload your UI for these settings to take effect. Reload now?"] = "Debe volver a cargar su Interfaz para que esta configuración surta efecto. Recargar ahora?"
TSM.L["You won an auction for %sx%d for %s"] = "Ganaste una subasta por %sx%d por %s"
--[[Translation missing --]]
TSM.L["Your auction has not been undercut."] = "Your auction has not been undercut."
--[[Translation missing --]]
TSM.L["Your auction of %s expired"] = "Your auction of %s expired"
TSM.L["Your auction of %s has sold for %s!"] = "¡Tu subasta de %s se ha vendido por %s!"
--[[Translation missing --]]
TSM.L["Your Buyout"] = "Your Buyout"
--[[Translation missing --]]
TSM.L["Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"] = "Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"
--[[Translation missing --]]
TSM.L["Your default craft value method was invalid so it has been returned to the default. Details: %s"] = "Your default craft value method was invalid so it has been returned to the default. Details: %s"
--[[Translation missing --]]
TSM.L["Your task list is currently empty."] = "Your task list is currently empty."
--[[Translation missing --]]
TSM.L["You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."] = "You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."
--[[Translation missing --]]
TSM.L["You've been undercut."] = "You've been undercut."
--[[Translation missing --]]
TSM.L["YY/MM/DD HH:MM"] = "YY/MM/DD HH:MM"
	elseif locale == "frFR" then
TSM.L = TSM.L or {}
--[[Translation missing --]]
TSM.L["%d |4Group:Groups; Selected (%d |4Item:Items;)"] = "%d |4Group:Groups; Selected (%d |4Item:Items;)"
--[[Translation missing --]]
TSM.L["%d auctions"] = "%d auctions"
--[[Translation missing --]]
TSM.L["%d Groups"] = "%d Groups"
--[[Translation missing --]]
TSM.L["%d Items"] = "%d Items"
--[[Translation missing --]]
TSM.L["%d of %d"] = "%d of %d"
--[[Translation missing --]]
TSM.L["%d Operations"] = "%d Operations"
--[[Translation missing --]]
TSM.L["%d Posted Auctions"] = "%d Posted Auctions"
--[[Translation missing --]]
TSM.L["%d Sold Auctions"] = "%d Sold Auctions"
TSM.L["%s (%s bags, %s bank, %s AH, %s mail)"] = "%s (%s sacs, %s banque, %s HV, %s courrier)"
TSM.L["%s (%s player, %s alts, %s guild, %s AH)"] = "%s (%s joueur, %s alts, %s guilde, %s AH)"
--[[Translation missing --]]
TSM.L["%s (%s profit)"] = "%s (%s profit)"
--[[Translation missing --]]
TSM.L["%s ago"] = "%s ago"
--[[Translation missing --]]
TSM.L["%s Crafts"] = "%s Crafts"
TSM.L["%s in guild vault"] = "%s dans la banque de guilde"
TSM.L["%s is a valid custom price but %s is an invalid item."] = "%s est un prix personnalisé valide mais %s est un objet invalide."
TSM.L["%s is a valid custom price but did not give a value for %s."] = "%s est un prix personnalisé valide mais ne donne aucune valeur pour %s."
--[[Translation missing --]]
TSM.L["'%s' is an invalid operation! Min restock of %d is higher than max restock of %d."] = "'%s' is an invalid operation! Min restock of %d is higher than max restock of %d."
TSM.L["%s is not a valid custom price and gave the following error: %s"] = "%s est un prix personnalisé invalide car il affiche cette erreur : %s"
--[[Translation missing --]]
TSM.L["%s operation(s)"] = "%s operation(s)"
TSM.L["%s removed."] = "%s supprimé."
--[[Translation missing --]]
TSM.L["%s sent you %s"] = "%s sent you %s"
--[[Translation missing --]]
TSM.L["%s sent you %s and %s"] = "%s sent you %s and %s"
--[[Translation missing --]]
TSM.L["%s sent you a COD of %s for %s"] = "%s sent you a COD of %s for %s"
--[[Translation missing --]]
TSM.L["%s sent you a message: %s"] = "%s sent you a message: %s"
TSM.L["%s total"] = "%s au total"
TSM.L["%sDrag%s to move this button"] = "%sFaites glisser%s pour déplacer ce bouton"
TSM.L["%sLeft-Click%s to open the main window"] = "%sClic gauche%s pour ouvrir la fenêtre principale"
--[[Translation missing --]]
TSM.L["(%d/500 Characters)"] = "(%d/500 Characters)"
--[[Translation missing --]]
TSM.L["(max %d)"] = "(max %d)"
--[[Translation missing --]]
TSM.L["(max 200)"] = "(max 200)"
--[[Translation missing --]]
TSM.L["(max 5000)"] = "(max 5000)"
--[[Translation missing --]]
TSM.L["(min %d - max %d)"] = "(min %d - max %d)"
--[[Translation missing --]]
TSM.L["(min 0 - max 10000)"] = "(min 0 - max 10000)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 2)"] = "(minimum 0 - maximum 2)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 20)"] = "(minimum 0 - maximum 20)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 2000)"] = "(minimum 0 - maximum 2000)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 30)"] = "(minimum 0 - maximum 30)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 905)"] = "(minimum 0 - maximum 905)"
--[[Translation missing --]]
TSM.L["(minimum 0% - maximum 50%)"] = "(minimum 0% - maximum 50%)"
--[[Translation missing --]]
TSM.L["(minimum 0.5 - maximum 10)"] = "(minimum 0.5 - maximum 10)"
--[[Translation missing --]]
TSM.L["(minimum 1 - maximum 100)"] = "(minimum 1 - maximum 100)"
--[[Translation missing --]]
TSM.L["(minimum 8 - maximum 25)"] = "(minimum 8 - maximum 25)"
--[[Translation missing --]]
TSM.L["(New group(s) will be created)"] = "(New group(s) will be created)"
TSM.L["/tsm help|r - Shows this help listing"] = "/tsm help|r - Afficher cette liste d'aide"
TSM.L["/tsm|r - opens the main TSM window."] = "/tsm|r - Ouvrir la fenêtre principale de TSM."
--[[Translation missing --]]
TSM.L["_ Hr _ Min ago"] = "_ Hr _ Min ago"
--[[Translation missing --]]
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."] = "|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."
--[[Translation missing --]]
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."] = "|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."
--[[Translation missing --]]
TSM.L["|cffff0000WARNING:|r TSM_AuctionDB doesn't currently have any pricing data for your realm. Either download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update TSM_AuctionDB's data, or run a manual scan in-game."] = "|cffff0000WARNING:|r TSM_AuctionDB doesn't currently have any pricing data for your realm. Either download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update TSM_AuctionDB's data, or run a manual scan in-game."
--[[Translation missing --]]
TSM.L["|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."] = "|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."
--[[Translation missing --]]
TSM.L["|cffffd839Left-Click|r to ignore an item this session."] = "|cffffd839Left-Click|r to ignore an item this session."
--[[Translation missing --]]
TSM.L["|cffffd839Shift-Left-Click|r to ignore it permanently."] = "|cffffd839Shift-Left-Click|r to ignore it permanently."
TSM.L["1 Group"] = "1 Groupe"
TSM.L["1 Item"] = "1 Objet"
--[[Translation missing --]]
TSM.L["12 hr"] = "12 hr"
--[[Translation missing --]]
TSM.L["24 hr"] = "24 hr"
--[[Translation missing --]]
TSM.L["48 hr"] = "48 hr"
TSM.L["A custom price of %s for %s evaluates to %s."] = "Un prix personnalisé de %s pour %s évalué à %s."
TSM.L["A maximum of 1 convert() function is allowed."] = "Un maximum d'une fonction convert() est autorisé."
TSM.L["A scan is already in progress. Please stop that scan before starting another one."] = "Un scan est en cours actuellement. Arrêtez le scan avant d'en démarrer un nouveau."
--[[Translation missing --]]
TSM.L["Above max expires."] = "Above max expires."
--[[Translation missing --]]
TSM.L["Above max price. Not posting."] = "Above max price. Not posting."
--[[Translation missing --]]
TSM.L["Above max price. Posting at max price."] = "Above max price. Posting at max price."
--[[Translation missing --]]
TSM.L["Above max price. Posting at min price."] = "Above max price. Posting at min price."
--[[Translation missing --]]
TSM.L["Above max price. Posting at normal price."] = "Above max price. Posting at normal price."
--[[Translation missing --]]
TSM.L["Accepting these item(s) will cost"] = "Accepting these item(s) will cost"
--[[Translation missing --]]
TSM.L["Accepting this item will cost"] = "Accepting this item will cost"
--[[Translation missing --]]
TSM.L["Account sync removed. Please delete the account sync from the other account as well."] = "Account sync removed. Please delete the account sync from the other account as well."
TSM.L["Account Syncing"] = "Synchronisation de compte"
--[[Translation missing --]]
TSM.L["Accounting"] = "Accounting"
--[[Translation missing --]]
TSM.L["Accounting Tooltips"] = "Accounting Tooltips"
--[[Translation missing --]]
TSM.L["Activity Type"] = "Activity Type"
--[[Translation missing --]]
TSM.L["ADD %d ITEMS"] = "ADD %d ITEMS"
--[[Translation missing --]]
TSM.L["Add / Remove Items"] = "Add / Remove Items"
--[[Translation missing --]]
TSM.L["ADD NEW CUSTOM PRICE SOURCE"] = "ADD NEW CUSTOM PRICE SOURCE"
TSM.L["ADD OPERATION"] = "AJOUTER L'OPÉRATION"
--[[Translation missing --]]
TSM.L["Add Player"] = "Add Player"
--[[Translation missing --]]
TSM.L["Add Subject / Description"] = "Add Subject / Description"
--[[Translation missing --]]
TSM.L["Add Subject / Description (Optional)"] = "Add Subject / Description (Optional)"
--[[Translation missing --]]
TSM.L["ADD TO MAIL"] = "ADD TO MAIL"
TSM.L["Additional error suppressed"] = "Erreur(s) additionelle(s) supprimée(s)"
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be auctioned."] = "Adjust the settings below to set how groups attached to this operation will be auctioned."
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be cancelled."] = "Adjust the settings below to set how groups attached to this operation will be cancelled."
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be priced."] = "Adjust the settings below to set how groups attached to this operation will be priced."
TSM.L["Advanced Item Search"] = "Recherche avancée d'objet"
TSM.L["Advanced Options"] = "Options avancées"
TSM.L["AH"] = "HV "
--[[Translation missing --]]
TSM.L["AH (Crafting)"] = "AH (Crafting)"
--[[Translation missing --]]
TSM.L["AH (Disenchanting)"] = "AH (Disenchanting)"
--[[Translation missing --]]
TSM.L["AH BUSY"] = "AH BUSY"
--[[Translation missing --]]
TSM.L["AH Frame Options"] = "AH Frame Options"
--[[Translation missing --]]
TSM.L["AH Rows Shown (requires reload)"] = "AH Rows Shown (requires reload)"
TSM.L["Alarm Clock"] = "Alarme"
TSM.L["All Auctions"] = "Toutes les enchères"
TSM.L["All Characters and Guilds"] = "Tous les personnages et Guildes"
TSM.L["All Professions"] = "Tous les métiers"
TSM.L["Allow partial stack?"] = "Autoriser les piles partielles ?"
--[[Translation missing --]]
TSM.L["Alt Guild Bank"] = "Alt Guild Bank"
--[[Translation missing --]]
TSM.L["Alts"] = "Alts"
--[[Translation missing --]]
TSM.L["Alts AH"] = "Alts AH"
TSM.L["Amount"] = "Montant"
TSM.L["AMOUNT"] = "MONTANT"
--[[Translation missing --]]
TSM.L["Amount of Bag Space to Keep Free"] = "Amount of Bag Space to Keep Free"
TSM.L["Applied %s to %s."] = "%s appliqué à %s."
TSM.L["APPLY FILTERS"] = "APPLIQUER LES FILTRES"
--[[Translation missing --]]
TSM.L["Apply operation to group:"] = "Apply operation to group:"
--[[Translation missing --]]
TSM.L["Are you sure you want to clear old accounting data?"] = "Are you sure you want to clear old accounting data?"
TSM.L["Are you sure you want to delete this group?"] = "Êtes-vous sûr de vouloir supprimer ce groupe ? "
TSM.L["Are you sure you want to delete this operation?"] = "Êtes-vous sûr de vouloir supprimer cette opération ? "
--[[Translation missing --]]
TSM.L["Are you sure you want to reset all operation settings?"] = "Are you sure you want to reset all operation settings?"
--[[Translation missing --]]
TSM.L["At above max price and not undercut."] = "At above max price and not undercut."
--[[Translation missing --]]
TSM.L["At normal price and not undercut."] = "At normal price and not undercut."
--[[Translation missing --]]
TSM.L["Auction"] = "Auction"
--[[Translation missing --]]
TSM.L["AUCTION DETAILS"] = "AUCTION DETAILS"
--[[Translation missing --]]
TSM.L["Auction Duration"] = "Auction Duration"
--[[Translation missing --]]
TSM.L["Auction has been bid on."] = "Auction has been bid on."
TSM.L["Auction Window Close"] = "Fermer la fenêtre d’enchère"
TSM.L["Auction Window Open"] = "Ouvrir la fenêtre d’enchère"
TSM.L["Auctionator - Auction Value"] = "Auctionator - Valeur de l'enchère"
TSM.L["Auctioneer - Appraiser"] = "Auctioneer - Expertise"
TSM.L["Auctioneer - Market Value"] = "Auctioneer - Valeur du marché"
TSM.L["Auctioneer - Minimum Buyout"] = "Auctioneer - Achat minimum"
TSM.L["Auctioning"] = "Mise aux Enchères"
TSM.L["Auctioning Log"] = "Historique des mises aux enchères"
TSM.L["Auctioning Operation"] = "Opération de vente aux enchères"
--[[Translation missing --]]
TSM.L["Auctioning 'POST'/'CANCEL' Button"] = "Auctioning 'POST'/'CANCEL' Button"
TSM.L["Auctions"] = "Enchères"
TSM.L["Auto Quest Complete"] = "Rendre les quêtes automatiquement"
--[[Translation missing --]]
TSM.L["Automatically sell vendor trash?"] = "Automatically sell vendor trash?"
--[[Translation missing --]]
TSM.L["Average Earned Per Day:"] = "Average Earned Per Day:"
--[[Translation missing --]]
TSM.L["Average Prices:"] = "Average Prices:"
--[[Translation missing --]]
TSM.L["Average Profit Per Day:"] = "Average Profit Per Day:"
--[[Translation missing --]]
TSM.L["Average Spent Per Day:"] = "Average Spent Per Day:"
--[[Translation missing --]]
TSM.L["Avg Buy Price"] = "Avg Buy Price"
--[[Translation missing --]]
TSM.L["Avg Resale Profit"] = "Avg Resale Profit"
--[[Translation missing --]]
TSM.L["Avg Sell Price"] = "Avg Sell Price"
--[[Translation missing --]]
TSM.L["BACK TO LIST"] = "BACK TO LIST"
--[[Translation missing --]]
TSM.L["Back to List"] = "Back to List"
TSM.L["Bag"] = "Sac"
TSM.L["Bags"] = "Sacs"
TSM.L["Banks"] = "Banques"
TSM.L["BankUI Move Delay"] = "Temps de transfert de BankUI"
TSM.L["Base Group"] = "Groupe par défaut"
--[[Translation missing --]]
TSM.L["Base Item"] = "Base Item"
--[[Translation missing --]]
TSM.L["Batch size"] = "Batch size"
TSM.L["Below are your currently available price sources organized by module. The %skey|r is what you would type into a custom price box."] = "Ci-dessous sont organisées les source de prix disponibles par module. La %skey|r serait ce que vous taperiez dans un champ de prix personnalisé."
--[[Translation missing --]]
TSM.L["Below custom price:"] = "Below custom price:"
--[[Translation missing --]]
TSM.L["Below min price. Posting at max price."] = "Below min price. Posting at max price."
--[[Translation missing --]]
TSM.L["Below min price. Posting at min price."] = "Below min price. Posting at min price."
--[[Translation missing --]]
TSM.L["Below min price. Posting at normal price."] = "Below min price. Posting at normal price."
--[[Translation missing --]]
TSM.L["Below, you can manage your profiles which allow you to have entirely different sets of groups."] = "Below, you can manage your profiles which allow you to have entirely different sets of groups."
--[[Translation missing --]]
TSM.L["Bid %d / %d"] = "Bid %d / %d"
--[[Translation missing --]]
TSM.L["Bid (item)"] = "Bid (item)"
--[[Translation missing --]]
TSM.L["Bid (stack)"] = "Bid (stack)"
--[[Translation missing --]]
TSM.L["Bid Price"] = "Bid Price"
--[[Translation missing --]]
TSM.L["Bid Sniper Paused"] = "Bid Sniper Paused"
--[[Translation missing --]]
TSM.L["Bid Sniper Running"] = "Bid Sniper Running"
--[[Translation missing --]]
TSM.L["Blacklisted players:"] = "Blacklisted players:"
--[[Translation missing --]]
TSM.L["Bought"] = "Bought"
--[[Translation missing --]]
TSM.L["Bought %sx%d for %s from %s"] = "Bought %sx%d for %s from %s"
--[[Translation missing --]]
TSM.L["Bound Actions"] = "Bound Actions"
--[[Translation missing --]]
TSM.L["BUSY"] = "BUSY"
--[[Translation missing --]]
TSM.L["BUY"] = "BUY"
--[[Translation missing --]]
TSM.L["Buy"] = "Buy"
--[[Translation missing --]]
TSM.L["Buy %d / %d"] = "Buy %d / %d"
--[[Translation missing --]]
TSM.L["Buy %d / %d (Confirming %d / %d)"] = "Buy %d / %d (Confirming %d / %d)"
--[[Translation missing --]]
TSM.L["Buy from AH"] = "Buy from AH"
TSM.L["Buy from Vendor"] = "Acheter au marchand"
--[[Translation missing --]]
TSM.L["BUY GROUPS"] = "BUY GROUPS"
--[[Translation missing --]]
TSM.L["Buy Options"] = "Buy Options"
--[[Translation missing --]]
TSM.L["BUYBACK ALL"] = "BUYBACK ALL"
--[[Translation missing --]]
TSM.L["Buyer/Seller"] = "Buyer/Seller"
--[[Translation missing --]]
TSM.L["Buyout (item)"] = "Buyout (item)"
--[[Translation missing --]]
TSM.L["Buyout (stack)"] = "Buyout (stack)"
--[[Translation missing --]]
TSM.L["Buyout Price"] = "Buyout Price"
--[[Translation missing --]]
TSM.L["Buyout Sniper Paused"] = "Buyout Sniper Paused"
--[[Translation missing --]]
TSM.L["Buyout Sniper Running"] = "Buyout Sniper Running"
--[[Translation missing --]]
TSM.L["BUYS"] = "BUYS"
--[[Translation missing --]]
TSM.L["By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."] = "By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."
--[[Translation missing --]]
TSM.L["Can Craft At Least One, Profit, Craftable Quantity"] = "Can Craft At Least One, Profit, Craftable Quantity"
--[[Translation missing --]]
TSM.L["Cancel auctions with bids"] = "Cancel auctions with bids"
TSM.L["Cancel Scan"] = "Annuler le scan"
--[[Translation missing --]]
TSM.L["Cancel to repost higher?"] = "Cancel to repost higher?"
--[[Translation missing --]]
TSM.L["Cancel undercut auctions?"] = "Cancel undercut auctions?"
--[[Translation missing --]]
TSM.L["Canceling"] = "Canceling"
--[[Translation missing --]]
TSM.L["Canceling %d / %d"] = "Canceling %d / %d"
--[[Translation missing --]]
TSM.L["Canceling %d Auctions..."] = "Canceling %d Auctions..."
--[[Translation missing --]]
TSM.L["Canceling all auctions."] = "Canceling all auctions."
--[[Translation missing --]]
TSM.L["Canceling auction which you've undercut."] = "Canceling auction which you've undercut."
--[[Translation missing --]]
TSM.L["Canceling disabled."] = "Canceling disabled."
--[[Translation missing --]]
TSM.L["Canceling Settings"] = "Canceling Settings"
--[[Translation missing --]]
TSM.L["Canceling to repost at higher price."] = "Canceling to repost at higher price."
--[[Translation missing --]]
TSM.L["Canceling to repost at reset price."] = "Canceling to repost at reset price."
--[[Translation missing --]]
TSM.L["Canceling to repost higher."] = "Canceling to repost higher."
--[[Translation missing --]]
TSM.L["Canceling undercut auctions and to repost higher."] = "Canceling undercut auctions and to repost higher."
--[[Translation missing --]]
TSM.L["Canceling undercut auctions."] = "Canceling undercut auctions."
--[[Translation missing --]]
TSM.L["Cancelled"] = "Cancelled"
--[[Translation missing --]]
TSM.L["Cancelled auction of %sx%d"] = "Cancelled auction of %sx%d"
--[[Translation missing --]]
TSM.L["Cancelled Since Last Sale"] = "Cancelled Since Last Sale"
--[[Translation missing --]]
TSM.L["CANCELS"] = "CANCELS"
--[[Translation missing --]]
TSM.L["Cannot repair from the guild bank!"] = "Cannot repair from the guild bank!"
TSM.L["Can't load TSM tooltip while in combat"] = "Ne pas charger l'infobulle TSM pendant le combat"
TSM.L["Cash Register"] = "Caisse"
--[[Translation missing --]]
TSM.L["Character"] = "Character"
--[[Translation missing --]]
TSM.L["CHARACTER"] = "CHARACTER"
--[[Translation missing --]]
TSM.L["Character Bags"] = "Character Bags"
--[[Translation missing --]]
TSM.L["Character Bank"] = "Character Bank"
--[[Translation missing --]]
TSM.L["CHARACTERS"] = "CHARACTERS"
TSM.L["Chat Tab"] = "Onglet Chat"
--[[Translation missing --]]
TSM.L["Cheapest auction below min price."] = "Cheapest auction below min price."
--[[Translation missing --]]
TSM.L["Clean Automatically"] = "Clean Automatically"
TSM.L["Clear"] = "Effacer"
--[[Translation missing --]]
TSM.L["Clear All"] = "Clear All"
--[[Translation missing --]]
TSM.L["CLEAR DATA"] = "CLEAR DATA"
--[[Translation missing --]]
TSM.L["Clear Filters"] = "Clear Filters"
--[[Translation missing --]]
TSM.L["Clear Log After 'X' Amount of Days"] = "Clear Log After 'X' Amount of Days"
--[[Translation missing --]]
TSM.L["Clear Old Data"] = "Clear Old Data"
--[[Translation missing --]]
TSM.L["Clear Old Data Confirmation"] = "Clear Old Data Confirmation"
--[[Translation missing --]]
TSM.L["Clear Queue"] = "Clear Queue"
TSM.L["Clear Selection"] = "Effacer la sélection"
--[[Translation missing --]]
TSM.L["COD"] = "COD"
TSM.L["Coins (%s)"] = "Pièces (%s)"
--[[Translation missing --]]
TSM.L["Combine Partial Stacks"] = "Combine Partial Stacks"
--[[Translation missing --]]
TSM.L["Combining..."] = "Combining..."
--[[Translation missing --]]
TSM.L["Configuration Scroll Wheel"] = "Configuration Scroll Wheel"
--[[Translation missing --]]
TSM.L["Confirm"] = "Confirm"
--[[Translation missing --]]
TSM.L["Confirm Complete Sound"] = "Confirm Complete Sound"
--[[Translation missing --]]
TSM.L["Confirming %d / %d"] = "Confirming %d / %d"
TSM.L["Connected to %s"] = "Connecté à %s"
--[[Translation missing --]]
TSM.L["Connecting to %s"] = "Connecting to %s"
--[[Translation missing --]]
TSM.L["CONTACTS"] = "CONTACTS"
--[[Translation missing --]]
TSM.L["Contacts Menu"] = "Contacts Menu"
--[[Translation missing --]]
TSM.L["Cooldown"] = "Cooldown"
--[[Translation missing --]]
TSM.L["Cooldowns"] = "Cooldowns"
--[[Translation missing --]]
TSM.L["Cost"] = "Cost"
--[[Translation missing --]]
TSM.L["Could not apply %s operation %s to %s - it has too many operations already."] = "Could not apply %s operation %s to %s - it has too many operations already."
--[[Translation missing --]]
TSM.L["Could not apply %s operation to group %s because the group does not exist"] = "Could not apply %s operation to group %s because the group does not exist"
--[[Translation missing --]]
TSM.L["Could not create macro as you already have too many. Delete one of your existing macros and try again."] = "Could not create macro as you already have too many. Delete one of your existing macros and try again."
--[[Translation missing --]]
TSM.L["Could not deserialize input"] = "Could not deserialize input"
--[[Translation missing --]]
TSM.L["Could not find enchanted item from"] = "Could not find enchanted item from"
--[[Translation missing --]]
TSM.L["Could not find pet"] = "Could not find pet"
TSM.L["Could not find profile '%s'. Possible profiles: '%s'"] = "Profil '%s' introuvable. Profils possibles: '%s'"
--[[Translation missing --]]
TSM.L["Could not sell items due to not having free bag space available to split a stack of items."] = "Could not sell items due to not having free bag space available to split a stack of items."
--[[Translation missing --]]
TSM.L["Craft"] = "Craft"
--[[Translation missing --]]
TSM.L["CRAFT"] = "CRAFT"
--[[Translation missing --]]
TSM.L["Craft (Unprofitable)"] = "Craft (Unprofitable)"
--[[Translation missing --]]
TSM.L["Craft (When Profitable)"] = "Craft (When Profitable)"
--[[Translation missing --]]
TSM.L["Craft All"] = "Craft All"
--[[Translation missing --]]
TSM.L["CRAFT ALL"] = "CRAFT ALL"
--[[Translation missing --]]
TSM.L["Craft Name"] = "Craft Name"
--[[Translation missing --]]
TSM.L["CRAFT NEXT"] = "CRAFT NEXT"
--[[Translation missing --]]
TSM.L["Craft value method:"] = "Craft value method:"
--[[Translation missing --]]
TSM.L["Craftable Quantity, Profit"] = "Craftable Quantity, Profit"
--[[Translation missing --]]
TSM.L["CRAFTER"] = "CRAFTER"
--[[Translation missing --]]
TSM.L["CRAFTING"] = "CRAFTING"
--[[Translation missing --]]
TSM.L["Crafting"] = "Crafting"
--[[Translation missing --]]
TSM.L["Crafting Cost"] = "Crafting Cost"
--[[Translation missing --]]
TSM.L["Crafting 'CRAFT NEXT' Button"] = "Crafting 'CRAFT NEXT' Button"
--[[Translation missing --]]
TSM.L["Crafting Queue"] = "Crafting Queue"
--[[Translation missing --]]
TSM.L["Crafting Tooltips"] = "Crafting Tooltips"
--[[Translation missing --]]
TSM.L["Crafts"] = "Crafts"
--[[Translation missing --]]
TSM.L["Crafts %d"] = "Crafts %d"
--[[Translation missing --]]
TSM.L["CREATE MACRO"] = "CREATE MACRO"
TSM.L["Create New Operation"] = "Créer  une Nouvelle Opération"
--[[Translation missing --]]
TSM.L["CREATE NEW PROFILE"] = "CREATE NEW PROFILE"
TSM.L["Crystals"] = "Cristaux"
--[[Translation missing --]]
TSM.L["Current Profiles"] = "Current Profiles"
--[[Translation missing --]]
TSM.L["CURRENT SEARCH"] = "CURRENT SEARCH"
--[[Translation missing --]]
TSM.L["CUSTOM POST"] = "CUSTOM POST"
--[[Translation missing --]]
TSM.L["Custom Price"] = "Custom Price"
TSM.L["Custom Price Source"] = "Source de prix spécifique"
--[[Translation missing --]]
TSM.L["Custom Sources"] = "Custom Sources"
--[[Translation missing --]]
TSM.L["Database Sources"] = "Database Sources"
--[[Translation missing --]]
TSM.L["DD/MM/YY HH:MM"] = "DD/MM/YY HH:MM"
--[[Translation missing --]]
TSM.L["Default Craft Value Method:"] = "Default Craft Value Method:"
--[[Translation missing --]]
TSM.L["Default Material Cost Method:"] = "Default Material Cost Method:"
--[[Translation missing --]]
TSM.L["Default Price"] = "Default Price"
--[[Translation missing --]]
TSM.L["Default Price Configuration"] = "Default Price Configuration"
--[[Translation missing --]]
TSM.L["Default vendoring page"] = "Default vendoring page"
--[[Translation missing --]]
TSM.L["Define whet priority Gathering gives certain sources."] = "Define whet priority Gathering gives certain sources."
--[[Translation missing --]]
TSM.L["Delete Profile Confirmation"] = "Delete Profile Confirmation"
--[[Translation missing --]]
TSM.L["DEPOSIT REAGENTS"] = "DEPOSIT REAGENTS"
TSM.L["Deselect All Groups"] = "Déselectionner tous les groupes"
--[[Translation missing --]]
TSM.L["Deselect All Items"] = "Deselect All Items"
--[[Translation missing --]]
TSM.L["Destroy Next"] = "Destroy Next"
TSM.L["Destroy Value"] = "Détruire Valeur"
--[[Translation missing --]]
TSM.L["Destroy Value Source"] = "Destroy Value Source"
--[[Translation missing --]]
TSM.L["Destroying"] = "Destroying"
--[[Translation missing --]]
TSM.L["Destroying 'DESTROY NEXT' Button"] = "Destroying 'DESTROY NEXT' Button"
--[[Translation missing --]]
TSM.L["Destroying Tooltips"] = "Destroying Tooltips"
--[[Translation missing --]]
TSM.L["Destroying..."] = "Destroying..."
--[[Translation missing --]]
TSM.L["Details"] = "Details"
--[[Translation missing --]]
TSM.L["Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."] = "Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your maximum price (%s) is invalid. Check your settings."] = "Did not cancel %s because your maximum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your minimum price (%s) is invalid. Check your settings."] = "Did not cancel %s because your minimum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your normal price (%s) is invalid. Check your settings."] = "Did not cancel %s because your normal price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your undercut (%s) is invalid. Check your settings."] = "Did not cancel %s because your undercut (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."] = "Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."
--[[Translation missing --]]
TSM.L["Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."] = "Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."
--[[Translation missing --]]
TSM.L["Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."] = "Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."
--[[Translation missing --]]
TSM.L["Did not post %s because your maximum price (%s) is invalid. Check your settings."] = "Did not post %s because your maximum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your minimum price (%s) is invalid. Check your settings."] = "Did not post %s because your minimum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your normal price (%s) is invalid. Check your settings."] = "Did not post %s because your normal price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your stack size (%d) is higher than the max stack size of the item (%d)."] = "Did not post %s because your stack size (%d) is higher than the max stack size of the item (%d)."
--[[Translation missing --]]
TSM.L["Did not post %s because your undercut (%s) is invalid. Check your settings."] = "Did not post %s because your undercut (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Disable invalid price warnings"] = "Disable invalid price warnings"
--[[Translation missing --]]
TSM.L["Disenchant Search"] = "Disenchant Search"
--[[Translation missing --]]
TSM.L["DISENCHANT SEARCH"] = "DISENCHANT SEARCH"
--[[Translation missing --]]
TSM.L["Disenchant Search Options"] = "Disenchant Search Options"
--[[Translation missing --]]
TSM.L["Disenchant Value"] = "Disenchant Value"
--[[Translation missing --]]
TSM.L["Disenchanting Options"] = "Disenchanting Options"
--[[Translation missing --]]
TSM.L["Display auctioning values"] = "Display auctioning values"
--[[Translation missing --]]
TSM.L["Display cancelled since last sale"] = "Display cancelled since last sale"
--[[Translation missing --]]
TSM.L["Display crafting cost"] = "Display crafting cost"
--[[Translation missing --]]
TSM.L["Display detailed destroy info"] = "Display detailed destroy info"
--[[Translation missing --]]
TSM.L["Display disenchant value"] = "Display disenchant value"
--[[Translation missing --]]
TSM.L["Display global historical price"] = "Display global historical price"
--[[Translation missing --]]
TSM.L["Display global market value avg"] = "Display global market value avg"
--[[Translation missing --]]
TSM.L["Display global min buyout avg"] = "Display global min buyout avg"
--[[Translation missing --]]
TSM.L["Display global sale avg"] = "Display global sale avg"
--[[Translation missing --]]
TSM.L["Display group name"] = "Display group name"
--[[Translation missing --]]
TSM.L["Display historical price"] = "Display historical price"
--[[Translation missing --]]
TSM.L["Display market value"] = "Display market value"
--[[Translation missing --]]
TSM.L["Display mill value"] = "Display mill value"
--[[Translation missing --]]
TSM.L["Display min buyout"] = "Display min buyout"
--[[Translation missing --]]
TSM.L["Display Operation Names"] = "Display Operation Names"
--[[Translation missing --]]
TSM.L["Display prospect value"] = "Display prospect value"
--[[Translation missing --]]
TSM.L["Display purchase info"] = "Display purchase info"
--[[Translation missing --]]
TSM.L["Display region historical price"] = "Display region historical price"
--[[Translation missing --]]
TSM.L["Display region market value avg"] = "Display region market value avg"
--[[Translation missing --]]
TSM.L["Display region min buyout avg"] = "Display region min buyout avg"
--[[Translation missing --]]
TSM.L["Display region sale avg"] = "Display region sale avg"
--[[Translation missing --]]
TSM.L["Display region sale rate"] = "Display region sale rate"
--[[Translation missing --]]
TSM.L["Display region sold per day"] = "Display region sold per day"
--[[Translation missing --]]
TSM.L["Display sale info"] = "Display sale info"
--[[Translation missing --]]
TSM.L["Display sale rate"] = "Display sale rate"
--[[Translation missing --]]
TSM.L["Display shopping max price"] = "Display shopping max price"
--[[Translation missing --]]
TSM.L["Display total money recieved in chat?"] = "Display total money recieved in chat?"
--[[Translation missing --]]
TSM.L["Display transform value"] = "Display transform value"
--[[Translation missing --]]
TSM.L["Display vendor buy price"] = "Display vendor buy price"
--[[Translation missing --]]
TSM.L["Display vendor sell price"] = "Display vendor sell price"
--[[Translation missing --]]
TSM.L["Doing so will also remove any sub-groups attached to this group."] = "Doing so will also remove any sub-groups attached to this group."
--[[Translation missing --]]
TSM.L["Done Canceling"] = "Done Canceling"
--[[Translation missing --]]
TSM.L["Done Posting"] = "Done Posting"
TSM.L["Done Scanning"] = "Faire le scan"
--[[Translation missing --]]
TSM.L["Don't post after this many expires:"] = "Don't post after this many expires:"
--[[Translation missing --]]
TSM.L["Don't Post Items"] = "Don't Post Items"
--[[Translation missing --]]
TSM.L["Don't prompt to record trades"] = "Don't prompt to record trades"
--[[Translation missing --]]
TSM.L["DOWN"] = "DOWN"
--[[Translation missing --]]
TSM.L["Drag in Additional Items (%d/%d Items)"] = "Drag in Additional Items (%d/%d Items)"
--[[Translation missing --]]
TSM.L["Drag Item(s) Into Box"] = "Drag Item(s) Into Box"
--[[Translation missing --]]
TSM.L["Duplicate"] = "Duplicate"
--[[Translation missing --]]
TSM.L["Duplicate Profile Confirmation"] = "Duplicate Profile Confirmation"
TSM.L["Dust"] = "Poussière"
--[[Translation missing --]]
TSM.L["Elevate your gold-making!"] = "Elevate your gold-making!"
--[[Translation missing --]]
TSM.L["Embed TSM tooltips"] = "Embed TSM tooltips"
--[[Translation missing --]]
TSM.L["EMPTY BAGS"] = "EMPTY BAGS"
TSM.L["Empty parentheses are not allowed"] = "Les parenthèses vides ne sont pas autorisées"
TSM.L["Empty price string."] = "Chaine de prix vide."
--[[Translation missing --]]
TSM.L["Enable automatic stack combination"] = "Enable automatic stack combination"
--[[Translation missing --]]
TSM.L["Enable buying?"] = "Enable buying?"
--[[Translation missing --]]
TSM.L["Enable inbox chat messages"] = "Enable inbox chat messages"
--[[Translation missing --]]
TSM.L["Enable restock?"] = "Enable restock?"
--[[Translation missing --]]
TSM.L["Enable selling?"] = "Enable selling?"
--[[Translation missing --]]
TSM.L["Enable sending chat messages"] = "Enable sending chat messages"
--[[Translation missing --]]
TSM.L["Enable smart crafting for quests"] = "Enable smart crafting for quests"
--[[Translation missing --]]
TSM.L["Enable TSM Tooltips"] = "Enable TSM Tooltips"
--[[Translation missing --]]
TSM.L["Enable tweet enhancement"] = "Enable tweet enhancement"
--[[Translation missing --]]
TSM.L["Enchant Vellum"] = "Enchant Vellum"
--[[Translation missing --]]
TSM.L["Enter a name for the new profile"] = "Enter a name for the new profile"
--[[Translation missing --]]
TSM.L["Enter Filter"] = "Enter Filter"
--[[Translation missing --]]
TSM.L["Enter Keyword"] = "Enter Keyword"
--[[Translation missing --]]
TSM.L["Enter name of logged-in character from other account"] = "Enter name of logged-in character from other account"
--[[Translation missing --]]
TSM.L["Enter player name"] = "Enter player name"
TSM.L["Essences"] = "Essences"
TSM.L["Establishing connection to %s. Make sure that you've entered this character's name on the other account."] = "Connexion en cours avec %s. Assurez-vous d'avoir bien entré le nom de ce personnage sur l'autre compte."
--[[Translation missing --]]
TSM.L["Estimated Cost:"] = "Estimated Cost:"
--[[Translation missing --]]
TSM.L["Estimated Profit:"] = "Estimated Profit:"
--[[Translation missing --]]
TSM.L["Exact Match Only?"] = "Exact Match Only?"
--[[Translation missing --]]
TSM.L["Exclude crafts with cooldowns"] = "Exclude crafts with cooldowns"
--[[Translation missing --]]
TSM.L["Expenses"] = "Expenses"
--[[Translation missing --]]
TSM.L["EXPENSES"] = "EXPENSES"
--[[Translation missing --]]
TSM.L["Expired"] = "Expired"
--[[Translation missing --]]
TSM.L["Expired Since Last Sale"] = "Expired Since Last Sale"
--[[Translation missing --]]
TSM.L["Expires"] = "Expires"
--[[Translation missing --]]
TSM.L["EXPIRES"] = "EXPIRES"
TSM.L["Exploration"] = "Exploration"
--[[Translation missing --]]
TSM.L["Export"] = "Export"
--[[Translation missing --]]
TSM.L["Export List"] = "Export List"
--[[Translation missing --]]
TSM.L["Failed Auctions"] = "Failed Auctions"
--[[Translation missing --]]
TSM.L["Failed Since Last Sale (Expired/Cancelled)"] = "Failed Since Last Sale (Expired/Cancelled)"
--[[Translation missing --]]
TSM.L["Failed to bid on auction of %s."] = "Failed to bid on auction of %s."
--[[Translation missing --]]
TSM.L["Failed to buy auction of %s."] = "Failed to buy auction of %s."
--[[Translation missing --]]
TSM.L["Failed to find auction for %s, so removing it from the results."] = "Failed to find auction for %s, so removing it from the results."
TSM.L["Favorite Scans"] = "Scans favoris"
--[[Translation missing --]]
TSM.L["Favorite Searches"] = "Favorite Searches"
--[[Translation missing --]]
TSM.L["Filter Auctions by Duration"] = "Filter Auctions by Duration"
--[[Translation missing --]]
TSM.L["Filter Auctions by Keyword"] = "Filter Auctions by Keyword"
--[[Translation missing --]]
TSM.L["FILTER BY KEYWORD"] = "FILTER BY KEYWORD"
--[[Translation missing --]]
TSM.L["Filter by Keyword"] = "Filter by Keyword"
--[[Translation missing --]]
TSM.L["Filter group item lists based on the following price source"] = "Filter group item lists based on the following price source"
--[[Translation missing --]]
TSM.L["Filter Items"] = "Filter Items"
--[[Translation missing --]]
TSM.L["Filter Shopping"] = "Filter Shopping"
--[[Translation missing --]]
TSM.L["Finding Selected Auction"] = "Finding Selected Auction"
--[[Translation missing --]]
TSM.L["Fishing Reel In"] = "Fishing Reel In"
--[[Translation missing --]]
TSM.L["Forget Character"] = "Forget Character"
--[[Translation missing --]]
TSM.L["Found auction sound"] = "Found auction sound"
--[[Translation missing --]]
TSM.L["Friends"] = "Friends"
--[[Translation missing --]]
TSM.L["From"] = "From"
TSM.L["Full"] = "Plein"
--[[Translation missing --]]
TSM.L["Garrison"] = "Garrison"
--[[Translation missing --]]
TSM.L["Gathering"] = "Gathering"
--[[Translation missing --]]
TSM.L["Gathering Search"] = "Gathering Search"
TSM.L["General Options"] = "Options générales"
--[[Translation missing --]]
TSM.L["Get from Bank"] = "Get from Bank"
--[[Translation missing --]]
TSM.L["Get from Guild Bank"] = "Get from Guild Bank"
--[[Translation missing --]]
TSM.L["Global Data Tooltips"] = "Global Data Tooltips"
--[[Translation missing --]]
TSM.L["Global Historical Price"] = "Global Historical Price"
--[[Translation missing --]]
TSM.L["Global Market Value Avg"] = "Global Market Value Avg"
--[[Translation missing --]]
TSM.L["Global Min Buyout Avg"] = "Global Min Buyout Avg"
--[[Translation missing --]]
TSM.L["Global Operation Confirmation"] = "Global Operation Confirmation"
--[[Translation missing --]]
TSM.L["Global Sale Avg"] = "Global Sale Avg"
--[[Translation missing --]]
TSM.L["Gold"] = "Gold"
--[[Translation missing --]]
TSM.L["Gold Earned:"] = "Gold Earned:"
--[[Translation missing --]]
TSM.L["GOLD ON HAND"] = "GOLD ON HAND"
--[[Translation missing --]]
TSM.L["Gold Spent:"] = "Gold Spent:"
--[[Translation missing --]]
TSM.L["GREAT DEALS SEARCH"] = "GREAT DEALS SEARCH"
--[[Translation missing --]]
TSM.L["Group already exists."] = "Group already exists."
TSM.L["Group Management"] = "Gestion des groupes"
--[[Translation missing --]]
TSM.L["Group Operations"] = "Group Operations"
--[[Translation missing --]]
TSM.L["Group Settings"] = "Group Settings"
--[[Translation missing --]]
TSM.L["Grouped Items"] = "Grouped Items"
TSM.L["Groups"] = "Groupes"
--[[Translation missing --]]
TSM.L["Guild"] = "Guild"
--[[Translation missing --]]
TSM.L["Guild Bank"] = "Guild Bank"
--[[Translation missing --]]
TSM.L["GUILDS"] = "GUILDS"
TSM.L["GVault"] = "BanqueDeGuilde"
--[[Translation missing --]]
TSM.L["Have"] = "Have"
--[[Translation missing --]]
TSM.L["Have Materials"] = "Have Materials"
--[[Translation missing --]]
TSM.L["Have Skill Up"] = "Have Skill Up"
--[[Translation missing --]]
TSM.L["Help & Info"] = "Help & Info"
--[[Translation missing --]]
TSM.L["Hide auctions with bids"] = "Hide auctions with bids"
--[[Translation missing --]]
TSM.L["Hide Description"] = "Hide Description"
--[[Translation missing --]]
TSM.L["Hide minimap icon"] = "Hide minimap icon"
--[[Translation missing --]]
TSM.L["Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."] = "Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."
--[[Translation missing --]]
TSM.L["Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."] = "Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."
--[[Translation missing --]]
TSM.L["High Bidder"] = "High Bidder"
--[[Translation missing --]]
TSM.L["Historical Price"] = "Historical Price"
--[[Translation missing --]]
TSM.L["Hold ALT to repair from the guild bank."] = "Hold ALT to repair from the guild bank."
--[[Translation missing --]]
TSM.L["Hr"] = "Hr"
--[[Translation missing --]]
TSM.L["Hrs"] = "Hrs"
--[[Translation missing --]]
TSM.L["I just bought [%s]x%d for %s! %s #TSM4 #warcraft"] = "I just bought [%s]x%d for %s! %s #TSM4 #warcraft"
--[[Translation missing --]]
TSM.L["I just sold [%s] for %s! %s #TSM4 #warcraft"] = "I just sold [%s] for %s! %s #TSM4 #warcraft"
--[[Translation missing --]]
TSM.L["If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."] = "If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."
--[[Translation missing --]]
TSM.L["If you have multiple profile set up with operations, enabling this will cause all but the current profile's operations to be irreversibly lost. Are you sure you want to continue?"] = "If you have multiple profile set up with operations, enabling this will cause all but the current profile's operations to be irreversibly lost. Are you sure you want to continue?"
--[[Translation missing --]]
TSM.L["If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."] = "If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."
--[[Translation missing --]]
TSM.L["Ignore Auctions Below Min"] = "Ignore Auctions Below Min"
--[[Translation missing --]]
TSM.L["Ignore auctions by duration?"] = "Ignore auctions by duration?"
--[[Translation missing --]]
TSM.L["Ignore Characters"] = "Ignore Characters"
--[[Translation missing --]]
TSM.L["Ignore duplicate operations?"] = "Ignore duplicate operations?"
TSM.L["Ignore Guilds"] = "Ignorer les guildes "
--[[Translation missing --]]
TSM.L["Ignore operation on characters:"] = "Ignore operation on characters:"
--[[Translation missing --]]
TSM.L["Ignore operation on faction-realms:"] = "Ignore operation on faction-realms:"
--[[Translation missing --]]
TSM.L["Ignore random enchants?"] = "Ignore random enchants?"
--[[Translation missing --]]
TSM.L["Ignored Cooldowns"] = "Ignored Cooldowns"
--[[Translation missing --]]
TSM.L["Ignored Items"] = "Ignored Items"
TSM.L["ilvl"] = "ilvl"
--[[Translation missing --]]
TSM.L["Import"] = "Import"
--[[Translation missing --]]
TSM.L["IMPORT"] = "IMPORT"
--[[Translation missing --]]
TSM.L["Import %d Items and %s Operations?"] = "Import %d Items and %s Operations?"
--[[Translation missing --]]
TSM.L["Import Groups & Operations"] = "Import Groups & Operations"
--[[Translation missing --]]
TSM.L["Imported Items"] = "Imported Items"
--[[Translation missing --]]
TSM.L["Imported Operations"] = "Imported Operations"
--[[Translation missing --]]
TSM.L["Inbox Settings"] = "Inbox Settings"
--[[Translation missing --]]
TSM.L["Include Attached Operations"] = "Include Attached Operations"
--[[Translation missing --]]
TSM.L["Include operations?"] = "Include operations?"
--[[Translation missing --]]
TSM.L["Include soulbound items"] = "Include soulbound items"
--[[Translation missing --]]
TSM.L["Information"] = "Information"
--[[Translation missing --]]
TSM.L["Invalid custom price entered."] = "Invalid custom price entered."
--[[Translation missing --]]
TSM.L["Invalid custom price source for %s. %s"] = "Invalid custom price source for %s. %s"
TSM.L["Invalid custom price."] = "Prix spécifique invalide."
TSM.L["Invalid function."] = "Fonction invalide."
--[[Translation missing --]]
TSM.L["Invalid group name."] = "Invalid group name."
TSM.L["Invalid item link."] = "Lien de l'objet invalide."
--[[Translation missing --]]
TSM.L["Invalid operation name."] = "Invalid operation name."
--[[Translation missing --]]
TSM.L["Invalid operator at end of custom price."] = "Invalid operator at end of custom price."
TSM.L["Invalid parameter to price source."] = "Paramètre invalide dans la formule du prix"
--[[Translation missing --]]
TSM.L["Invalid player name."] = "Invalid player name."
--[[Translation missing --]]
TSM.L["Invalid price source in convert."] = "Invalid price source in convert."
--[[Translation missing --]]
TSM.L["Invalid price source."] = "Invalid price source."
--[[Translation missing --]]
TSM.L["Invalid seller data returned by server."] = "Invalid seller data returned by server."
TSM.L["Invalid word: '%s'"] = "Mot invalide: '%s'"
--[[Translation missing --]]
TSM.L["Inventory"] = "Inventory"
--[[Translation missing --]]
TSM.L["Inventory / Mailing"] = "Inventory / Mailing"
--[[Translation missing --]]
TSM.L["Inventory Options"] = "Inventory Options"
--[[Translation missing --]]
TSM.L["Inventory Tooltip Format"] = "Inventory Tooltip Format"
--[[Translation missing --]]
TSM.L["It appears that you've manually copied your saved variables between accounts which will cause TSM's automatic sync'ing to not work. You'll need to undo this, and/or delete the TradeSkillMaster and TSM_Crafting saved variables files on both accounts (with WoW closed) in order to fix this."] = "It appears that you've manually copied your saved variables between accounts which will cause TSM's automatic sync'ing to not work. You'll need to undo this, and/or delete the TradeSkillMaster and TSM_Crafting saved variables files on both accounts (with WoW closed) in order to fix this."
TSM.L["Item"] = "Objet"
--[[Translation missing --]]
TSM.L["ITEM CLASS"] = "ITEM CLASS"
--[[Translation missing --]]
TSM.L["Item Level"] = "Item Level"
--[[Translation missing --]]
TSM.L["ITEM LEVEL RANGE"] = "ITEM LEVEL RANGE"
--[[Translation missing --]]
TSM.L["Item links may only be used as parameters to price sources."] = "Item links may only be used as parameters to price sources."
TSM.L["Item Name"] = "Nom de l'objet"
--[[Translation missing --]]
TSM.L["Item Quality"] = "Item Quality"
--[[Translation missing --]]
TSM.L["ITEM SEARCH"] = "ITEM SEARCH"
--[[Translation missing --]]
TSM.L["ITEM SUBCLASS"] = "ITEM SUBCLASS"
--[[Translation missing --]]
TSM.L["Item Value"] = "Item Value"
TSM.L["Item/Group is invalid (see chat)."] = "L'Objet/Groupe est invalide (voir le tchat)."
TSM.L["ITEMS"] = "OBJETS"
TSM.L["Items"] = "Objets"
TSM.L["Items in Bags"] = "Objets dans les sacs"
TSM.L["Keep in bags quantity:"] = "Quantité gardée dans les sacs :"
TSM.L["Keep in bank quantity:"] = "Quantité gardée dans la banque :"
--[[Translation missing --]]
TSM.L["Keep posted:"] = "Keep posted:"
TSM.L["Keep quantity:"] = "Quantité gardée : "
TSM.L["Keep this amount in bags:"] = "Garder ce montant dans les sacs :"
TSM.L["Keep this amount:"] = "Garder ce montant :"
--[[Translation missing --]]
TSM.L["Keeping %d."] = "Keeping %d."
--[[Translation missing --]]
TSM.L["Keeping undercut auctions posted."] = "Keeping undercut auctions posted."
--[[Translation missing --]]
TSM.L["Last 14 Days"] = "Last 14 Days"
--[[Translation missing --]]
TSM.L["Last 3 Days"] = "Last 3 Days"
--[[Translation missing --]]
TSM.L["Last 30 Days"] = "Last 30 Days"
--[[Translation missing --]]
TSM.L["LAST 30 DAYS"] = "LAST 30 DAYS"
--[[Translation missing --]]
TSM.L["Last 60 Days"] = "Last 60 Days"
--[[Translation missing --]]
TSM.L["Last 7 Days"] = "Last 7 Days"
--[[Translation missing --]]
TSM.L["LAST 7 DAYS"] = "LAST 7 DAYS"
TSM.L["Last Data Update:"] = "Dernière MAJ des données :"
--[[Translation missing --]]
TSM.L["Last Purchased"] = "Last Purchased"
--[[Translation missing --]]
TSM.L["Last Sold"] = "Last Sold"
--[[Translation missing --]]
TSM.L["Level Up"] = "Level Up"
--[[Translation missing --]]
TSM.L["LIMIT"] = "LIMIT"
--[[Translation missing --]]
TSM.L["Link to Another Operation"] = "Link to Another Operation"
--[[Translation missing --]]
TSM.L["List"] = "List"
--[[Translation missing --]]
TSM.L["List materials in tooltip"] = "List materials in tooltip"
--[[Translation missing --]]
TSM.L["Loading Mails..."] = "Loading Mails..."
--[[Translation missing --]]
TSM.L["Loading..."] = "Loading..."
TSM.L["Looks like TradeSkillMaster has encountered an error. Please help the author fix this error by following the instructions shown."] = "Il semblerait que TradeSkillMaster ai rencontré une erreur. Merci d'aider les développeurs à la corriger en suivant les instructions affichées."
TSM.L["Loop detected in the following custom price:"] = "Boucle détectée pour le prix spécifique suivant :"
--[[Translation missing --]]
TSM.L["Lowest auction by whitelisted player."] = "Lowest auction by whitelisted player."
--[[Translation missing --]]
TSM.L["Macro created and scroll wheel bound!"] = "Macro created and scroll wheel bound!"
TSM.L["Macro Setup"] = "Configuration de la Macro"
TSM.L["Mail"] = "Mail"
--[[Translation missing --]]
TSM.L["Mail Disenchantables"] = "Mail Disenchantables"
--[[Translation missing --]]
TSM.L["Mail Disenchantables Max Quality"] = "Mail Disenchantables Max Quality"
--[[Translation missing --]]
TSM.L["MAIL SELECTED GROUPS"] = "MAIL SELECTED GROUPS"
--[[Translation missing --]]
TSM.L["Mail to %s"] = "Mail to %s"
--[[Translation missing --]]
TSM.L["Mailing"] = "Mailing"
--[[Translation missing --]]
TSM.L["Mailing all to %s."] = "Mailing all to %s."
--[[Translation missing --]]
TSM.L["Mailing Options"] = "Mailing Options"
--[[Translation missing --]]
TSM.L["Mailing up to %d to %s."] = "Mailing up to %d to %s."
--[[Translation missing --]]
TSM.L["Main Settings"] = "Main Settings"
--[[Translation missing --]]
TSM.L["Make Cash On Delivery?"] = "Make Cash On Delivery?"
--[[Translation missing --]]
TSM.L["Management Options"] = "Management Options"
--[[Translation missing --]]
TSM.L["Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."] = "Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."
--[[Translation missing --]]
TSM.L["Map Ping"] = "Map Ping"
--[[Translation missing --]]
TSM.L["Market Value"] = "Market Value"
--[[Translation missing --]]
TSM.L["Market Value Price Source"] = "Market Value Price Source"
--[[Translation missing --]]
TSM.L["Market Value Source"] = "Market Value Source"
--[[Translation missing --]]
TSM.L["Mat Cost"] = "Mat Cost"
--[[Translation missing --]]
TSM.L["Mat Price"] = "Mat Price"
--[[Translation missing --]]
TSM.L["Match stack size?"] = "Match stack size?"
--[[Translation missing --]]
TSM.L["Match whitelisted players"] = "Match whitelisted players"
--[[Translation missing --]]
TSM.L["Material Name"] = "Material Name"
--[[Translation missing --]]
TSM.L["Materials"] = "Materials"
--[[Translation missing --]]
TSM.L["Materials to Gather"] = "Materials to Gather"
--[[Translation missing --]]
TSM.L["Max Destroy Value"] = "Max Destroy Value"
--[[Translation missing --]]
TSM.L["MAX EXPIRES TO BANK"] = "MAX EXPIRES TO BANK"
--[[Translation missing --]]
TSM.L["Max Market Value"] = "Max Market Value"
--[[Translation missing --]]
TSM.L["Max Shopping Price"] = "Max Shopping Price"
--[[Translation missing --]]
TSM.L["Maximum amount already posted."] = "Maximum amount already posted."
--[[Translation missing --]]
TSM.L["Maximum Auction Price (Per Item)"] = "Maximum Auction Price (Per Item)"
--[[Translation missing --]]
TSM.L["Maximum Destroy Value (Enter '0c' to disable)"] = "Maximum Destroy Value (Enter '0c' to disable)"
--[[Translation missing --]]
TSM.L["Maximum disenchant level:"] = "Maximum disenchant level:"
--[[Translation missing --]]
TSM.L["Maximum Disenchant Quality"] = "Maximum Disenchant Quality"
--[[Translation missing --]]
TSM.L["Maximum disenchant search percentage:"] = "Maximum disenchant search percentage:"
--[[Translation missing --]]
TSM.L["Maximum Market Value (Enter '0c' to disable)"] = "Maximum Market Value (Enter '0c' to disable)"
--[[Translation missing --]]
TSM.L["MAXIMUM QUANTITY TO BUY:"] = "MAXIMUM QUANTITY TO BUY:"
--[[Translation missing --]]
TSM.L["Maximum quantity:"] = "Maximum quantity:"
--[[Translation missing --]]
TSM.L["Maximum restock quantity:"] = "Maximum restock quantity:"
--[[Translation missing --]]
TSM.L["Mill Value"] = "Mill Value"
--[[Translation missing --]]
TSM.L["Min"] = "Min"
--[[Translation missing --]]
TSM.L["Min Buyout"] = "Min Buyout"
--[[Translation missing --]]
TSM.L["Min/Normal/Max Prices"] = "Min/Normal/Max Prices"
--[[Translation missing --]]
TSM.L["Minimum Days Old"] = "Minimum Days Old"
--[[Translation missing --]]
TSM.L["Minimum disenchant level:"] = "Minimum disenchant level:"
--[[Translation missing --]]
TSM.L["Minimum expires:"] = "Minimum expires:"
--[[Translation missing --]]
TSM.L["Minimum profit:"] = "Minimum profit:"
--[[Translation missing --]]
TSM.L["MINIMUM RARITY"] = "MINIMUM RARITY"
--[[Translation missing --]]
TSM.L["Minimum restock quantity:"] = "Minimum restock quantity:"
TSM.L["Misplaced comma"] = "Virgule mal placée"
--[[Translation missing --]]
TSM.L["Missing Materials"] = "Missing Materials"
--[[Translation missing --]]
TSM.L["MM/DD/YY HH:MM"] = "MM/DD/YY HH:MM"
TSM.L["Modifiers:"] = "Modificateurs:"
--[[Translation missing --]]
TSM.L["Money Frame Open"] = "Money Frame Open"
--[[Translation missing --]]
TSM.L["Money Transfer"] = "Money Transfer"
--[[Translation missing --]]
TSM.L["Most Profitable Item:"] = "Most Profitable Item:"
--[[Translation missing --]]
TSM.L["MOVE"] = "MOVE"
--[[Translation missing --]]
TSM.L["Move already grouped items?"] = "Move already grouped items?"
--[[Translation missing --]]
TSM.L["Move Quantity Settings"] = "Move Quantity Settings"
--[[Translation missing --]]
TSM.L["MOVE TO BAGS"] = "MOVE TO BAGS"
--[[Translation missing --]]
TSM.L["MOVE TO BANK"] = "MOVE TO BANK"
--[[Translation missing --]]
TSM.L["MOVING"] = "MOVING"
--[[Translation missing --]]
TSM.L["Moving"] = "Moving"
--[[Translation missing --]]
TSM.L["Multiple Items"] = "Multiple Items"
TSM.L["My Auctions"] = "Mes Enchères"
--[[Translation missing --]]
TSM.L["My Auctions 'CANCEL' Button"] = "My Auctions 'CANCEL' Button"
--[[Translation missing --]]
TSM.L["Neat Stacks only?"] = "Neat Stacks only?"
--[[Translation missing --]]
TSM.L["NEED MATS"] = "NEED MATS"
TSM.L["New Group"] = "Nouveau groupe"
TSM.L["New Operation"] = "Nouvelle opération"
--[[Translation missing --]]
TSM.L["NEWS AND INFORMATION"] = "NEWS AND INFORMATION"
--[[Translation missing --]]
TSM.L["No Attachments"] = "No Attachments"
--[[Translation missing --]]
TSM.L["No Data"] = "No Data"
--[[Translation missing --]]
TSM.L["No group selected"] = "No group selected"
--[[Translation missing --]]
TSM.L["No item specified. Usage: /tsm restock_help [ITEM_LINK]"] = "No item specified. Usage: /tsm restock_help [ITEM_LINK]"
--[[Translation missing --]]
TSM.L["NO ITEMS"] = "NO ITEMS"
--[[Translation missing --]]
TSM.L["No Materials to Gather"] = "No Materials to Gather"
--[[Translation missing --]]
TSM.L["No Operation Selected"] = "No Operation Selected"
--[[Translation missing --]]
TSM.L["No posting."] = "No posting."
--[[Translation missing --]]
TSM.L["No Profession Opened"] = "No Profession Opened"
--[[Translation missing --]]
TSM.L["No Profession Selected"] = "No Profession Selected"
--[[Translation missing --]]
TSM.L["No profile specified. Possible profiles: '%s'"] = "No profile specified. Possible profiles: '%s'"
TSM.L["No recent AuctionDB scan data found."] = "Pas de scan AuctionDB récent trouvé."
TSM.L["No Sound"] = "Pas de son"
TSM.L["None"] = "Rien"
--[[Translation missing --]]
TSM.L["None (Always Show)"] = "None (Always Show)"
--[[Translation missing --]]
TSM.L["None Selected"] = "None Selected"
--[[Translation missing --]]
TSM.L["NONGROUP TO BANK"] = "NONGROUP TO BANK"
--[[Translation missing --]]
TSM.L["Normal"] = "Normal"
--[[Translation missing --]]
TSM.L["Not canceling auction at reset price."] = "Not canceling auction at reset price."
--[[Translation missing --]]
TSM.L["Not canceling auction below min price."] = "Not canceling auction below min price."
--[[Translation missing --]]
TSM.L["Not canceling."] = "Not canceling."
--[[Translation missing --]]
TSM.L["Not enough items in bags."] = "Not enough items in bags."
--[[Translation missing --]]
TSM.L["NOT OPEN"] = "NOT OPEN"
TSM.L["Not Scanned"] = "Non scanné"
--[[Translation missing --]]
TSM.L["NPC"] = "NPC"
--[[Translation missing --]]
TSM.L["Number Owned"] = "Number Owned"
--[[Translation missing --]]
TSM.L["of"] = "of"
TSM.L["Offline"] = "Hors ligne"
--[[Translation missing --]]
TSM.L["Old TSM addons detected. TSM has disabled them and requires a reload."] = "Old TSM addons detected. TSM has disabled them and requires a reload."
--[[Translation missing --]]
TSM.L["On Cooldown"] = "On Cooldown"
--[[Translation missing --]]
TSM.L["Only show craftable"] = "Only show craftable"
--[[Translation missing --]]
TSM.L["Only show items with disenchant value above custom price"] = "Only show items with disenchant value above custom price"
--[[Translation missing --]]
TSM.L["OPEN"] = "OPEN"
TSM.L["Open all bags when auctioning"] = "Ouvrir tous les sacs lorsque vous vendez aux enchères"
--[[Translation missing --]]
TSM.L["OPEN ALL MAIL"] = "OPEN ALL MAIL"
--[[Translation missing --]]
TSM.L["Open Mail"] = "Open Mail"
--[[Translation missing --]]
TSM.L["Open Mail Complete Sound"] = "Open Mail Complete Sound"
--[[Translation missing --]]
TSM.L["Open Task List"] = "Open Task List"
--[[Translation missing --]]
TSM.L["Operation"] = "Operation"
TSM.L["Operations"] = "Opérations"
--[[Translation missing --]]
TSM.L["Other Character"] = "Other Character"
--[[Translation missing --]]
TSM.L["Other Settings"] = "Other Settings"
--[[Translation missing --]]
TSM.L["Other Shopping Searches"] = "Other Shopping Searches"
--[[Translation missing --]]
TSM.L["Override default craft value method?"] = "Override default craft value method?"
--[[Translation missing --]]
TSM.L["Override parent operations"] = "Override parent operations"
--[[Translation missing --]]
TSM.L["Parent Items"] = "Parent Items"
--[[Translation missing --]]
TSM.L["Past 7 Days"] = "Past 7 Days"
--[[Translation missing --]]
TSM.L["Past Day"] = "Past Day"
--[[Translation missing --]]
TSM.L["Past Month"] = "Past Month"
--[[Translation missing --]]
TSM.L["Past Year"] = "Past Year"
--[[Translation missing --]]
TSM.L["Paste string here"] = "Paste string here"
--[[Translation missing --]]
TSM.L["Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."] = "Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."
--[[Translation missing --]]
TSM.L["Per Item"] = "Per Item"
--[[Translation missing --]]
TSM.L["Per Stack"] = "Per Stack"
--[[Translation missing --]]
TSM.L["Per Unit"] = "Per Unit"
TSM.L["Player Gold"] = "Or du joueur"
--[[Translation missing --]]
TSM.L["Player Invite Accept"] = "Player Invite Accept"
--[[Translation missing --]]
TSM.L["Please select a group to export"] = "Please select a group to export"
--[[Translation missing --]]
TSM.L["POST"] = "POST"
--[[Translation missing --]]
TSM.L["Post at Maximum Price"] = "Post at Maximum Price"
--[[Translation missing --]]
TSM.L["Post at Minimum Price"] = "Post at Minimum Price"
--[[Translation missing --]]
TSM.L["Post at Normal Price"] = "Post at Normal Price"
--[[Translation missing --]]
TSM.L["POST CAP TO BAGS"] = "POST CAP TO BAGS"
TSM.L["Post Scan"] = "Poster le scan"
--[[Translation missing --]]
TSM.L["POST SELECTED"] = "POST SELECTED"
--[[Translation missing --]]
TSM.L["POSTAGE"] = "POSTAGE"
--[[Translation missing --]]
TSM.L["Postage"] = "Postage"
--[[Translation missing --]]
TSM.L["Posted at whitelisted player's price."] = "Posted at whitelisted player's price."
--[[Translation missing --]]
TSM.L["Posted Auctions %s:"] = "Posted Auctions %s:"
--[[Translation missing --]]
TSM.L["Posting"] = "Posting"
--[[Translation missing --]]
TSM.L["Posting %d / %d"] = "Posting %d / %d"
--[[Translation missing --]]
TSM.L["Posting %d stack(s) of %d for %d hours."] = "Posting %d stack(s) of %d for %d hours."
--[[Translation missing --]]
TSM.L["Posting at normal price."] = "Posting at normal price."
--[[Translation missing --]]
TSM.L["Posting at whitelisted player's price."] = "Posting at whitelisted player's price."
--[[Translation missing --]]
TSM.L["Posting at your current price."] = "Posting at your current price."
--[[Translation missing --]]
TSM.L["Posting disabled."] = "Posting disabled."
--[[Translation missing --]]
TSM.L["Posting Settings"] = "Posting Settings"
--[[Translation missing --]]
TSM.L["Potential"] = "Potential"
--[[Translation missing --]]
TSM.L["Price Settings"] = "Price Settings"
--[[Translation missing --]]
TSM.L["PRICE SOURCE"] = "PRICE SOURCE"
--[[Translation missing --]]
TSM.L["Price source with name '%s' already exists."] = "Price source with name '%s' already exists."
--[[Translation missing --]]
TSM.L["Price Variables"] = "Price Variables"
--[[Translation missing --]]
TSM.L["Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."] = "Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."
--[[Translation missing --]]
TSM.L["PROFESSION"] = "PROFESSION"
--[[Translation missing --]]
TSM.L["Profession Filters"] = "Profession Filters"
--[[Translation missing --]]
TSM.L["Profession loading..."] = "Profession loading..."
--[[Translation missing --]]
TSM.L["Professions Used In"] = "Professions Used In"
--[[Translation missing --]]
TSM.L["Profile changed to '%s'."] = "Profile changed to '%s'."
TSM.L["Profiles"] = "Profils"
--[[Translation missing --]]
TSM.L["Profit"] = "Profit"
--[[Translation missing --]]
TSM.L["PROFIT"] = "PROFIT"
--[[Translation missing --]]
TSM.L["Profit Deduction"] = "Profit Deduction"
--[[Translation missing --]]
TSM.L["Profit, Craftable Quantity"] = "Profit, Craftable Quantity"
--[[Translation missing --]]
TSM.L["Prospect Value"] = "Prospect Value"
--[[Translation missing --]]
TSM.L["PURCHASE DATA"] = "PURCHASE DATA"
--[[Translation missing --]]
TSM.L["Purchased (Min/Avg/Max Price)"] = "Purchased (Min/Avg/Max Price)"
--[[Translation missing --]]
TSM.L["Purchased (Total Price)"] = "Purchased (Total Price)"
--[[Translation missing --]]
TSM.L["Purchases"] = "Purchases"
--[[Translation missing --]]
TSM.L["Qty"] = "Qty"
--[[Translation missing --]]
TSM.L["Quantity Bought:"] = "Quantity Bought:"
--[[Translation missing --]]
TSM.L["Quantity Sold:"] = "Quantity Sold:"
--[[Translation missing --]]
TSM.L["Quantity to move:"] = "Quantity to move:"
TSM.L["Quest Added"] = "Quête ajoutée"
TSM.L["Quest Completed"] = "Quête terminée"
--[[Translation missing --]]
TSM.L["Quest Objectives Complete"] = "Quest Objectives Complete"
--[[Translation missing --]]
TSM.L["QUEUE"] = "QUEUE"
--[[Translation missing --]]
TSM.L["Queue Sorting Method"] = "Queue Sorting Method"
--[[Translation missing --]]
TSM.L["Quick Sell"] = "Quick Sell"
--[[Translation missing --]]
TSM.L["Quick Sell Options"] = "Quick Sell Options"
--[[Translation missing --]]
TSM.L["Quickly mail all excess disenchantable items to a character"] = "Quickly mail all excess disenchantable items to a character"
--[[Translation missing --]]
TSM.L["Quickly mail all excess gold (limited to a certain amount) to a character"] = "Quickly mail all excess gold (limited to a certain amount) to a character"
TSM.L["Raid Warning"] = "Alerte de Raid"
--[[Translation missing --]]
TSM.L["Read More"] = "Read More"
--[[Translation missing --]]
TSM.L["Ready Check"] = "Ready Check"
--[[Translation missing --]]
TSM.L["Ready to Cancel"] = "Ready to Cancel"
--[[Translation missing --]]
TSM.L["Reagent Bank"] = "Reagent Bank"
--[[Translation missing --]]
TSM.L["Realm Data Tooltips"] = "Realm Data Tooltips"
TSM.L["Recent Scans"] = "Scans récents"
--[[Translation missing --]]
TSM.L["Recent Searches"] = "Recent Searches"
--[[Translation missing --]]
TSM.L["Recently Mailed"] = "Recently Mailed"
--[[Translation missing --]]
TSM.L["RECIPIENT"] = "RECIPIENT"
--[[Translation missing --]]
TSM.L["Region Avg Daily Sold"] = "Region Avg Daily Sold"
--[[Translation missing --]]
TSM.L["Region Data Tooltips"] = "Region Data Tooltips"
--[[Translation missing --]]
TSM.L["Region Historical Price"] = "Region Historical Price"
--[[Translation missing --]]
TSM.L["Region Market Value Avg"] = "Region Market Value Avg"
--[[Translation missing --]]
TSM.L["Region Min Buyout Avg"] = "Region Min Buyout Avg"
--[[Translation missing --]]
TSM.L["Region Sale Avg"] = "Region Sale Avg"
--[[Translation missing --]]
TSM.L["Region Sale Rate"] = "Region Sale Rate"
--[[Translation missing --]]
TSM.L["Reload"] = "Reload"
--[[Translation missing --]]
TSM.L["REMOVE %d ITEMS"] = "REMOVE %d ITEMS"
--[[Translation missing --]]
TSM.L["Removed a total of %s old records."] = "Removed a total of %s old records."
--[[Translation missing --]]
TSM.L["REPAIR"] = "REPAIR"
--[[Translation missing --]]
TSM.L["Repair Bill"] = "Repair Bill"
TSM.L["Replace"] = "Remplacer"
--[[Translation missing --]]
TSM.L["REPLY"] = "REPLY"
--[[Translation missing --]]
TSM.L["REPORT SPAM"] = "REPORT SPAM"
--[[Translation missing --]]
TSM.L["Repost Higher Threshold"] = "Repost Higher Threshold"
--[[Translation missing --]]
TSM.L["Required Level"] = "Required Level"
--[[Translation missing --]]
TSM.L["REQUIRED LEVEL RANGE"] = "REQUIRED LEVEL RANGE"
--[[Translation missing --]]
TSM.L["Requires TSM Desktop Application"] = "Requires TSM Desktop Application"
--[[Translation missing --]]
TSM.L["Resale"] = "Resale"
TSM.L["RESCAN"] = "RESCANNER"
--[[Translation missing --]]
TSM.L["RESET"] = "RESET"
--[[Translation missing --]]
TSM.L["Reset All"] = "Reset All"
--[[Translation missing --]]
TSM.L["Reset Filters"] = "Reset Filters"
--[[Translation missing --]]
TSM.L["Reset Profile Confirmation"] = "Reset Profile Confirmation"
--[[Translation missing --]]
TSM.L["RESTART"] = "RESTART"
--[[Translation missing --]]
TSM.L["Restart Delay (minutes)"] = "Restart Delay (minutes)"
--[[Translation missing --]]
TSM.L["RESTOCK BAGS"] = "RESTOCK BAGS"
--[[Translation missing --]]
TSM.L["Restock help for %s:"] = "Restock help for %s:"
--[[Translation missing --]]
TSM.L["Restock Quantity Settings"] = "Restock Quantity Settings"
--[[Translation missing --]]
TSM.L["Restock quantity:"] = "Restock quantity:"
--[[Translation missing --]]
TSM.L["RESTOCK SELECTED GROUPS"] = "RESTOCK SELECTED GROUPS"
--[[Translation missing --]]
TSM.L["Restock Settings"] = "Restock Settings"
--[[Translation missing --]]
TSM.L["Restock target to max quantity?"] = "Restock target to max quantity?"
--[[Translation missing --]]
TSM.L["Restocking to %d."] = "Restocking to %d."
--[[Translation missing --]]
TSM.L["Restocking to a max of %d (min of %d) with a min profit."] = "Restocking to a max of %d (min of %d) with a min profit."
--[[Translation missing --]]
TSM.L["Restocking to a max of %d (min of %d) with no min profit."] = "Restocking to a max of %d (min of %d) with no min profit."
--[[Translation missing --]]
TSM.L["RESTORE BAGS"] = "RESTORE BAGS"
--[[Translation missing --]]
TSM.L["Resume Scan"] = "Resume Scan"
--[[Translation missing --]]
TSM.L["Retrying %d auction(s) which failed."] = "Retrying %d auction(s) which failed."
--[[Translation missing --]]
TSM.L["Revenue"] = "Revenue"
--[[Translation missing --]]
TSM.L["Round normal price"] = "Round normal price"
--[[Translation missing --]]
TSM.L["RUN ADVANCED ITEM SEARCH"] = "RUN ADVANCED ITEM SEARCH"
--[[Translation missing --]]
TSM.L["Run Bid Sniper"] = "Run Bid Sniper"
--[[Translation missing --]]
TSM.L["Run Buyout Sniper"] = "Run Buyout Sniper"
--[[Translation missing --]]
TSM.L["RUN CANCEL SCAN"] = "RUN CANCEL SCAN"
--[[Translation missing --]]
TSM.L["RUN POST SCAN"] = "RUN POST SCAN"
--[[Translation missing --]]
TSM.L["RUN SHOPPING SCAN"] = "RUN SHOPPING SCAN"
--[[Translation missing --]]
TSM.L["Running Sniper Scan"] = "Running Sniper Scan"
--[[Translation missing --]]
TSM.L["Sale"] = "Sale"
--[[Translation missing --]]
TSM.L["SALE DATA"] = "SALE DATA"
--[[Translation missing --]]
TSM.L["Sale Rate"] = "Sale Rate"
--[[Translation missing --]]
TSM.L["Sales"] = "Sales"
--[[Translation missing --]]
TSM.L["SALES"] = "SALES"
--[[Translation missing --]]
TSM.L["Sales Summary"] = "Sales Summary"
TSM.L["SCAN ALL"] = "TOUT SCANNER"
--[[Translation missing --]]
TSM.L["Scan Complete Sound"] = "Scan Complete Sound"
--[[Translation missing --]]
TSM.L["Scan Paused"] = "Scan Paused"
TSM.L["SCANNING"] = "SCAN EN COURS"
--[[Translation missing --]]
TSM.L["Scanning %d / %d (Page %d / %d)"] = "Scanning %d / %d (Page %d / %d)"
--[[Translation missing --]]
TSM.L["Scroll wheel direction:"] = "Scroll wheel direction:"
--[[Translation missing --]]
TSM.L["Search"] = "Search"
--[[Translation missing --]]
TSM.L["Search Bags"] = "Search Bags"
--[[Translation missing --]]
TSM.L["Search for Item"] = "Search for Item"
TSM.L["Search Groups"] = "Chercher les groupes"
--[[Translation missing --]]
TSM.L["Search Inbox"] = "Search Inbox"
--[[Translation missing --]]
TSM.L["Search Operations"] = "Search Operations"
--[[Translation missing --]]
TSM.L["Search Patterns"] = "Search Patterns"
--[[Translation missing --]]
TSM.L["Search Usable Items Only?"] = "Search Usable Items Only?"
--[[Translation missing --]]
TSM.L["Search Vendor"] = "Search Vendor"
--[[Translation missing --]]
TSM.L["Select a Source"] = "Select a Source"
--[[Translation missing --]]
TSM.L["Select Action"] = "Select Action"
TSM.L["Select All Groups"] = "Sélectionner tous les groupes"
--[[Translation missing --]]
TSM.L["Select All Items"] = "Select All Items"
--[[Translation missing --]]
TSM.L["Select Auction to Cancel"] = "Select Auction to Cancel"
--[[Translation missing --]]
TSM.L["Select crafter"] = "Select crafter"
--[[Translation missing --]]
TSM.L["Select custom price sources to include in item tooltips"] = "Select custom price sources to include in item tooltips"
--[[Translation missing --]]
TSM.L["Select Duration"] = "Select Duration"
--[[Translation missing --]]
TSM.L["Select Items to Add"] = "Select Items to Add"
--[[Translation missing --]]
TSM.L["Select Items to Remove"] = "Select Items to Remove"
--[[Translation missing --]]
TSM.L["Select Operation"] = "Select Operation"
--[[Translation missing --]]
TSM.L["Select professions"] = "Select professions"
--[[Translation missing --]]
TSM.L["Select which accounting information to display in item tooltips."] = "Select which accounting information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which auctioning information to display in item tooltips."] = "Select which auctioning information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which crafting information to display in item tooltips."] = "Select which crafting information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which destroying information to display in item tooltips."] = "Select which destroying information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which shopping information to display in item tooltips."] = "Select which shopping information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Selected Groups"] = "Selected Groups"
--[[Translation missing --]]
TSM.L["SELECTED ITEM"] = "SELECTED ITEM"
--[[Translation missing --]]
TSM.L["Selected Operations"] = "Selected Operations"
--[[Translation missing --]]
TSM.L["Sell"] = "Sell"
--[[Translation missing --]]
TSM.L["SELL ALL"] = "SELL ALL"
--[[Translation missing --]]
TSM.L["SELL BOES"] = "SELL BOES"
--[[Translation missing --]]
TSM.L["SELL GROUPS"] = "SELL GROUPS"
--[[Translation missing --]]
TSM.L["Sell Options"] = "Sell Options"
--[[Translation missing --]]
TSM.L["Sell soulbound items?"] = "Sell soulbound items?"
TSM.L["Sell to Vendor"] = "Vendre au vendeur"
--[[Translation missing --]]
TSM.L["SELL TRASH"] = "SELL TRASH"
--[[Translation missing --]]
TSM.L["Seller"] = "Seller"
--[[Translation missing --]]
TSM.L["Selling soulbound items."] = "Selling soulbound items."
--[[Translation missing --]]
TSM.L["Send"] = "Send"
--[[Translation missing --]]
TSM.L["SEND DISENCHANTABLES"] = "SEND DISENCHANTABLES"
--[[Translation missing --]]
TSM.L["Send Excess Gold to Banker"] = "Send Excess Gold to Banker"
--[[Translation missing --]]
TSM.L["SEND GOLD"] = "SEND GOLD"
--[[Translation missing --]]
TSM.L["Send grouped items individually"] = "Send grouped items individually"
--[[Translation missing --]]
TSM.L["SEND MAIL"] = "SEND MAIL"
--[[Translation missing --]]
TSM.L["Send Money"] = "Send Money"
--[[Translation missing --]]
TSM.L["SENDING"] = "SENDING"
--[[Translation missing --]]
TSM.L["Sending %s individually to %s"] = "Sending %s individually to %s"
--[[Translation missing --]]
TSM.L["Sending %s to %s"] = "Sending %s to %s"
--[[Translation missing --]]
TSM.L["Sending %s to %s with a COD of %s"] = "Sending %s to %s with a COD of %s"
--[[Translation missing --]]
TSM.L["Sending Settings"] = "Sending Settings"
--[[Translation missing --]]
TSM.L["SENDING..."] = "SENDING..."
--[[Translation missing --]]
TSM.L["Set auction duration to:"] = "Set auction duration to:"
--[[Translation missing --]]
TSM.L["Set bid as percentage of buyout:"] = "Set bid as percentage of buyout:"
--[[Translation missing --]]
TSM.L["Set keep in bags quantity?"] = "Set keep in bags quantity?"
--[[Translation missing --]]
TSM.L["Set keep in bank quantity?"] = "Set keep in bank quantity?"
--[[Translation missing --]]
TSM.L["Set Maximum Price:"] = "Set Maximum Price:"
--[[Translation missing --]]
TSM.L["Set maximum quantity?"] = "Set maximum quantity?"
--[[Translation missing --]]
TSM.L["Set Minimum Price:"] = "Set Minimum Price:"
--[[Translation missing --]]
TSM.L["Set minimum profit?"] = "Set minimum profit?"
--[[Translation missing --]]
TSM.L["Set move quantity?"] = "Set move quantity?"
--[[Translation missing --]]
TSM.L["Set Normal Price:"] = "Set Normal Price:"
--[[Translation missing --]]
TSM.L["Set post cap to:"] = "Set post cap to:"
--[[Translation missing --]]
TSM.L["Set posted stack size to:"] = "Set posted stack size to:"
--[[Translation missing --]]
TSM.L["Set stack size for bags?"] = "Set stack size for bags?"
--[[Translation missing --]]
TSM.L["Setup"] = "Setup"
--[[Translation missing --]]
TSM.L["SETUP ACCOUNT SYNC"] = "SETUP ACCOUNT SYNC"
TSM.L["Shards"] = "Eclats"
--[[Translation missing --]]
TSM.L["Shopping"] = "Shopping"
--[[Translation missing --]]
TSM.L["Shopping 'BUYOUT' Button"] = "Shopping 'BUYOUT' Button"
--[[Translation missing --]]
TSM.L["Shopping for auctions including those above the max price."] = "Shopping for auctions including those above the max price."
--[[Translation missing --]]
TSM.L["Shopping for auctions with a max price set."] = "Shopping for auctions with a max price set."
--[[Translation missing --]]
TSM.L["Shopping for even stacks including those above the max price"] = "Shopping for even stacks including those above the max price"
--[[Translation missing --]]
TSM.L["Shopping for even stacks with a max price set."] = "Shopping for even stacks with a max price set."
--[[Translation missing --]]
TSM.L["Shopping Tooltips"] = "Shopping Tooltips"
--[[Translation missing --]]
TSM.L["SHORTFALL TO BAGS"] = "SHORTFALL TO BAGS"
--[[Translation missing --]]
TSM.L["Show auctions above max price?"] = "Show auctions above max price?"
--[[Translation missing --]]
TSM.L["Show Description"] = "Show Description"
--[[Translation missing --]]
TSM.L["Show Destroying frame automatically"] = "Show Destroying frame automatically"
--[[Translation missing --]]
TSM.L["Show material cost"] = "Show material cost"
--[[Translation missing --]]
TSM.L["Show on Modifier"] = "Show on Modifier"
--[[Translation missing --]]
TSM.L["Showing %d Mail"] = "Showing %d Mail"
--[[Translation missing --]]
TSM.L["Showing %d of %d Mail"] = "Showing %d of %d Mail"
--[[Translation missing --]]
TSM.L["Showing %d of %d Mails"] = "Showing %d of %d Mails"
--[[Translation missing --]]
TSM.L["Showing all %d Mails"] = "Showing all %d Mails"
TSM.L["Simple"] = "Simple"
--[[Translation missing --]]
TSM.L["SKIP"] = "SKIP"
--[[Translation missing --]]
TSM.L["Skip Import / Export confirmations?"] = "Skip Import / Export confirmations?"
--[[Translation missing --]]
TSM.L["Skipped: No assigned operation"] = "Skipped: No assigned operation"
TSM.L["Slash Commands:"] = "Commandes Slash : "
--[[Translation missing --]]
TSM.L["Sniper 'BUYOUT' Button"] = "Sniper 'BUYOUT' Button"
--[[Translation missing --]]
TSM.L["Sniper Options"] = "Sniper Options"
--[[Translation missing --]]
TSM.L["Sniper Settings"] = "Sniper Settings"
--[[Translation missing --]]
TSM.L["Sniping items below a max price"] = "Sniping items below a max price"
--[[Translation missing --]]
TSM.L["Sold"] = "Sold"
--[[Translation missing --]]
TSM.L["Sold %s worth of items."] = "Sold %s worth of items."
--[[Translation missing --]]
TSM.L["Sold (Min/Avg/Max Price)"] = "Sold (Min/Avg/Max Price)"
--[[Translation missing --]]
TSM.L["Sold (Total Price)"] = "Sold (Total Price)"
--[[Translation missing --]]
TSM.L["Sold [%s]x%d for %s to %s"] = "Sold [%s]x%d for %s to %s"
--[[Translation missing --]]
TSM.L["Sold Auctions %s:"] = "Sold Auctions %s:"
--[[Translation missing --]]
TSM.L["Source"] = "Source"
--[[Translation missing --]]
TSM.L["SOURCE %d"] = "SOURCE %d"
--[[Translation missing --]]
TSM.L["SOURCES"] = "SOURCES"
TSM.L["Sources"] = "Sources"
--[[Translation missing --]]
TSM.L["Sources to include for restock:"] = "Sources to include for restock:"
--[[Translation missing --]]
TSM.L["Stack"] = "Stack"
--[[Translation missing --]]
TSM.L["Stack / Quantity"] = "Stack / Quantity"
--[[Translation missing --]]
TSM.L["Stack size multiple:"] = "Stack size multiple:"
--[[Translation missing --]]
TSM.L["Start either a 'Buyout' or 'Bid' sniper using the buttons above."] = "Start either a 'Buyout' or 'Bid' sniper using the buttons above."
TSM.L["Starting Scan..."] = "Début du scan ..."
--[[Translation missing --]]
TSM.L["STOP"] = "STOP"
--[[Translation missing --]]
TSM.L["Store operations globally"] = "Store operations globally"
--[[Translation missing --]]
TSM.L["Subject"] = "Subject"
--[[Translation missing --]]
TSM.L["SUBJECT"] = "SUBJECT"
--[[Translation missing --]]
TSM.L["Switch to %s"] = "Switch to %s"
TSM.L["Switch to WoW UI"] = "Revenir sur l'IU de WoW"
--[[Translation missing --]]
TSM.L["Sync Setup Error: The specified player on the other account is not currently online."] = "Sync Setup Error: The specified player on the other account is not currently online."
--[[Translation missing --]]
TSM.L["Sync Setup Error: This character is already part of a known account."] = "Sync Setup Error: This character is already part of a known account."
--[[Translation missing --]]
TSM.L["Sync Setup Error: You entered the name of the current character and not the character on the other account."] = "Sync Setup Error: You entered the name of the current character and not the character on the other account."
--[[Translation missing --]]
TSM.L["TAKE ALL"] = "TAKE ALL"
--[[Translation missing --]]
TSM.L["Take Attachments"] = "Take Attachments"
--[[Translation missing --]]
TSM.L["Target Character"] = "Target Character"
--[[Translation missing --]]
TSM.L["TARGET SHORTFALL TO BAGS"] = "TARGET SHORTFALL TO BAGS"
--[[Translation missing --]]
TSM.L["Tasks Added to Task List"] = "Tasks Added to Task List"
TSM.L["Text (%s)"] = "Texte (%s) "
--[[Translation missing --]]
TSM.L["The canlearn filter was ignored because the CanIMogIt addon was not found."] = "The canlearn filter was ignored because the CanIMogIt addon was not found."
--[[Translation missing --]]
TSM.L["The 'Craft Value Method' (%s) did not return a value for this item."] = "The 'Craft Value Method' (%s) did not return a value for this item."
--[[Translation missing --]]
TSM.L["The 'disenchant' price source has been replaced by the more general 'destroy' price source. Please update your custom prices."] = "The 'disenchant' price source has been replaced by the more general 'destroy' price source. Please update your custom prices."
--[[Translation missing --]]
TSM.L["The min profit (%s) did not evalulate to a valid value for this item."] = "The min profit (%s) did not evalulate to a valid value for this item."
--[[Translation missing --]]
TSM.L["The name can ONLY contain letters. No spaces, numbers, or special characters."] = "The name can ONLY contain letters. No spaces, numbers, or special characters."
--[[Translation missing --]]
TSM.L["The number which would be queued (%d) is less than the min restock quantity (%d)."] = "The number which would be queued (%d) is less than the min restock quantity (%d)."
--[[Translation missing --]]
TSM.L["The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."] = "The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."
--[[Translation missing --]]
TSM.L["The player \"%s\" is already on your whitelist."] = "The player \"%s\" is already on your whitelist."
--[[Translation missing --]]
TSM.L["The profit of this item (%s) is below the min profit (%s)."] = "The profit of this item (%s) is below the min profit (%s)."
--[[Translation missing --]]
TSM.L["The seller name of the lowest auction for %s was not given by the server. Skipping this item."] = "The seller name of the lowest auction for %s was not given by the server. Skipping this item."
--[[Translation missing --]]
TSM.L["The TradeSkillMaster_AppHelper addon is not enabled and is required for proper operation of TSM. TSM has enabled it and requires a reload."] = "The TradeSkillMaster_AppHelper addon is not enabled and is required for proper operation of TSM. TSM has enabled it and requires a reload."
--[[Translation missing --]]
TSM.L["The TradeSkillMaster_AppHelper addon is not installed and is required for proper operation of TSM."] = "The TradeSkillMaster_AppHelper addon is not installed and is required for proper operation of TSM."
--[[Translation missing --]]
TSM.L["The unlearned filter was ignored because the CanIMogIt addon was not found."] = "The unlearned filter was ignored because the CanIMogIt addon was not found."
--[[Translation missing --]]
TSM.L["There is a crafting cost and crafted item value, but TSM_Crafting wasn't able to calculate a profit. This shouldn't happen!"] = "There is a crafting cost and crafted item value, but TSM_Crafting wasn't able to calculate a profit. This shouldn't happen!"
--[[Translation missing --]]
TSM.L["There is no TSM_Crafting operation applied to this item's TSM group (%s)."] = "There is no TSM_Crafting operation applied to this item's TSM group (%s)."
--[[Translation missing --]]
TSM.L["This group already has operations. Would you like to add another one or replace the last one?"] = "This group already has operations. Would you like to add another one or replace the last one?"
--[[Translation missing --]]
TSM.L["This group already has the max number of operation. Would you like to replace the last one?"] = "This group already has the max number of operation. Would you like to replace the last one?"
--[[Translation missing --]]
TSM.L["This is not a valid profile name. Profile names must be at least one character long and may not contain '@' characters."] = "This is not a valid profile name. Profile names must be at least one character long and may not contain '@' characters."
--[[Translation missing --]]
TSM.L["This item does not have a crafting cost. Check that all of its mats have mat prices."] = "This item does not have a crafting cost. Check that all of its mats have mat prices."
--[[Translation missing --]]
TSM.L["This item is not in a TSM group."] = "This item is not in a TSM group."
--[[Translation missing --]]
TSM.L["This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general TSM_Crafting options."] = "This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general TSM_Crafting options."
--[[Translation missing --]]
TSM.L["This looks like an exported operation and not a custom price."] = "This looks like an exported operation and not a custom price."
--[[Translation missing --]]
TSM.L["This will copy the settings from '%s' into your currently-active one."] = "This will copy the settings from '%s' into your currently-active one."
--[[Translation missing --]]
TSM.L["This will permanently delete the '%s' profile."] = "This will permanently delete the '%s' profile."
--[[Translation missing --]]
TSM.L["This will reset all groups and operations (if not stored globally) to be wiped from this profile."] = "This will reset all groups and operations (if not stored globally) to be wiped from this profile."
--[[Translation missing --]]
TSM.L["Time"] = "Time"
--[[Translation missing --]]
TSM.L["Time Format"] = "Time Format"
--[[Translation missing --]]
TSM.L["Time Frame"] = "Time Frame"
--[[Translation missing --]]
TSM.L["TIME FRAME"] = "TIME FRAME"
--[[Translation missing --]]
TSM.L["TINKER"] = "TINKER"
TSM.L["Tooltip Price Format"] = "Format du prix dans l'info-bulle"
TSM.L["Tooltip Settings"] = "Paramètre de l'info-bulle"
TSM.L["Top Buyers:"] = "Top acheteurs : "
--[[Translation missing --]]
TSM.L["Top Item:"] = "Top Item:"
TSM.L["Top Sellers:"] = "Top vendeurs :"
TSM.L["Total"] = "Total"
TSM.L["Total Gold"] = "Total d'Or"
TSM.L["Total Gold Earned:"] = "Total d'Or gagnés :"
TSM.L["Total Gold Spent:"] = "Total d'Or dépensés :"
TSM.L["Total Price"] = "Prix total"
TSM.L["Total Profit:"] = "Profit total : "
TSM.L["Total Value"] = "Valeur totale"
--[[Translation missing --]]
TSM.L["Total Value of All Items: "] = "Total Value of All Items: "
--[[Translation missing --]]
TSM.L["Track Sales / Purchases via trade"] = "Track Sales / Purchases via trade"
--[[Translation missing --]]
TSM.L["TradeSkillMaster Info"] = "TradeSkillMaster Info"
--[[Translation missing --]]
TSM.L["Transform Value"] = "Transform Value"
--[[Translation missing --]]
TSM.L["TSM Banking"] = "TSM Banking"
--[[Translation missing --]]
TSM.L["TSM can sync data automatically between multiple accounts."] = "TSM can sync data automatically between multiple accounts."
--[[Translation missing --]]
TSM.L["TSM Crafting"] = "TSM Crafting"
--[[Translation missing --]]
TSM.L["TSM Destroying"] = "TSM Destroying"
TSM.L["TSM failed to scan some auctions. Please rerun the scan."] = "TSM a échoué à scanner quelques ventes. Veuillez relancer le scan."
--[[Translation missing --]]
TSM.L["TSM Groups"] = "TSM Groups"
TSM.L["TSM is missing important information from the TSM Desktop Application. Please ensure the TSM Desktop Application is running and is properly configured."] = [=[TSM ne parvient pas à accéder à d'importantes informations de l'application de bureau TSM Desktop.
Assurez-vous s'il vous plaît que TSM Desktop fonctionne et soit correctement configuré.]=]
--[[Translation missing --]]
TSM.L["TSM Mailing"] = "TSM Mailing"
--[[Translation missing --]]
TSM.L["TSM TASK LIST"] = "TSM TASK LIST"
--[[Translation missing --]]
TSM.L["TSM Vendoring"] = "TSM Vendoring"
TSM.L["TSM Version Info:"] = "Informations sur la version de TSM :"
--[[Translation missing --]]
TSM.L["TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"] = "TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"
--[[Translation missing --]]
TSM.L["TSM4"] = "TSM4"
--[[Translation missing --]]
TSM.L["TUJ 3-Day Price"] = "TUJ 3-Day Price"
TSM.L["Twitter Integration"] = "Intégration Twitter"
TSM.L["Twitter Integration Not Enabled"] = "Intégration Twitter désactivée"
--[[Translation missing --]]
TSM.L["Type"] = "Type"
--[[Translation missing --]]
TSM.L["Type Something"] = "Type Something"
--[[Translation missing --]]
TSM.L["Unbalanced parentheses."] = "Unbalanced parentheses."
--[[Translation missing --]]
TSM.L["Undercut amount:"] = "Undercut amount:"
--[[Translation missing --]]
TSM.L["Undercut by whitelisted player."] = "Undercut by whitelisted player."
--[[Translation missing --]]
TSM.L["Undercutting blacklisted player."] = "Undercutting blacklisted player."
--[[Translation missing --]]
TSM.L["Undercutting competition."] = "Undercutting competition."
TSM.L["Ungrouped Items"] = "Objets non-groupés"
--[[Translation missing --]]
TSM.L["Unknown Item"] = "Unknown Item"
--[[Translation missing --]]
TSM.L["Unwrap Gift"] = "Unwrap Gift"
--[[Translation missing --]]
TSM.L["Up"] = "Up"
TSM.L["UPDATE EXISTING MACRO"] = "METTRE A JOUR LA MACRO EXISTANTE"
TSM.L["Usage: /tsm price <ItemLink> <Price String>"] = "Conseil d'utilisation: /tsm price <ItemLink> <Price String>"
--[[Translation missing --]]
TSM.L["Use smart average for purchase price"] = "Use smart average for purchase price"
--[[Translation missing --]]
TSM.L["Use the field below to search the auction house by filter"] = "Use the field below to search the auction house by filter"
--[[Translation missing --]]
TSM.L["Use the list to the left to select groups, & operations you'd like to create export strings for."] = "Use the list to the left to select groups, & operations you'd like to create export strings for."
--[[Translation missing --]]
TSM.L["VALUE PRICE SOURCE"] = "VALUE PRICE SOURCE"
--[[Translation missing --]]
TSM.L["ValueSources"] = "ValueSources"
--[[Translation missing --]]
TSM.L["Variable Name"] = "Variable Name"
TSM.L["Vendor"] = "Vendeur"
TSM.L["Vendor Buy Price"] = "Prix d'achat au vendeur"
--[[Translation missing --]]
TSM.L["Vendor Search"] = "Vendor Search"
--[[Translation missing --]]
TSM.L["VENDOR SEARCH"] = "VENDOR SEARCH"
TSM.L["Vendor Sell"] = "vendre au marchant"
TSM.L["Vendor Sell Price"] = "Prix de vente au marchant"
--[[Translation missing --]]
TSM.L["Vendoring 'SELL ALL' Button"] = "Vendoring 'SELL ALL' Button"
--[[Translation missing --]]
TSM.L["View ignored items in the Destroying options."] = "View ignored items in the Destroying options."
--[[Translation missing --]]
TSM.L["Warehousing"] = "Warehousing"
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group."] = "Warehousing will move a max of %d of each item in this group."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group."] = "Warehousing will move all of the items in this group."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."
TSM.L["WARNING: The macro was too long, so was truncated to fit by WoW."] = "ATTENTION : La macro est trop longue, elle a donc été tronquée par défaut par WoW"
TSM.L["WARNING: You minimum price for %s is below its vendorsell price (with AH cut taken into account). Consider raising your minimum price, or vendoring the item."] = "ATTENTION : Votre prix minimum pour %s est en dessous du prix de vente au marchant (frais de dépot inclus). Envisagez d'augmenter votre prix minimum, ou vendez l'objet."
TSM.L["When above maximum:"] = "Lorsqu'au-dessus du maximum :"
TSM.L["When below minimum:"] = "Lorsqu'en-dessous du minimum :"
TSM.L["Whitelist"] = "Liste blanche"
--[[Translation missing --]]
TSM.L["Whitelisted Players"] = "Whitelisted Players"
--[[Translation missing --]]
TSM.L["You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"] = "You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"
--[[Translation missing --]]
TSM.L["You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."] = "You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."
TSM.L["You cannot use %s as part of this custom price."] = "Vous ne pouvez pas utiliser %s comme prix spécifique."
--[[Translation missing --]]
TSM.L["You cannot use %s within convert() as part of this custom price."] = "You cannot use %s within convert() as part of this custom price."
--[[Translation missing --]]
TSM.L["You do not need to add \"%s\", alts are whitelisted automatically."] = "You do not need to add \"%s\", alts are whitelisted automatically."
TSM.L["You don't know how to craft this item."] = "Vous ne savez pas fabriquer cet objet."
TSM.L["You must reload your UI for these settings to take effect. Reload now?"] = "Vous devez recharger votre UI pour que ces paramètres soient pris en compte. Recharger maintenant ?"
TSM.L["You won an auction for %sx%d for %s"] = "Vous avez gagné une enchère pour %sx%d pour %s"
--[[Translation missing --]]
TSM.L["Your auction has not been undercut."] = "Your auction has not been undercut."
TSM.L["Your auction of %s expired"] = "Votre mise aux enchères de %s est expirée."
TSM.L["Your auction of %s has sold for %s!"] = "Votre mise aux enchères de %s a été vendue pour %s !"
--[[Translation missing --]]
TSM.L["Your Buyout"] = "Your Buyout"
--[[Translation missing --]]
TSM.L["Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"] = "Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"
--[[Translation missing --]]
TSM.L["Your default craft value method was invalid so it has been returned to the default. Details: %s"] = "Your default craft value method was invalid so it has been returned to the default. Details: %s"
TSM.L["Your task list is currently empty."] = "Votre liste de tâche est actuellement vide."
--[[Translation missing --]]
TSM.L["You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."] = "You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."
--[[Translation missing --]]
TSM.L["You've been undercut."] = "You've been undercut."
--[[Translation missing --]]
TSM.L["YY/MM/DD HH:MM"] = "YY/MM/DD HH:MM"
	elseif locale == "itIT" then
TSM.L = TSM.L or {}
TSM.L["%d |4Group:Groups; Selected (%d |4Item:Items;)"] = "%d |4Gruppo:Gruppi; Selezionati (%d |4Oggetto:Oggetti;)"
TSM.L["%d auctions"] = "%d aste"
TSM.L["%d Groups"] = [=[%d Gruppi
]=]
TSM.L["%d Items"] = "%d Oggetti"
TSM.L["%d of %d"] = "%d di %d"
TSM.L["%d Operations"] = "%d Operazioni"
TSM.L["%d Posted Auctions"] = "%d Aste Pubblicate"
TSM.L["%d Sold Auctions"] = "%d Aste Vendute"
TSM.L["%s (%s bags, %s bank, %s AH, %s mail)"] = "%s (%s borse, %s banca, %s CdA, %s posta)"
TSM.L["%s (%s player, %s alts, %s guild, %s AH)"] = "%s (%s giocatore, %s alts, %s gilda, %s CdA)"
TSM.L["%s (%s profit)"] = "%s (%s profitto)"
TSM.L["%s ago"] = "%s fa"
--[[Translation missing --]]
TSM.L["%s Crafts"] = "%s Crafts"
TSM.L["%s in guild vault"] = "%s nella banca di gilda"
TSM.L["%s is a valid custom price but %s is an invalid item."] = "%s è un valido prezzo personalizzato ma %s non è un oggetto valido."
TSM.L["%s is a valid custom price but did not give a value for %s."] = "%s è un valido prezzo personalizzato ma non ha dato un valore per %s."
--[[Translation missing --]]
TSM.L["'%s' is an invalid operation! Min restock of %d is higher than max restock of %d."] = "'%s' is an invalid operation! Min restock of %d is higher than max restock of %d."
TSM.L["%s is not a valid custom price and gave the following error: %s"] = "%s non è un valido prezzo personalizzato ed ha restituito il seguente errore: %s"
TSM.L["%s operation(s)"] = "%s operazione(i)"
TSM.L["%s removed."] = "%s rimosso."
TSM.L["%s sent you %s"] = "%s ti ha mandato %s"
TSM.L["%s sent you %s and %s"] = "%s ti ha mandato %s e %s"
TSM.L["%s sent you a COD of %s for %s"] = "%s ti ha mandato un PAC di %s per %s"
TSM.L["%s sent you a message: %s"] = "%s ti ha inviato un messaggio: %s"
TSM.L["%s total"] = "%s totale"
TSM.L["%sDrag%s to move this button"] = "%sTrascina%s per spostare questo pulsante"
TSM.L["%sLeft-Click%s to open the main window"] = "%sClic-Sinistro%s per aprire la finestra principale"
TSM.L["(%d/500 Characters)"] = "(%d/500 Caratteri)"
TSM.L["(max %d)"] = "(max %d)"
TSM.L["(max 200)"] = "(max 200)"
TSM.L["(max 5000)"] = "(max 5000)"
TSM.L["(min %d - max %d)"] = "(min %d - max %d)"
TSM.L["(min 0 - max 10000)"] = "(min 0 - max 10000)"
TSM.L["(minimum 0 - maximum 2)"] = "(mimimo 0 - massimo 2)"
TSM.L["(minimum 0 - maximum 20)"] = "(minimo 0 - massimo 20)"
TSM.L["(minimum 0 - maximum 2000)"] = [=[(minimo 0 - massimo 2000)
]=]
TSM.L["(minimum 0 - maximum 30)"] = [=[(minimo 0 - massimo 30)
]=]
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 905)"] = "(minimum 0 - maximum 905)"
TSM.L["(minimum 0% - maximum 50%)"] = [=[(minimo 0% - massimo 50%)
]=]
TSM.L["(minimum 0.5 - maximum 10)"] = [=[(minimo 0.5 - massimo 10)
]=]
TSM.L["(minimum 1 - maximum 100)"] = [=[(minimo 1 - massimo 100)
]=]
TSM.L["(minimum 8 - maximum 25)"] = [=[(minimo 8 - massimo 25)
]=]
TSM.L["(New group(s) will be created)"] = "(Verranno creati nuovi gruppi)"
TSM.L["/tsm help|r - Shows this help listing"] = "/tsm help|r - Mostra questa lista d'aiuto"
TSM.L["/tsm|r - opens the main TSM window."] = "/tsm|r - apre la finestra principale di TSM"
TSM.L["_ Hr _ Min ago"] = "_ h _ min fa"
--[[Translation missing --]]
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."] = "|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."
--[[Translation missing --]]
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."] = "|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."
--[[Translation missing --]]
TSM.L["|cffff0000WARNING:|r TSM_AuctionDB doesn't currently have any pricing data for your realm. Either download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update TSM_AuctionDB's data, or run a manual scan in-game."] = "|cffff0000WARNING:|r TSM_AuctionDB doesn't currently have any pricing data for your realm. Either download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update TSM_AuctionDB's data, or run a manual scan in-game."
--[[Translation missing --]]
TSM.L["|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."] = "|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."
--[[Translation missing --]]
TSM.L["|cffffd839Left-Click|r to ignore an item this session."] = "|cffffd839Left-Click|r to ignore an item this session."
--[[Translation missing --]]
TSM.L["|cffffd839Shift-Left-Click|r to ignore it permanently."] = "|cffffd839Shift-Left-Click|r to ignore it permanently."
TSM.L["1 Group"] = "1 Gruppo"
TSM.L["1 Item"] = "1 Oggetto"
TSM.L["12 hr"] = "12 h"
TSM.L["24 hr"] = "24 h"
TSM.L["48 hr"] = "48 h"
TSM.L["A custom price of %s for %s evaluates to %s."] = "Un prezzo personalizzato di %s per %s valutati in %s."
TSM.L["A maximum of 1 convert() function is allowed."] = "Un massimo di una funzione convert() è consentita."
--[[Translation missing --]]
TSM.L["A scan is already in progress. Please stop that scan before starting another one."] = "A scan is already in progress. Please stop that scan before starting another one."
--[[Translation missing --]]
TSM.L["Above max expires."] = "Above max expires."
--[[Translation missing --]]
TSM.L["Above max price. Not posting."] = "Above max price. Not posting."
--[[Translation missing --]]
TSM.L["Above max price. Posting at max price."] = "Above max price. Posting at max price."
--[[Translation missing --]]
TSM.L["Above max price. Posting at min price."] = "Above max price. Posting at min price."
--[[Translation missing --]]
TSM.L["Above max price. Posting at normal price."] = "Above max price. Posting at normal price."
--[[Translation missing --]]
TSM.L["Accepting these item(s) will cost"] = "Accepting these item(s) will cost"
--[[Translation missing --]]
TSM.L["Accepting this item will cost"] = "Accepting this item will cost"
--[[Translation missing --]]
TSM.L["Account sync removed. Please delete the account sync from the other account as well."] = "Account sync removed. Please delete the account sync from the other account as well."
TSM.L["Account Syncing"] = "Sincronizzazione Account"
--[[Translation missing --]]
TSM.L["Accounting"] = "Accounting"
--[[Translation missing --]]
TSM.L["Accounting Tooltips"] = "Accounting Tooltips"
--[[Translation missing --]]
TSM.L["Activity Type"] = "Activity Type"
--[[Translation missing --]]
TSM.L["ADD %d ITEMS"] = "ADD %d ITEMS"
--[[Translation missing --]]
TSM.L["Add / Remove Items"] = "Add / Remove Items"
--[[Translation missing --]]
TSM.L["ADD NEW CUSTOM PRICE SOURCE"] = "ADD NEW CUSTOM PRICE SOURCE"
--[[Translation missing --]]
TSM.L["ADD OPERATION"] = "ADD OPERATION"
--[[Translation missing --]]
TSM.L["Add Player"] = "Add Player"
--[[Translation missing --]]
TSM.L["Add Subject / Description"] = "Add Subject / Description"
--[[Translation missing --]]
TSM.L["Add Subject / Description (Optional)"] = "Add Subject / Description (Optional)"
--[[Translation missing --]]
TSM.L["ADD TO MAIL"] = "ADD TO MAIL"
TSM.L["Additional error suppressed"] = "Errore addizionale soppresso"
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be auctioned."] = "Adjust the settings below to set how groups attached to this operation will be auctioned."
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be cancelled."] = "Adjust the settings below to set how groups attached to this operation will be cancelled."
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be priced."] = "Adjust the settings below to set how groups attached to this operation will be priced."
--[[Translation missing --]]
TSM.L["Advanced Item Search"] = "Advanced Item Search"
--[[Translation missing --]]
TSM.L["Advanced Options"] = "Advanced Options"
TSM.L["AH"] = "CdA"
--[[Translation missing --]]
TSM.L["AH (Crafting)"] = "AH (Crafting)"
--[[Translation missing --]]
TSM.L["AH (Disenchanting)"] = "AH (Disenchanting)"
--[[Translation missing --]]
TSM.L["AH BUSY"] = "AH BUSY"
--[[Translation missing --]]
TSM.L["AH Frame Options"] = "AH Frame Options"
--[[Translation missing --]]
TSM.L["AH Rows Shown (requires reload)"] = "AH Rows Shown (requires reload)"
TSM.L["Alarm Clock"] = "Sveglia"
--[[Translation missing --]]
TSM.L["All Auctions"] = "All Auctions"
--[[Translation missing --]]
TSM.L["All Characters and Guilds"] = "All Characters and Guilds"
--[[Translation missing --]]
TSM.L["All Professions"] = "All Professions"
--[[Translation missing --]]
TSM.L["Allow partial stack?"] = "Allow partial stack?"
--[[Translation missing --]]
TSM.L["Alt Guild Bank"] = "Alt Guild Bank"
--[[Translation missing --]]
TSM.L["Alts"] = "Alts"
--[[Translation missing --]]
TSM.L["Alts AH"] = "Alts AH"
--[[Translation missing --]]
TSM.L["Amount"] = "Amount"
--[[Translation missing --]]
TSM.L["AMOUNT"] = "AMOUNT"
--[[Translation missing --]]
TSM.L["Amount of Bag Space to Keep Free"] = "Amount of Bag Space to Keep Free"
TSM.L["Applied %s to %s."] = "Applica %s a %s"
--[[Translation missing --]]
TSM.L["APPLY FILTERS"] = "APPLY FILTERS"
--[[Translation missing --]]
TSM.L["Apply operation to group:"] = "Apply operation to group:"
--[[Translation missing --]]
TSM.L["Are you sure you want to clear old accounting data?"] = "Are you sure you want to clear old accounting data?"
TSM.L["Are you sure you want to delete this group?"] = "Sei sicuro di voler eliminare questo gruppo?"
TSM.L["Are you sure you want to delete this operation?"] = "Sei sicuro di voler eliminare questa operazione?"
--[[Translation missing --]]
TSM.L["Are you sure you want to reset all operation settings?"] = "Are you sure you want to reset all operation settings?"
--[[Translation missing --]]
TSM.L["At above max price and not undercut."] = "At above max price and not undercut."
--[[Translation missing --]]
TSM.L["At normal price and not undercut."] = "At normal price and not undercut."
--[[Translation missing --]]
TSM.L["Auction"] = "Auction"
--[[Translation missing --]]
TSM.L["AUCTION DETAILS"] = "AUCTION DETAILS"
--[[Translation missing --]]
TSM.L["Auction Duration"] = "Auction Duration"
--[[Translation missing --]]
TSM.L["Auction has been bid on."] = "Auction has been bid on."
--[[Translation missing --]]
TSM.L["Auction Window Close"] = "Auction Window Close"
--[[Translation missing --]]
TSM.L["Auction Window Open"] = "Auction Window Open"
TSM.L["Auctionator - Auction Value"] = "Auctionator - Valore d'Asta"
TSM.L["Auctioneer - Appraiser"] = "Auctioneer - Valutatore"
TSM.L["Auctioneer - Market Value"] = "Auctioneer - Valore di Mercato"
TSM.L["Auctioneer - Minimum Buyout"] = "Auctioneer - Acquisto Minimo"
--[[Translation missing --]]
TSM.L["Auctioning"] = "Auctioning"
--[[Translation missing --]]
TSM.L["Auctioning Log"] = "Auctioning Log"
--[[Translation missing --]]
TSM.L["Auctioning Operation"] = "Auctioning Operation"
--[[Translation missing --]]
TSM.L["Auctioning 'POST'/'CANCEL' Button"] = "Auctioning 'POST'/'CANCEL' Button"
TSM.L["Auctions"] = "Aste"
--[[Translation missing --]]
TSM.L["Auto Quest Complete"] = "Auto Quest Complete"
--[[Translation missing --]]
TSM.L["Automatically sell vendor trash?"] = "Automatically sell vendor trash?"
--[[Translation missing --]]
TSM.L["Average Earned Per Day:"] = "Average Earned Per Day:"
--[[Translation missing --]]
TSM.L["Average Prices:"] = "Average Prices:"
--[[Translation missing --]]
TSM.L["Average Profit Per Day:"] = "Average Profit Per Day:"
--[[Translation missing --]]
TSM.L["Average Spent Per Day:"] = "Average Spent Per Day:"
--[[Translation missing --]]
TSM.L["Avg Buy Price"] = "Avg Buy Price"
--[[Translation missing --]]
TSM.L["Avg Resale Profit"] = "Avg Resale Profit"
--[[Translation missing --]]
TSM.L["Avg Sell Price"] = "Avg Sell Price"
--[[Translation missing --]]
TSM.L["BACK TO LIST"] = "BACK TO LIST"
--[[Translation missing --]]
TSM.L["Back to List"] = "Back to List"
--[[Translation missing --]]
TSM.L["Bag"] = "Bag"
TSM.L["Bags"] = "Borse"
--[[Translation missing --]]
TSM.L["Banks"] = "Banks"
--[[Translation missing --]]
TSM.L["BankUI Move Delay"] = "BankUI Move Delay"
--[[Translation missing --]]
TSM.L["Base Group"] = "Base Group"
--[[Translation missing --]]
TSM.L["Base Item"] = "Base Item"
--[[Translation missing --]]
TSM.L["Batch size"] = "Batch size"
TSM.L["Below are your currently available price sources organized by module. The %skey|r is what you would type into a custom price box."] = [=[Di seguito sono elencate le fonti di prezzo attualmente disponibili organizzate per modulo. 
La %skey|r è ciò che dovrai digitare in un campo prezzo personalizzato.]=]
--[[Translation missing --]]
TSM.L["Below custom price:"] = "Below custom price:"
--[[Translation missing --]]
TSM.L["Below min price. Posting at max price."] = "Below min price. Posting at max price."
--[[Translation missing --]]
TSM.L["Below min price. Posting at min price."] = "Below min price. Posting at min price."
--[[Translation missing --]]
TSM.L["Below min price. Posting at normal price."] = "Below min price. Posting at normal price."
--[[Translation missing --]]
TSM.L["Below, you can manage your profiles which allow you to have entirely different sets of groups."] = "Below, you can manage your profiles which allow you to have entirely different sets of groups."
--[[Translation missing --]]
TSM.L["Bid %d / %d"] = "Bid %d / %d"
--[[Translation missing --]]
TSM.L["Bid (item)"] = "Bid (item)"
--[[Translation missing --]]
TSM.L["Bid (stack)"] = "Bid (stack)"
--[[Translation missing --]]
TSM.L["Bid Price"] = "Bid Price"
--[[Translation missing --]]
TSM.L["Bid Sniper Paused"] = "Bid Sniper Paused"
--[[Translation missing --]]
TSM.L["Bid Sniper Running"] = "Bid Sniper Running"
--[[Translation missing --]]
TSM.L["Blacklisted players:"] = "Blacklisted players:"
--[[Translation missing --]]
TSM.L["Bought"] = "Bought"
--[[Translation missing --]]
TSM.L["Bought %sx%d for %s from %s"] = "Bought %sx%d for %s from %s"
--[[Translation missing --]]
TSM.L["Bound Actions"] = "Bound Actions"
--[[Translation missing --]]
TSM.L["BUSY"] = "BUSY"
--[[Translation missing --]]
TSM.L["BUY"] = "BUY"
--[[Translation missing --]]
TSM.L["Buy"] = "Buy"
--[[Translation missing --]]
TSM.L["Buy %d / %d"] = "Buy %d / %d"
--[[Translation missing --]]
TSM.L["Buy %d / %d (Confirming %d / %d)"] = "Buy %d / %d (Confirming %d / %d)"
--[[Translation missing --]]
TSM.L["Buy from AH"] = "Buy from AH"
TSM.L["Buy from Vendor"] = "Compra dal Mercante"
--[[Translation missing --]]
TSM.L["BUY GROUPS"] = "BUY GROUPS"
--[[Translation missing --]]
TSM.L["Buy Options"] = "Buy Options"
--[[Translation missing --]]
TSM.L["BUYBACK ALL"] = "BUYBACK ALL"
--[[Translation missing --]]
TSM.L["Buyer/Seller"] = "Buyer/Seller"
--[[Translation missing --]]
TSM.L["Buyout (item)"] = "Buyout (item)"
--[[Translation missing --]]
TSM.L["Buyout (stack)"] = "Buyout (stack)"
--[[Translation missing --]]
TSM.L["Buyout Price"] = "Buyout Price"
--[[Translation missing --]]
TSM.L["Buyout Sniper Paused"] = "Buyout Sniper Paused"
--[[Translation missing --]]
TSM.L["Buyout Sniper Running"] = "Buyout Sniper Running"
--[[Translation missing --]]
TSM.L["BUYS"] = "BUYS"
--[[Translation missing --]]
TSM.L["By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."] = "By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."
--[[Translation missing --]]
TSM.L["Can Craft At Least One, Profit, Craftable Quantity"] = "Can Craft At Least One, Profit, Craftable Quantity"
--[[Translation missing --]]
TSM.L["Cancel auctions with bids"] = "Cancel auctions with bids"
--[[Translation missing --]]
TSM.L["Cancel Scan"] = "Cancel Scan"
--[[Translation missing --]]
TSM.L["Cancel to repost higher?"] = "Cancel to repost higher?"
--[[Translation missing --]]
TSM.L["Cancel undercut auctions?"] = "Cancel undercut auctions?"
--[[Translation missing --]]
TSM.L["Canceling"] = "Canceling"
--[[Translation missing --]]
TSM.L["Canceling %d / %d"] = "Canceling %d / %d"
--[[Translation missing --]]
TSM.L["Canceling %d Auctions..."] = "Canceling %d Auctions..."
--[[Translation missing --]]
TSM.L["Canceling all auctions."] = "Canceling all auctions."
--[[Translation missing --]]
TSM.L["Canceling auction which you've undercut."] = "Canceling auction which you've undercut."
--[[Translation missing --]]
TSM.L["Canceling disabled."] = "Canceling disabled."
--[[Translation missing --]]
TSM.L["Canceling Settings"] = "Canceling Settings"
--[[Translation missing --]]
TSM.L["Canceling to repost at higher price."] = "Canceling to repost at higher price."
--[[Translation missing --]]
TSM.L["Canceling to repost at reset price."] = "Canceling to repost at reset price."
--[[Translation missing --]]
TSM.L["Canceling to repost higher."] = "Canceling to repost higher."
--[[Translation missing --]]
TSM.L["Canceling undercut auctions and to repost higher."] = "Canceling undercut auctions and to repost higher."
--[[Translation missing --]]
TSM.L["Canceling undercut auctions."] = "Canceling undercut auctions."
--[[Translation missing --]]
TSM.L["Cancelled"] = "Cancelled"
--[[Translation missing --]]
TSM.L["Cancelled auction of %sx%d"] = "Cancelled auction of %sx%d"
--[[Translation missing --]]
TSM.L["Cancelled Since Last Sale"] = "Cancelled Since Last Sale"
--[[Translation missing --]]
TSM.L["CANCELS"] = "CANCELS"
--[[Translation missing --]]
TSM.L["Cannot repair from the guild bank!"] = "Cannot repair from the guild bank!"
TSM.L["Can't load TSM tooltip while in combat"] = "Impossibile caricare il tooltip di TSM in combattimento"
TSM.L["Cash Register"] = "Registratore di Cassa"
--[[Translation missing --]]
TSM.L["Character"] = "Character"
--[[Translation missing --]]
TSM.L["CHARACTER"] = "CHARACTER"
--[[Translation missing --]]
TSM.L["Character Bags"] = "Character Bags"
--[[Translation missing --]]
TSM.L["Character Bank"] = "Character Bank"
--[[Translation missing --]]
TSM.L["CHARACTERS"] = "CHARACTERS"
TSM.L["Chat Tab"] = "Scheda di Chat"
--[[Translation missing --]]
TSM.L["Cheapest auction below min price."] = "Cheapest auction below min price."
--[[Translation missing --]]
TSM.L["Clean Automatically"] = "Clean Automatically"
TSM.L["Clear"] = "Azzera"
--[[Translation missing --]]
TSM.L["Clear All"] = "Clear All"
--[[Translation missing --]]
TSM.L["CLEAR DATA"] = "CLEAR DATA"
--[[Translation missing --]]
TSM.L["Clear Filters"] = "Clear Filters"
--[[Translation missing --]]
TSM.L["Clear Log After 'X' Amount of Days"] = "Clear Log After 'X' Amount of Days"
--[[Translation missing --]]
TSM.L["Clear Old Data"] = "Clear Old Data"
--[[Translation missing --]]
TSM.L["Clear Old Data Confirmation"] = "Clear Old Data Confirmation"
--[[Translation missing --]]
TSM.L["Clear Queue"] = "Clear Queue"
TSM.L["Clear Selection"] = "Azzera Selezione"
--[[Translation missing --]]
TSM.L["COD"] = "COD"
TSM.L["Coins (%s)"] = "Monete (%s)"
--[[Translation missing --]]
TSM.L["Combine Partial Stacks"] = "Combine Partial Stacks"
--[[Translation missing --]]
TSM.L["Combining..."] = "Combining..."
--[[Translation missing --]]
TSM.L["Configuration Scroll Wheel"] = "Configuration Scroll Wheel"
--[[Translation missing --]]
TSM.L["Confirm"] = "Confirm"
--[[Translation missing --]]
TSM.L["Confirm Complete Sound"] = "Confirm Complete Sound"
--[[Translation missing --]]
TSM.L["Confirming %d / %d"] = "Confirming %d / %d"
TSM.L["Connected to %s"] = "Collegato a %s"
--[[Translation missing --]]
TSM.L["Connecting to %s"] = "Connecting to %s"
--[[Translation missing --]]
TSM.L["CONTACTS"] = "CONTACTS"
--[[Translation missing --]]
TSM.L["Contacts Menu"] = "Contacts Menu"
--[[Translation missing --]]
TSM.L["Cooldown"] = "Cooldown"
--[[Translation missing --]]
TSM.L["Cooldowns"] = "Cooldowns"
--[[Translation missing --]]
TSM.L["Cost"] = "Cost"
--[[Translation missing --]]
TSM.L["Could not apply %s operation %s to %s - it has too many operations already."] = "Could not apply %s operation %s to %s - it has too many operations already."
--[[Translation missing --]]
TSM.L["Could not apply %s operation to group %s because the group does not exist"] = "Could not apply %s operation to group %s because the group does not exist"
--[[Translation missing --]]
TSM.L["Could not create macro as you already have too many. Delete one of your existing macros and try again."] = "Could not create macro as you already have too many. Delete one of your existing macros and try again."
--[[Translation missing --]]
TSM.L["Could not deserialize input"] = "Could not deserialize input"
--[[Translation missing --]]
TSM.L["Could not find enchanted item from"] = "Could not find enchanted item from"
--[[Translation missing --]]
TSM.L["Could not find pet"] = "Could not find pet"
TSM.L["Could not find profile '%s'. Possible profiles: '%s'"] = "Impossibile trovare il profilo '%s'. Possibile profilo: '%s'"
--[[Translation missing --]]
TSM.L["Could not sell items due to not having free bag space available to split a stack of items."] = "Could not sell items due to not having free bag space available to split a stack of items."
--[[Translation missing --]]
TSM.L["Craft"] = "Craft"
--[[Translation missing --]]
TSM.L["CRAFT"] = "CRAFT"
--[[Translation missing --]]
TSM.L["Craft (Unprofitable)"] = "Craft (Unprofitable)"
--[[Translation missing --]]
TSM.L["Craft (When Profitable)"] = "Craft (When Profitable)"
--[[Translation missing --]]
TSM.L["Craft All"] = "Craft All"
--[[Translation missing --]]
TSM.L["CRAFT ALL"] = "CRAFT ALL"
--[[Translation missing --]]
TSM.L["Craft Name"] = "Craft Name"
--[[Translation missing --]]
TSM.L["CRAFT NEXT"] = "CRAFT NEXT"
--[[Translation missing --]]
TSM.L["Craft value method:"] = "Craft value method:"
--[[Translation missing --]]
TSM.L["Craftable Quantity, Profit"] = "Craftable Quantity, Profit"
--[[Translation missing --]]
TSM.L["CRAFTER"] = "CRAFTER"
--[[Translation missing --]]
TSM.L["CRAFTING"] = "CRAFTING"
--[[Translation missing --]]
TSM.L["Crafting"] = "Crafting"
--[[Translation missing --]]
TSM.L["Crafting Cost"] = "Crafting Cost"
--[[Translation missing --]]
TSM.L["Crafting 'CRAFT NEXT' Button"] = "Crafting 'CRAFT NEXT' Button"
--[[Translation missing --]]
TSM.L["Crafting Queue"] = "Crafting Queue"
--[[Translation missing --]]
TSM.L["Crafting Tooltips"] = "Crafting Tooltips"
--[[Translation missing --]]
TSM.L["Crafts"] = "Crafts"
--[[Translation missing --]]
TSM.L["Crafts %d"] = "Crafts %d"
--[[Translation missing --]]
TSM.L["CREATE MACRO"] = "CREATE MACRO"
TSM.L["Create New Operation"] = "Crea Nuova Operazione"
--[[Translation missing --]]
TSM.L["CREATE NEW PROFILE"] = "CREATE NEW PROFILE"
TSM.L["Crystals"] = "Cristalli"
--[[Translation missing --]]
TSM.L["Current Profiles"] = "Current Profiles"
--[[Translation missing --]]
TSM.L["CURRENT SEARCH"] = "CURRENT SEARCH"
--[[Translation missing --]]
TSM.L["CUSTOM POST"] = "CUSTOM POST"
--[[Translation missing --]]
TSM.L["Custom Price"] = "Custom Price"
--[[Translation missing --]]
TSM.L["Custom Price Source"] = "Custom Price Source"
--[[Translation missing --]]
TSM.L["Custom Sources"] = "Custom Sources"
--[[Translation missing --]]
TSM.L["Database Sources"] = "Database Sources"
--[[Translation missing --]]
TSM.L["DD/MM/YY HH:MM"] = "DD/MM/YY HH:MM"
--[[Translation missing --]]
TSM.L["Default Craft Value Method:"] = "Default Craft Value Method:"
--[[Translation missing --]]
TSM.L["Default Material Cost Method:"] = "Default Material Cost Method:"
--[[Translation missing --]]
TSM.L["Default Price"] = "Default Price"
--[[Translation missing --]]
TSM.L["Default Price Configuration"] = "Default Price Configuration"
--[[Translation missing --]]
TSM.L["Default vendoring page"] = "Default vendoring page"
--[[Translation missing --]]
TSM.L["Define whet priority Gathering gives certain sources."] = "Define whet priority Gathering gives certain sources."
--[[Translation missing --]]
TSM.L["Delete Profile Confirmation"] = "Delete Profile Confirmation"
--[[Translation missing --]]
TSM.L["DEPOSIT REAGENTS"] = "DEPOSIT REAGENTS"
TSM.L["Deselect All Groups"] = "Deseleziona Tutti i Gruppi"
--[[Translation missing --]]
TSM.L["Deselect All Items"] = "Deselect All Items"
--[[Translation missing --]]
TSM.L["Destroy Next"] = "Destroy Next"
--[[Translation missing --]]
TSM.L["Destroy Value"] = "Destroy Value"
--[[Translation missing --]]
TSM.L["Destroy Value Source"] = "Destroy Value Source"
--[[Translation missing --]]
TSM.L["Destroying"] = "Destroying"
--[[Translation missing --]]
TSM.L["Destroying 'DESTROY NEXT' Button"] = "Destroying 'DESTROY NEXT' Button"
--[[Translation missing --]]
TSM.L["Destroying Tooltips"] = "Destroying Tooltips"
--[[Translation missing --]]
TSM.L["Destroying..."] = "Destroying..."
--[[Translation missing --]]
TSM.L["Details"] = "Details"
--[[Translation missing --]]
TSM.L["Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."] = "Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your maximum price (%s) is invalid. Check your settings."] = "Did not cancel %s because your maximum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your minimum price (%s) is invalid. Check your settings."] = "Did not cancel %s because your minimum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your normal price (%s) is invalid. Check your settings."] = "Did not cancel %s because your normal price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your undercut (%s) is invalid. Check your settings."] = "Did not cancel %s because your undercut (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."] = "Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."
--[[Translation missing --]]
TSM.L["Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."] = "Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."
--[[Translation missing --]]
TSM.L["Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."] = "Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."
--[[Translation missing --]]
TSM.L["Did not post %s because your maximum price (%s) is invalid. Check your settings."] = "Did not post %s because your maximum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your minimum price (%s) is invalid. Check your settings."] = "Did not post %s because your minimum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your normal price (%s) is invalid. Check your settings."] = "Did not post %s because your normal price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your stack size (%d) is higher than the max stack size of the item (%d)."] = "Did not post %s because your stack size (%d) is higher than the max stack size of the item (%d)."
--[[Translation missing --]]
TSM.L["Did not post %s because your undercut (%s) is invalid. Check your settings."] = "Did not post %s because your undercut (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Disable invalid price warnings"] = "Disable invalid price warnings"
--[[Translation missing --]]
TSM.L["Disenchant Search"] = "Disenchant Search"
--[[Translation missing --]]
TSM.L["DISENCHANT SEARCH"] = "DISENCHANT SEARCH"
--[[Translation missing --]]
TSM.L["Disenchant Search Options"] = "Disenchant Search Options"
--[[Translation missing --]]
TSM.L["Disenchant Value"] = "Disenchant Value"
--[[Translation missing --]]
TSM.L["Disenchanting Options"] = "Disenchanting Options"
--[[Translation missing --]]
TSM.L["Display auctioning values"] = "Display auctioning values"
--[[Translation missing --]]
TSM.L["Display cancelled since last sale"] = "Display cancelled since last sale"
--[[Translation missing --]]
TSM.L["Display crafting cost"] = "Display crafting cost"
--[[Translation missing --]]
TSM.L["Display detailed destroy info"] = "Display detailed destroy info"
--[[Translation missing --]]
TSM.L["Display disenchant value"] = "Display disenchant value"
--[[Translation missing --]]
TSM.L["Display global historical price"] = "Display global historical price"
--[[Translation missing --]]
TSM.L["Display global market value avg"] = "Display global market value avg"
--[[Translation missing --]]
TSM.L["Display global min buyout avg"] = "Display global min buyout avg"
--[[Translation missing --]]
TSM.L["Display global sale avg"] = "Display global sale avg"
--[[Translation missing --]]
TSM.L["Display group name"] = "Display group name"
--[[Translation missing --]]
TSM.L["Display historical price"] = "Display historical price"
--[[Translation missing --]]
TSM.L["Display market value"] = "Display market value"
--[[Translation missing --]]
TSM.L["Display mill value"] = "Display mill value"
--[[Translation missing --]]
TSM.L["Display min buyout"] = "Display min buyout"
--[[Translation missing --]]
TSM.L["Display Operation Names"] = "Display Operation Names"
--[[Translation missing --]]
TSM.L["Display prospect value"] = "Display prospect value"
--[[Translation missing --]]
TSM.L["Display purchase info"] = "Display purchase info"
--[[Translation missing --]]
TSM.L["Display region historical price"] = "Display region historical price"
--[[Translation missing --]]
TSM.L["Display region market value avg"] = "Display region market value avg"
--[[Translation missing --]]
TSM.L["Display region min buyout avg"] = "Display region min buyout avg"
--[[Translation missing --]]
TSM.L["Display region sale avg"] = "Display region sale avg"
--[[Translation missing --]]
TSM.L["Display region sale rate"] = "Display region sale rate"
--[[Translation missing --]]
TSM.L["Display region sold per day"] = "Display region sold per day"
--[[Translation missing --]]
TSM.L["Display sale info"] = "Display sale info"
--[[Translation missing --]]
TSM.L["Display sale rate"] = "Display sale rate"
--[[Translation missing --]]
TSM.L["Display shopping max price"] = "Display shopping max price"
--[[Translation missing --]]
TSM.L["Display total money recieved in chat?"] = "Display total money recieved in chat?"
--[[Translation missing --]]
TSM.L["Display transform value"] = "Display transform value"
--[[Translation missing --]]
TSM.L["Display vendor buy price"] = "Display vendor buy price"
--[[Translation missing --]]
TSM.L["Display vendor sell price"] = "Display vendor sell price"
--[[Translation missing --]]
TSM.L["Doing so will also remove any sub-groups attached to this group."] = "Doing so will also remove any sub-groups attached to this group."
--[[Translation missing --]]
TSM.L["Done Canceling"] = "Done Canceling"
--[[Translation missing --]]
TSM.L["Done Posting"] = "Done Posting"
--[[Translation missing --]]
TSM.L["Done Scanning"] = "Done Scanning"
--[[Translation missing --]]
TSM.L["Don't post after this many expires:"] = "Don't post after this many expires:"
--[[Translation missing --]]
TSM.L["Don't Post Items"] = "Don't Post Items"
--[[Translation missing --]]
TSM.L["Don't prompt to record trades"] = "Don't prompt to record trades"
--[[Translation missing --]]
TSM.L["DOWN"] = "DOWN"
--[[Translation missing --]]
TSM.L["Drag in Additional Items (%d/%d Items)"] = "Drag in Additional Items (%d/%d Items)"
--[[Translation missing --]]
TSM.L["Drag Item(s) Into Box"] = "Drag Item(s) Into Box"
--[[Translation missing --]]
TSM.L["Duplicate"] = "Duplicate"
--[[Translation missing --]]
TSM.L["Duplicate Profile Confirmation"] = "Duplicate Profile Confirmation"
TSM.L["Dust"] = "Polvere"
--[[Translation missing --]]
TSM.L["Elevate your gold-making!"] = "Elevate your gold-making!"
--[[Translation missing --]]
TSM.L["Embed TSM tooltips"] = "Embed TSM tooltips"
--[[Translation missing --]]
TSM.L["EMPTY BAGS"] = "EMPTY BAGS"
--[[Translation missing --]]
TSM.L["Empty parentheses are not allowed"] = "Empty parentheses are not allowed"
TSM.L["Empty price string."] = "Stringa del prezzo vuota."
--[[Translation missing --]]
TSM.L["Enable automatic stack combination"] = "Enable automatic stack combination"
--[[Translation missing --]]
TSM.L["Enable buying?"] = "Enable buying?"
--[[Translation missing --]]
TSM.L["Enable inbox chat messages"] = "Enable inbox chat messages"
--[[Translation missing --]]
TSM.L["Enable restock?"] = "Enable restock?"
--[[Translation missing --]]
TSM.L["Enable selling?"] = "Enable selling?"
--[[Translation missing --]]
TSM.L["Enable sending chat messages"] = "Enable sending chat messages"
--[[Translation missing --]]
TSM.L["Enable smart crafting for quests"] = "Enable smart crafting for quests"
--[[Translation missing --]]
TSM.L["Enable TSM Tooltips"] = "Enable TSM Tooltips"
--[[Translation missing --]]
TSM.L["Enable tweet enhancement"] = "Enable tweet enhancement"
--[[Translation missing --]]
TSM.L["Enchant Vellum"] = "Enchant Vellum"
--[[Translation missing --]]
TSM.L["Enter a name for the new profile"] = "Enter a name for the new profile"
--[[Translation missing --]]
TSM.L["Enter Filter"] = "Enter Filter"
--[[Translation missing --]]
TSM.L["Enter Keyword"] = "Enter Keyword"
--[[Translation missing --]]
TSM.L["Enter name of logged-in character from other account"] = "Enter name of logged-in character from other account"
--[[Translation missing --]]
TSM.L["Enter player name"] = "Enter player name"
TSM.L["Essences"] = "Essenze"
--[[Translation missing --]]
TSM.L["Establishing connection to %s. Make sure that you've entered this character's name on the other account."] = "Establishing connection to %s. Make sure that you've entered this character's name on the other account."
--[[Translation missing --]]
TSM.L["Estimated Cost:"] = "Estimated Cost:"
--[[Translation missing --]]
TSM.L["Estimated Profit:"] = "Estimated Profit:"
--[[Translation missing --]]
TSM.L["Exact Match Only?"] = "Exact Match Only?"
--[[Translation missing --]]
TSM.L["Exclude crafts with cooldowns"] = "Exclude crafts with cooldowns"
--[[Translation missing --]]
TSM.L["Expenses"] = "Expenses"
--[[Translation missing --]]
TSM.L["EXPENSES"] = "EXPENSES"
--[[Translation missing --]]
TSM.L["Expired"] = "Expired"
--[[Translation missing --]]
TSM.L["Expired Since Last Sale"] = "Expired Since Last Sale"
--[[Translation missing --]]
TSM.L["Expires"] = "Expires"
--[[Translation missing --]]
TSM.L["EXPIRES"] = "EXPIRES"
--[[Translation missing --]]
TSM.L["Exploration"] = "Exploration"
--[[Translation missing --]]
TSM.L["Export"] = "Export"
--[[Translation missing --]]
TSM.L["Export List"] = "Export List"
--[[Translation missing --]]
TSM.L["Failed Auctions"] = "Failed Auctions"
--[[Translation missing --]]
TSM.L["Failed Since Last Sale (Expired/Cancelled)"] = "Failed Since Last Sale (Expired/Cancelled)"
--[[Translation missing --]]
TSM.L["Failed to bid on auction of %s."] = "Failed to bid on auction of %s."
--[[Translation missing --]]
TSM.L["Failed to buy auction of %s."] = "Failed to buy auction of %s."
--[[Translation missing --]]
TSM.L["Failed to find auction for %s, so removing it from the results."] = "Failed to find auction for %s, so removing it from the results."
--[[Translation missing --]]
TSM.L["Favorite Scans"] = "Favorite Scans"
--[[Translation missing --]]
TSM.L["Favorite Searches"] = "Favorite Searches"
--[[Translation missing --]]
TSM.L["Filter Auctions by Duration"] = "Filter Auctions by Duration"
--[[Translation missing --]]
TSM.L["Filter Auctions by Keyword"] = "Filter Auctions by Keyword"
--[[Translation missing --]]
TSM.L["FILTER BY KEYWORD"] = "FILTER BY KEYWORD"
--[[Translation missing --]]
TSM.L["Filter by Keyword"] = "Filter by Keyword"
--[[Translation missing --]]
TSM.L["Filter group item lists based on the following price source"] = "Filter group item lists based on the following price source"
--[[Translation missing --]]
TSM.L["Filter Items"] = "Filter Items"
--[[Translation missing --]]
TSM.L["Filter Shopping"] = "Filter Shopping"
--[[Translation missing --]]
TSM.L["Finding Selected Auction"] = "Finding Selected Auction"
--[[Translation missing --]]
TSM.L["Fishing Reel In"] = "Fishing Reel In"
--[[Translation missing --]]
TSM.L["Forget Character"] = "Forget Character"
--[[Translation missing --]]
TSM.L["Found auction sound"] = "Found auction sound"
--[[Translation missing --]]
TSM.L["Friends"] = "Friends"
--[[Translation missing --]]
TSM.L["From"] = "From"
--[[Translation missing --]]
TSM.L["Full"] = "Full"
--[[Translation missing --]]
TSM.L["Garrison"] = "Garrison"
--[[Translation missing --]]
TSM.L["Gathering"] = "Gathering"
--[[Translation missing --]]
TSM.L["Gathering Search"] = "Gathering Search"
TSM.L["General Options"] = "Opzioni Generale"
--[[Translation missing --]]
TSM.L["Get from Bank"] = "Get from Bank"
--[[Translation missing --]]
TSM.L["Get from Guild Bank"] = "Get from Guild Bank"
--[[Translation missing --]]
TSM.L["Global Data Tooltips"] = "Global Data Tooltips"
--[[Translation missing --]]
TSM.L["Global Historical Price"] = "Global Historical Price"
--[[Translation missing --]]
TSM.L["Global Market Value Avg"] = "Global Market Value Avg"
--[[Translation missing --]]
TSM.L["Global Min Buyout Avg"] = "Global Min Buyout Avg"
--[[Translation missing --]]
TSM.L["Global Operation Confirmation"] = "Global Operation Confirmation"
--[[Translation missing --]]
TSM.L["Global Sale Avg"] = "Global Sale Avg"
--[[Translation missing --]]
TSM.L["Gold"] = "Gold"
--[[Translation missing --]]
TSM.L["Gold Earned:"] = "Gold Earned:"
--[[Translation missing --]]
TSM.L["GOLD ON HAND"] = "GOLD ON HAND"
--[[Translation missing --]]
TSM.L["Gold Spent:"] = "Gold Spent:"
--[[Translation missing --]]
TSM.L["GREAT DEALS SEARCH"] = "GREAT DEALS SEARCH"
--[[Translation missing --]]
TSM.L["Group already exists."] = "Group already exists."
--[[Translation missing --]]
TSM.L["Group Management"] = "Group Management"
--[[Translation missing --]]
TSM.L["Group Operations"] = "Group Operations"
--[[Translation missing --]]
TSM.L["Group Settings"] = "Group Settings"
--[[Translation missing --]]
TSM.L["Grouped Items"] = "Grouped Items"
--[[Translation missing --]]
TSM.L["Groups"] = "Groups"
--[[Translation missing --]]
TSM.L["Guild"] = "Guild"
--[[Translation missing --]]
TSM.L["Guild Bank"] = "Guild Bank"
--[[Translation missing --]]
TSM.L["GUILDS"] = "GUILDS"
--[[Translation missing --]]
TSM.L["GVault"] = "GVault"
--[[Translation missing --]]
TSM.L["Have"] = "Have"
--[[Translation missing --]]
TSM.L["Have Materials"] = "Have Materials"
--[[Translation missing --]]
TSM.L["Have Skill Up"] = "Have Skill Up"
--[[Translation missing --]]
TSM.L["Help & Info"] = "Help & Info"
--[[Translation missing --]]
TSM.L["Hide auctions with bids"] = "Hide auctions with bids"
--[[Translation missing --]]
TSM.L["Hide Description"] = "Hide Description"
--[[Translation missing --]]
TSM.L["Hide minimap icon"] = "Hide minimap icon"
--[[Translation missing --]]
TSM.L["Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."] = "Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."
--[[Translation missing --]]
TSM.L["Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."] = "Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."
--[[Translation missing --]]
TSM.L["High Bidder"] = "High Bidder"
--[[Translation missing --]]
TSM.L["Historical Price"] = "Historical Price"
--[[Translation missing --]]
TSM.L["Hold ALT to repair from the guild bank."] = "Hold ALT to repair from the guild bank."
--[[Translation missing --]]
TSM.L["Hr"] = "Hr"
--[[Translation missing --]]
TSM.L["Hrs"] = "Hrs"
--[[Translation missing --]]
TSM.L["I just bought [%s]x%d for %s! %s #TSM4 #warcraft"] = "I just bought [%s]x%d for %s! %s #TSM4 #warcraft"
--[[Translation missing --]]
TSM.L["I just sold [%s] for %s! %s #TSM4 #warcraft"] = "I just sold [%s] for %s! %s #TSM4 #warcraft"
--[[Translation missing --]]
TSM.L["If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."] = "If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."
--[[Translation missing --]]
TSM.L["If you have multiple profile set up with operations, enabling this will cause all but the current profile's operations to be irreversibly lost. Are you sure you want to continue?"] = "If you have multiple profile set up with operations, enabling this will cause all but the current profile's operations to be irreversibly lost. Are you sure you want to continue?"
--[[Translation missing --]]
TSM.L["If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."] = "If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."
--[[Translation missing --]]
TSM.L["Ignore Auctions Below Min"] = "Ignore Auctions Below Min"
--[[Translation missing --]]
TSM.L["Ignore auctions by duration?"] = "Ignore auctions by duration?"
--[[Translation missing --]]
TSM.L["Ignore Characters"] = "Ignore Characters"
--[[Translation missing --]]
TSM.L["Ignore duplicate operations?"] = "Ignore duplicate operations?"
--[[Translation missing --]]
TSM.L["Ignore Guilds"] = "Ignore Guilds"
--[[Translation missing --]]
TSM.L["Ignore operation on characters:"] = "Ignore operation on characters:"
--[[Translation missing --]]
TSM.L["Ignore operation on faction-realms:"] = "Ignore operation on faction-realms:"
--[[Translation missing --]]
TSM.L["Ignore random enchants?"] = "Ignore random enchants?"
--[[Translation missing --]]
TSM.L["Ignored Cooldowns"] = "Ignored Cooldowns"
--[[Translation missing --]]
TSM.L["Ignored Items"] = "Ignored Items"
--[[Translation missing --]]
TSM.L["ilvl"] = "ilvl"
--[[Translation missing --]]
TSM.L["Import"] = "Import"
--[[Translation missing --]]
TSM.L["IMPORT"] = "IMPORT"
--[[Translation missing --]]
TSM.L["Import %d Items and %s Operations?"] = "Import %d Items and %s Operations?"
--[[Translation missing --]]
TSM.L["Import Groups & Operations"] = "Import Groups & Operations"
--[[Translation missing --]]
TSM.L["Imported Items"] = "Imported Items"
--[[Translation missing --]]
TSM.L["Imported Operations"] = "Imported Operations"
--[[Translation missing --]]
TSM.L["Inbox Settings"] = "Inbox Settings"
--[[Translation missing --]]
TSM.L["Include Attached Operations"] = "Include Attached Operations"
--[[Translation missing --]]
TSM.L["Include operations?"] = "Include operations?"
--[[Translation missing --]]
TSM.L["Include soulbound items"] = "Include soulbound items"
--[[Translation missing --]]
TSM.L["Information"] = "Information"
--[[Translation missing --]]
TSM.L["Invalid custom price entered."] = "Invalid custom price entered."
--[[Translation missing --]]
TSM.L["Invalid custom price source for %s. %s"] = "Invalid custom price source for %s. %s"
--[[Translation missing --]]
TSM.L["Invalid custom price."] = "Invalid custom price."
--[[Translation missing --]]
TSM.L["Invalid function."] = "Invalid function."
--[[Translation missing --]]
TSM.L["Invalid group name."] = "Invalid group name."
--[[Translation missing --]]
TSM.L["Invalid item link."] = "Invalid item link."
--[[Translation missing --]]
TSM.L["Invalid operation name."] = "Invalid operation name."
--[[Translation missing --]]
TSM.L["Invalid operator at end of custom price."] = "Invalid operator at end of custom price."
--[[Translation missing --]]
TSM.L["Invalid parameter to price source."] = "Invalid parameter to price source."
--[[Translation missing --]]
TSM.L["Invalid player name."] = "Invalid player name."
--[[Translation missing --]]
TSM.L["Invalid price source in convert."] = "Invalid price source in convert."
--[[Translation missing --]]
TSM.L["Invalid price source."] = "Invalid price source."
--[[Translation missing --]]
TSM.L["Invalid seller data returned by server."] = "Invalid seller data returned by server."
--[[Translation missing --]]
TSM.L["Invalid word: '%s'"] = "Invalid word: '%s'"
--[[Translation missing --]]
TSM.L["Inventory"] = "Inventory"
--[[Translation missing --]]
TSM.L["Inventory / Mailing"] = "Inventory / Mailing"
--[[Translation missing --]]
TSM.L["Inventory Options"] = "Inventory Options"
--[[Translation missing --]]
TSM.L["Inventory Tooltip Format"] = "Inventory Tooltip Format"
--[[Translation missing --]]
TSM.L["It appears that you've manually copied your saved variables between accounts which will cause TSM's automatic sync'ing to not work. You'll need to undo this, and/or delete the TradeSkillMaster and TSM_Crafting saved variables files on both accounts (with WoW closed) in order to fix this."] = "It appears that you've manually copied your saved variables between accounts which will cause TSM's automatic sync'ing to not work. You'll need to undo this, and/or delete the TradeSkillMaster and TSM_Crafting saved variables files on both accounts (with WoW closed) in order to fix this."
--[[Translation missing --]]
TSM.L["Item"] = "Item"
--[[Translation missing --]]
TSM.L["ITEM CLASS"] = "ITEM CLASS"
--[[Translation missing --]]
TSM.L["Item Level"] = "Item Level"
--[[Translation missing --]]
TSM.L["ITEM LEVEL RANGE"] = "ITEM LEVEL RANGE"
--[[Translation missing --]]
TSM.L["Item links may only be used as parameters to price sources."] = "Item links may only be used as parameters to price sources."
--[[Translation missing --]]
TSM.L["Item Name"] = "Item Name"
--[[Translation missing --]]
TSM.L["Item Quality"] = "Item Quality"
--[[Translation missing --]]
TSM.L["ITEM SEARCH"] = "ITEM SEARCH"
--[[Translation missing --]]
TSM.L["ITEM SUBCLASS"] = "ITEM SUBCLASS"
--[[Translation missing --]]
TSM.L["Item Value"] = "Item Value"
--[[Translation missing --]]
TSM.L["Item/Group is invalid (see chat)."] = "Item/Group is invalid (see chat)."
--[[Translation missing --]]
TSM.L["ITEMS"] = "ITEMS"
--[[Translation missing --]]
TSM.L["Items"] = "Items"
--[[Translation missing --]]
TSM.L["Items in Bags"] = "Items in Bags"
--[[Translation missing --]]
TSM.L["Keep in bags quantity:"] = "Keep in bags quantity:"
--[[Translation missing --]]
TSM.L["Keep in bank quantity:"] = "Keep in bank quantity:"
--[[Translation missing --]]
TSM.L["Keep posted:"] = "Keep posted:"
--[[Translation missing --]]
TSM.L["Keep quantity:"] = "Keep quantity:"
--[[Translation missing --]]
TSM.L["Keep this amount in bags:"] = "Keep this amount in bags:"
--[[Translation missing --]]
TSM.L["Keep this amount:"] = "Keep this amount:"
--[[Translation missing --]]
TSM.L["Keeping %d."] = "Keeping %d."
--[[Translation missing --]]
TSM.L["Keeping undercut auctions posted."] = "Keeping undercut auctions posted."
--[[Translation missing --]]
TSM.L["Last 14 Days"] = "Last 14 Days"
--[[Translation missing --]]
TSM.L["Last 3 Days"] = "Last 3 Days"
--[[Translation missing --]]
TSM.L["Last 30 Days"] = "Last 30 Days"
--[[Translation missing --]]
TSM.L["LAST 30 DAYS"] = "LAST 30 DAYS"
--[[Translation missing --]]
TSM.L["Last 60 Days"] = "Last 60 Days"
--[[Translation missing --]]
TSM.L["Last 7 Days"] = "Last 7 Days"
--[[Translation missing --]]
TSM.L["LAST 7 DAYS"] = "LAST 7 DAYS"
--[[Translation missing --]]
TSM.L["Last Data Update:"] = "Last Data Update:"
--[[Translation missing --]]
TSM.L["Last Purchased"] = "Last Purchased"
--[[Translation missing --]]
TSM.L["Last Sold"] = "Last Sold"
--[[Translation missing --]]
TSM.L["Level Up"] = "Level Up"
--[[Translation missing --]]
TSM.L["LIMIT"] = "LIMIT"
--[[Translation missing --]]
TSM.L["Link to Another Operation"] = "Link to Another Operation"
--[[Translation missing --]]
TSM.L["List"] = "List"
--[[Translation missing --]]
TSM.L["List materials in tooltip"] = "List materials in tooltip"
--[[Translation missing --]]
TSM.L["Loading Mails..."] = "Loading Mails..."
--[[Translation missing --]]
TSM.L["Loading..."] = "Loading..."
TSM.L["Looks like TradeSkillMaster has encountered an error. Please help the author fix this error by following the instructions shown."] = "Sembra che TradeSkillMaster abbia riscontrato un errore. Aiuta l'autore a riparare l'errore seguendo le istruzioni mostrate."
--[[Translation missing --]]
TSM.L["Loop detected in the following custom price:"] = "Loop detected in the following custom price:"
--[[Translation missing --]]
TSM.L["Lowest auction by whitelisted player."] = "Lowest auction by whitelisted player."
--[[Translation missing --]]
TSM.L["Macro created and scroll wheel bound!"] = "Macro created and scroll wheel bound!"
--[[Translation missing --]]
TSM.L["Macro Setup"] = "Macro Setup"
--[[Translation missing --]]
TSM.L["Mail"] = "Mail"
--[[Translation missing --]]
TSM.L["Mail Disenchantables"] = "Mail Disenchantables"
--[[Translation missing --]]
TSM.L["Mail Disenchantables Max Quality"] = "Mail Disenchantables Max Quality"
--[[Translation missing --]]
TSM.L["MAIL SELECTED GROUPS"] = "MAIL SELECTED GROUPS"
--[[Translation missing --]]
TSM.L["Mail to %s"] = "Mail to %s"
--[[Translation missing --]]
TSM.L["Mailing"] = "Mailing"
--[[Translation missing --]]
TSM.L["Mailing all to %s."] = "Mailing all to %s."
--[[Translation missing --]]
TSM.L["Mailing Options"] = "Mailing Options"
--[[Translation missing --]]
TSM.L["Mailing up to %d to %s."] = "Mailing up to %d to %s."
--[[Translation missing --]]
TSM.L["Main Settings"] = "Main Settings"
--[[Translation missing --]]
TSM.L["Make Cash On Delivery?"] = "Make Cash On Delivery?"
--[[Translation missing --]]
TSM.L["Management Options"] = "Management Options"
--[[Translation missing --]]
TSM.L["Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."] = "Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."
--[[Translation missing --]]
TSM.L["Map Ping"] = "Map Ping"
--[[Translation missing --]]
TSM.L["Market Value"] = "Market Value"
--[[Translation missing --]]
TSM.L["Market Value Price Source"] = "Market Value Price Source"
--[[Translation missing --]]
TSM.L["Market Value Source"] = "Market Value Source"
--[[Translation missing --]]
TSM.L["Mat Cost"] = "Mat Cost"
--[[Translation missing --]]
TSM.L["Mat Price"] = "Mat Price"
--[[Translation missing --]]
TSM.L["Match stack size?"] = "Match stack size?"
--[[Translation missing --]]
TSM.L["Match whitelisted players"] = "Match whitelisted players"
--[[Translation missing --]]
TSM.L["Material Name"] = "Material Name"
--[[Translation missing --]]
TSM.L["Materials"] = "Materials"
--[[Translation missing --]]
TSM.L["Materials to Gather"] = "Materials to Gather"
--[[Translation missing --]]
TSM.L["Max Destroy Value"] = "Max Destroy Value"
--[[Translation missing --]]
TSM.L["MAX EXPIRES TO BANK"] = "MAX EXPIRES TO BANK"
--[[Translation missing --]]
TSM.L["Max Market Value"] = "Max Market Value"
--[[Translation missing --]]
TSM.L["Max Shopping Price"] = "Max Shopping Price"
--[[Translation missing --]]
TSM.L["Maximum amount already posted."] = "Maximum amount already posted."
--[[Translation missing --]]
TSM.L["Maximum Auction Price (Per Item)"] = "Maximum Auction Price (Per Item)"
--[[Translation missing --]]
TSM.L["Maximum Destroy Value (Enter '0c' to disable)"] = "Maximum Destroy Value (Enter '0c' to disable)"
--[[Translation missing --]]
TSM.L["Maximum disenchant level:"] = "Maximum disenchant level:"
--[[Translation missing --]]
TSM.L["Maximum Disenchant Quality"] = "Maximum Disenchant Quality"
--[[Translation missing --]]
TSM.L["Maximum disenchant search percentage:"] = "Maximum disenchant search percentage:"
--[[Translation missing --]]
TSM.L["Maximum Market Value (Enter '0c' to disable)"] = "Maximum Market Value (Enter '0c' to disable)"
--[[Translation missing --]]
TSM.L["MAXIMUM QUANTITY TO BUY:"] = "MAXIMUM QUANTITY TO BUY:"
--[[Translation missing --]]
TSM.L["Maximum quantity:"] = "Maximum quantity:"
--[[Translation missing --]]
TSM.L["Maximum restock quantity:"] = "Maximum restock quantity:"
--[[Translation missing --]]
TSM.L["Mill Value"] = "Mill Value"
--[[Translation missing --]]
TSM.L["Min"] = "Min"
--[[Translation missing --]]
TSM.L["Min Buyout"] = "Min Buyout"
--[[Translation missing --]]
TSM.L["Min/Normal/Max Prices"] = "Min/Normal/Max Prices"
--[[Translation missing --]]
TSM.L["Minimum Days Old"] = "Minimum Days Old"
--[[Translation missing --]]
TSM.L["Minimum disenchant level:"] = "Minimum disenchant level:"
--[[Translation missing --]]
TSM.L["Minimum expires:"] = "Minimum expires:"
--[[Translation missing --]]
TSM.L["Minimum profit:"] = "Minimum profit:"
--[[Translation missing --]]
TSM.L["MINIMUM RARITY"] = "MINIMUM RARITY"
--[[Translation missing --]]
TSM.L["Minimum restock quantity:"] = "Minimum restock quantity:"
--[[Translation missing --]]
TSM.L["Misplaced comma"] = "Misplaced comma"
--[[Translation missing --]]
TSM.L["Missing Materials"] = "Missing Materials"
--[[Translation missing --]]
TSM.L["MM/DD/YY HH:MM"] = "MM/DD/YY HH:MM"
--[[Translation missing --]]
TSM.L["Modifiers:"] = "Modifiers:"
--[[Translation missing --]]
TSM.L["Money Frame Open"] = "Money Frame Open"
--[[Translation missing --]]
TSM.L["Money Transfer"] = "Money Transfer"
--[[Translation missing --]]
TSM.L["Most Profitable Item:"] = "Most Profitable Item:"
--[[Translation missing --]]
TSM.L["MOVE"] = "MOVE"
--[[Translation missing --]]
TSM.L["Move already grouped items?"] = "Move already grouped items?"
--[[Translation missing --]]
TSM.L["Move Quantity Settings"] = "Move Quantity Settings"
--[[Translation missing --]]
TSM.L["MOVE TO BAGS"] = "MOVE TO BAGS"
--[[Translation missing --]]
TSM.L["MOVE TO BANK"] = "MOVE TO BANK"
--[[Translation missing --]]
TSM.L["MOVING"] = "MOVING"
--[[Translation missing --]]
TSM.L["Moving"] = "Moving"
--[[Translation missing --]]
TSM.L["Multiple Items"] = "Multiple Items"
--[[Translation missing --]]
TSM.L["My Auctions"] = "My Auctions"
--[[Translation missing --]]
TSM.L["My Auctions 'CANCEL' Button"] = "My Auctions 'CANCEL' Button"
--[[Translation missing --]]
TSM.L["Neat Stacks only?"] = "Neat Stacks only?"
--[[Translation missing --]]
TSM.L["NEED MATS"] = "NEED MATS"
--[[Translation missing --]]
TSM.L["New Group"] = "New Group"
--[[Translation missing --]]
TSM.L["New Operation"] = "New Operation"
--[[Translation missing --]]
TSM.L["NEWS AND INFORMATION"] = "NEWS AND INFORMATION"
--[[Translation missing --]]
TSM.L["No Attachments"] = "No Attachments"
--[[Translation missing --]]
TSM.L["No Data"] = "No Data"
--[[Translation missing --]]
TSM.L["No group selected"] = "No group selected"
--[[Translation missing --]]
TSM.L["No item specified. Usage: /tsm restock_help [ITEM_LINK]"] = "No item specified. Usage: /tsm restock_help [ITEM_LINK]"
--[[Translation missing --]]
TSM.L["NO ITEMS"] = "NO ITEMS"
--[[Translation missing --]]
TSM.L["No Materials to Gather"] = "No Materials to Gather"
--[[Translation missing --]]
TSM.L["No Operation Selected"] = "No Operation Selected"
--[[Translation missing --]]
TSM.L["No posting."] = "No posting."
--[[Translation missing --]]
TSM.L["No Profession Opened"] = "No Profession Opened"
--[[Translation missing --]]
TSM.L["No Profession Selected"] = "No Profession Selected"
--[[Translation missing --]]
TSM.L["No profile specified. Possible profiles: '%s'"] = "No profile specified. Possible profiles: '%s'"
--[[Translation missing --]]
TSM.L["No recent AuctionDB scan data found."] = "No recent AuctionDB scan data found."
--[[Translation missing --]]
TSM.L["No Sound"] = "No Sound"
--[[Translation missing --]]
TSM.L["None"] = "None"
--[[Translation missing --]]
TSM.L["None (Always Show)"] = "None (Always Show)"
--[[Translation missing --]]
TSM.L["None Selected"] = "None Selected"
--[[Translation missing --]]
TSM.L["NONGROUP TO BANK"] = "NONGROUP TO BANK"
--[[Translation missing --]]
TSM.L["Normal"] = "Normal"
--[[Translation missing --]]
TSM.L["Not canceling auction at reset price."] = "Not canceling auction at reset price."
--[[Translation missing --]]
TSM.L["Not canceling auction below min price."] = "Not canceling auction below min price."
--[[Translation missing --]]
TSM.L["Not canceling."] = "Not canceling."
--[[Translation missing --]]
TSM.L["Not enough items in bags."] = "Not enough items in bags."
--[[Translation missing --]]
TSM.L["NOT OPEN"] = "NOT OPEN"
--[[Translation missing --]]
TSM.L["Not Scanned"] = "Not Scanned"
--[[Translation missing --]]
TSM.L["NPC"] = "NPC"
--[[Translation missing --]]
TSM.L["Number Owned"] = "Number Owned"
--[[Translation missing --]]
TSM.L["of"] = "of"
--[[Translation missing --]]
TSM.L["Offline"] = "Offline"
--[[Translation missing --]]
TSM.L["Old TSM addons detected. TSM has disabled them and requires a reload."] = "Old TSM addons detected. TSM has disabled them and requires a reload."
--[[Translation missing --]]
TSM.L["On Cooldown"] = "On Cooldown"
--[[Translation missing --]]
TSM.L["Only show craftable"] = "Only show craftable"
--[[Translation missing --]]
TSM.L["Only show items with disenchant value above custom price"] = "Only show items with disenchant value above custom price"
--[[Translation missing --]]
TSM.L["OPEN"] = "OPEN"
--[[Translation missing --]]
TSM.L["Open all bags when auctioning"] = "Open all bags when auctioning"
--[[Translation missing --]]
TSM.L["OPEN ALL MAIL"] = "OPEN ALL MAIL"
--[[Translation missing --]]
TSM.L["Open Mail"] = "Open Mail"
--[[Translation missing --]]
TSM.L["Open Mail Complete Sound"] = "Open Mail Complete Sound"
--[[Translation missing --]]
TSM.L["Open Task List"] = "Open Task List"
--[[Translation missing --]]
TSM.L["Operation"] = "Operation"
--[[Translation missing --]]
TSM.L["Operations"] = "Operations"
--[[Translation missing --]]
TSM.L["Other Character"] = "Other Character"
--[[Translation missing --]]
TSM.L["Other Settings"] = "Other Settings"
--[[Translation missing --]]
TSM.L["Other Shopping Searches"] = "Other Shopping Searches"
--[[Translation missing --]]
TSM.L["Override default craft value method?"] = "Override default craft value method?"
--[[Translation missing --]]
TSM.L["Override parent operations"] = "Override parent operations"
--[[Translation missing --]]
TSM.L["Parent Items"] = "Parent Items"
--[[Translation missing --]]
TSM.L["Past 7 Days"] = "Past 7 Days"
--[[Translation missing --]]
TSM.L["Past Day"] = "Past Day"
--[[Translation missing --]]
TSM.L["Past Month"] = "Past Month"
--[[Translation missing --]]
TSM.L["Past Year"] = "Past Year"
--[[Translation missing --]]
TSM.L["Paste string here"] = "Paste string here"
--[[Translation missing --]]
TSM.L["Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."] = "Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."
--[[Translation missing --]]
TSM.L["Per Item"] = "Per Item"
--[[Translation missing --]]
TSM.L["Per Stack"] = "Per Stack"
--[[Translation missing --]]
TSM.L["Per Unit"] = "Per Unit"
--[[Translation missing --]]
TSM.L["Player Gold"] = "Player Gold"
--[[Translation missing --]]
TSM.L["Player Invite Accept"] = "Player Invite Accept"
--[[Translation missing --]]
TSM.L["Please select a group to export"] = "Please select a group to export"
--[[Translation missing --]]
TSM.L["POST"] = "POST"
--[[Translation missing --]]
TSM.L["Post at Maximum Price"] = "Post at Maximum Price"
--[[Translation missing --]]
TSM.L["Post at Minimum Price"] = "Post at Minimum Price"
--[[Translation missing --]]
TSM.L["Post at Normal Price"] = "Post at Normal Price"
--[[Translation missing --]]
TSM.L["POST CAP TO BAGS"] = "POST CAP TO BAGS"
--[[Translation missing --]]
TSM.L["Post Scan"] = "Post Scan"
--[[Translation missing --]]
TSM.L["POST SELECTED"] = "POST SELECTED"
--[[Translation missing --]]
TSM.L["POSTAGE"] = "POSTAGE"
--[[Translation missing --]]
TSM.L["Postage"] = "Postage"
--[[Translation missing --]]
TSM.L["Posted at whitelisted player's price."] = "Posted at whitelisted player's price."
--[[Translation missing --]]
TSM.L["Posted Auctions %s:"] = "Posted Auctions %s:"
--[[Translation missing --]]
TSM.L["Posting"] = "Posting"
--[[Translation missing --]]
TSM.L["Posting %d / %d"] = "Posting %d / %d"
--[[Translation missing --]]
TSM.L["Posting %d stack(s) of %d for %d hours."] = "Posting %d stack(s) of %d for %d hours."
--[[Translation missing --]]
TSM.L["Posting at normal price."] = "Posting at normal price."
--[[Translation missing --]]
TSM.L["Posting at whitelisted player's price."] = "Posting at whitelisted player's price."
--[[Translation missing --]]
TSM.L["Posting at your current price."] = "Posting at your current price."
--[[Translation missing --]]
TSM.L["Posting disabled."] = "Posting disabled."
--[[Translation missing --]]
TSM.L["Posting Settings"] = "Posting Settings"
--[[Translation missing --]]
TSM.L["Potential"] = "Potential"
--[[Translation missing --]]
TSM.L["Price Settings"] = "Price Settings"
--[[Translation missing --]]
TSM.L["PRICE SOURCE"] = "PRICE SOURCE"
--[[Translation missing --]]
TSM.L["Price source with name '%s' already exists."] = "Price source with name '%s' already exists."
--[[Translation missing --]]
TSM.L["Price Variables"] = "Price Variables"
--[[Translation missing --]]
TSM.L["Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."] = "Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."
--[[Translation missing --]]
TSM.L["PROFESSION"] = "PROFESSION"
--[[Translation missing --]]
TSM.L["Profession Filters"] = "Profession Filters"
--[[Translation missing --]]
TSM.L["Profession loading..."] = "Profession loading..."
--[[Translation missing --]]
TSM.L["Professions Used In"] = "Professions Used In"
--[[Translation missing --]]
TSM.L["Profile changed to '%s'."] = "Profile changed to '%s'."
--[[Translation missing --]]
TSM.L["Profiles"] = "Profiles"
--[[Translation missing --]]
TSM.L["Profit"] = "Profit"
--[[Translation missing --]]
TSM.L["PROFIT"] = "PROFIT"
--[[Translation missing --]]
TSM.L["Profit Deduction"] = "Profit Deduction"
--[[Translation missing --]]
TSM.L["Profit, Craftable Quantity"] = "Profit, Craftable Quantity"
--[[Translation missing --]]
TSM.L["Prospect Value"] = "Prospect Value"
--[[Translation missing --]]
TSM.L["PURCHASE DATA"] = "PURCHASE DATA"
--[[Translation missing --]]
TSM.L["Purchased (Min/Avg/Max Price)"] = "Purchased (Min/Avg/Max Price)"
--[[Translation missing --]]
TSM.L["Purchased (Total Price)"] = "Purchased (Total Price)"
--[[Translation missing --]]
TSM.L["Purchases"] = "Purchases"
--[[Translation missing --]]
TSM.L["Qty"] = "Qty"
--[[Translation missing --]]
TSM.L["Quantity Bought:"] = "Quantity Bought:"
--[[Translation missing --]]
TSM.L["Quantity Sold:"] = "Quantity Sold:"
--[[Translation missing --]]
TSM.L["Quantity to move:"] = "Quantity to move:"
--[[Translation missing --]]
TSM.L["Quest Added"] = "Quest Added"
--[[Translation missing --]]
TSM.L["Quest Completed"] = "Quest Completed"
--[[Translation missing --]]
TSM.L["Quest Objectives Complete"] = "Quest Objectives Complete"
--[[Translation missing --]]
TSM.L["QUEUE"] = "QUEUE"
--[[Translation missing --]]
TSM.L["Queue Sorting Method"] = "Queue Sorting Method"
--[[Translation missing --]]
TSM.L["Quick Sell"] = "Quick Sell"
--[[Translation missing --]]
TSM.L["Quick Sell Options"] = "Quick Sell Options"
--[[Translation missing --]]
TSM.L["Quickly mail all excess disenchantable items to a character"] = "Quickly mail all excess disenchantable items to a character"
--[[Translation missing --]]
TSM.L["Quickly mail all excess gold (limited to a certain amount) to a character"] = "Quickly mail all excess gold (limited to a certain amount) to a character"
--[[Translation missing --]]
TSM.L["Raid Warning"] = "Raid Warning"
--[[Translation missing --]]
TSM.L["Read More"] = "Read More"
--[[Translation missing --]]
TSM.L["Ready Check"] = "Ready Check"
--[[Translation missing --]]
TSM.L["Ready to Cancel"] = "Ready to Cancel"
--[[Translation missing --]]
TSM.L["Reagent Bank"] = "Reagent Bank"
--[[Translation missing --]]
TSM.L["Realm Data Tooltips"] = "Realm Data Tooltips"
--[[Translation missing --]]
TSM.L["Recent Scans"] = "Recent Scans"
--[[Translation missing --]]
TSM.L["Recent Searches"] = "Recent Searches"
--[[Translation missing --]]
TSM.L["Recently Mailed"] = "Recently Mailed"
--[[Translation missing --]]
TSM.L["RECIPIENT"] = "RECIPIENT"
--[[Translation missing --]]
TSM.L["Region Avg Daily Sold"] = "Region Avg Daily Sold"
--[[Translation missing --]]
TSM.L["Region Data Tooltips"] = "Region Data Tooltips"
--[[Translation missing --]]
TSM.L["Region Historical Price"] = "Region Historical Price"
--[[Translation missing --]]
TSM.L["Region Market Value Avg"] = "Region Market Value Avg"
--[[Translation missing --]]
TSM.L["Region Min Buyout Avg"] = "Region Min Buyout Avg"
--[[Translation missing --]]
TSM.L["Region Sale Avg"] = "Region Sale Avg"
--[[Translation missing --]]
TSM.L["Region Sale Rate"] = "Region Sale Rate"
--[[Translation missing --]]
TSM.L["Reload"] = "Reload"
--[[Translation missing --]]
TSM.L["REMOVE %d ITEMS"] = "REMOVE %d ITEMS"
--[[Translation missing --]]
TSM.L["Removed a total of %s old records."] = "Removed a total of %s old records."
--[[Translation missing --]]
TSM.L["REPAIR"] = "REPAIR"
--[[Translation missing --]]
TSM.L["Repair Bill"] = "Repair Bill"
--[[Translation missing --]]
TSM.L["Replace"] = "Replace"
--[[Translation missing --]]
TSM.L["REPLY"] = "REPLY"
--[[Translation missing --]]
TSM.L["REPORT SPAM"] = "REPORT SPAM"
--[[Translation missing --]]
TSM.L["Repost Higher Threshold"] = "Repost Higher Threshold"
--[[Translation missing --]]
TSM.L["Required Level"] = "Required Level"
--[[Translation missing --]]
TSM.L["REQUIRED LEVEL RANGE"] = "REQUIRED LEVEL RANGE"
--[[Translation missing --]]
TSM.L["Requires TSM Desktop Application"] = "Requires TSM Desktop Application"
--[[Translation missing --]]
TSM.L["Resale"] = "Resale"
--[[Translation missing --]]
TSM.L["RESCAN"] = "RESCAN"
--[[Translation missing --]]
TSM.L["RESET"] = "RESET"
--[[Translation missing --]]
TSM.L["Reset All"] = "Reset All"
--[[Translation missing --]]
TSM.L["Reset Filters"] = "Reset Filters"
--[[Translation missing --]]
TSM.L["Reset Profile Confirmation"] = "Reset Profile Confirmation"
--[[Translation missing --]]
TSM.L["RESTART"] = "RESTART"
--[[Translation missing --]]
TSM.L["Restart Delay (minutes)"] = "Restart Delay (minutes)"
--[[Translation missing --]]
TSM.L["RESTOCK BAGS"] = "RESTOCK BAGS"
--[[Translation missing --]]
TSM.L["Restock help for %s:"] = "Restock help for %s:"
--[[Translation missing --]]
TSM.L["Restock Quantity Settings"] = "Restock Quantity Settings"
--[[Translation missing --]]
TSM.L["Restock quantity:"] = "Restock quantity:"
--[[Translation missing --]]
TSM.L["RESTOCK SELECTED GROUPS"] = "RESTOCK SELECTED GROUPS"
--[[Translation missing --]]
TSM.L["Restock Settings"] = "Restock Settings"
--[[Translation missing --]]
TSM.L["Restock target to max quantity?"] = "Restock target to max quantity?"
--[[Translation missing --]]
TSM.L["Restocking to %d."] = "Restocking to %d."
--[[Translation missing --]]
TSM.L["Restocking to a max of %d (min of %d) with a min profit."] = "Restocking to a max of %d (min of %d) with a min profit."
--[[Translation missing --]]
TSM.L["Restocking to a max of %d (min of %d) with no min profit."] = "Restocking to a max of %d (min of %d) with no min profit."
--[[Translation missing --]]
TSM.L["RESTORE BAGS"] = "RESTORE BAGS"
--[[Translation missing --]]
TSM.L["Resume Scan"] = "Resume Scan"
--[[Translation missing --]]
TSM.L["Retrying %d auction(s) which failed."] = "Retrying %d auction(s) which failed."
--[[Translation missing --]]
TSM.L["Revenue"] = "Revenue"
--[[Translation missing --]]
TSM.L["Round normal price"] = "Round normal price"
--[[Translation missing --]]
TSM.L["RUN ADVANCED ITEM SEARCH"] = "RUN ADVANCED ITEM SEARCH"
--[[Translation missing --]]
TSM.L["Run Bid Sniper"] = "Run Bid Sniper"
--[[Translation missing --]]
TSM.L["Run Buyout Sniper"] = "Run Buyout Sniper"
--[[Translation missing --]]
TSM.L["RUN CANCEL SCAN"] = "RUN CANCEL SCAN"
--[[Translation missing --]]
TSM.L["RUN POST SCAN"] = "RUN POST SCAN"
--[[Translation missing --]]
TSM.L["RUN SHOPPING SCAN"] = "RUN SHOPPING SCAN"
--[[Translation missing --]]
TSM.L["Running Sniper Scan"] = "Running Sniper Scan"
--[[Translation missing --]]
TSM.L["Sale"] = "Sale"
--[[Translation missing --]]
TSM.L["SALE DATA"] = "SALE DATA"
--[[Translation missing --]]
TSM.L["Sale Rate"] = "Sale Rate"
--[[Translation missing --]]
TSM.L["Sales"] = "Sales"
--[[Translation missing --]]
TSM.L["SALES"] = "SALES"
--[[Translation missing --]]
TSM.L["Sales Summary"] = "Sales Summary"
--[[Translation missing --]]
TSM.L["SCAN ALL"] = "SCAN ALL"
--[[Translation missing --]]
TSM.L["Scan Complete Sound"] = "Scan Complete Sound"
--[[Translation missing --]]
TSM.L["Scan Paused"] = "Scan Paused"
--[[Translation missing --]]
TSM.L["SCANNING"] = "SCANNING"
--[[Translation missing --]]
TSM.L["Scanning %d / %d (Page %d / %d)"] = "Scanning %d / %d (Page %d / %d)"
--[[Translation missing --]]
TSM.L["Scroll wheel direction:"] = "Scroll wheel direction:"
--[[Translation missing --]]
TSM.L["Search"] = "Search"
--[[Translation missing --]]
TSM.L["Search Bags"] = "Search Bags"
--[[Translation missing --]]
TSM.L["Search for Item"] = "Search for Item"
--[[Translation missing --]]
TSM.L["Search Groups"] = "Search Groups"
--[[Translation missing --]]
TSM.L["Search Inbox"] = "Search Inbox"
--[[Translation missing --]]
TSM.L["Search Operations"] = "Search Operations"
--[[Translation missing --]]
TSM.L["Search Patterns"] = "Search Patterns"
--[[Translation missing --]]
TSM.L["Search Usable Items Only?"] = "Search Usable Items Only?"
--[[Translation missing --]]
TSM.L["Search Vendor"] = "Search Vendor"
--[[Translation missing --]]
TSM.L["Select a Source"] = "Select a Source"
--[[Translation missing --]]
TSM.L["Select Action"] = "Select Action"
--[[Translation missing --]]
TSM.L["Select All Groups"] = "Select All Groups"
--[[Translation missing --]]
TSM.L["Select All Items"] = "Select All Items"
--[[Translation missing --]]
TSM.L["Select Auction to Cancel"] = "Select Auction to Cancel"
--[[Translation missing --]]
TSM.L["Select crafter"] = "Select crafter"
--[[Translation missing --]]
TSM.L["Select custom price sources to include in item tooltips"] = "Select custom price sources to include in item tooltips"
--[[Translation missing --]]
TSM.L["Select Duration"] = "Select Duration"
--[[Translation missing --]]
TSM.L["Select Items to Add"] = "Select Items to Add"
--[[Translation missing --]]
TSM.L["Select Items to Remove"] = "Select Items to Remove"
--[[Translation missing --]]
TSM.L["Select Operation"] = "Select Operation"
--[[Translation missing --]]
TSM.L["Select professions"] = "Select professions"
--[[Translation missing --]]
TSM.L["Select which accounting information to display in item tooltips."] = "Select which accounting information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which auctioning information to display in item tooltips."] = "Select which auctioning information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which crafting information to display in item tooltips."] = "Select which crafting information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which destroying information to display in item tooltips."] = "Select which destroying information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which shopping information to display in item tooltips."] = "Select which shopping information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Selected Groups"] = "Selected Groups"
--[[Translation missing --]]
TSM.L["SELECTED ITEM"] = "SELECTED ITEM"
--[[Translation missing --]]
TSM.L["Selected Operations"] = "Selected Operations"
--[[Translation missing --]]
TSM.L["Sell"] = "Sell"
--[[Translation missing --]]
TSM.L["SELL ALL"] = "SELL ALL"
--[[Translation missing --]]
TSM.L["SELL BOES"] = "SELL BOES"
--[[Translation missing --]]
TSM.L["SELL GROUPS"] = "SELL GROUPS"
--[[Translation missing --]]
TSM.L["Sell Options"] = "Sell Options"
--[[Translation missing --]]
TSM.L["Sell soulbound items?"] = "Sell soulbound items?"
--[[Translation missing --]]
TSM.L["Sell to Vendor"] = "Sell to Vendor"
--[[Translation missing --]]
TSM.L["SELL TRASH"] = "SELL TRASH"
--[[Translation missing --]]
TSM.L["Seller"] = "Seller"
--[[Translation missing --]]
TSM.L["Selling soulbound items."] = "Selling soulbound items."
--[[Translation missing --]]
TSM.L["Send"] = "Send"
--[[Translation missing --]]
TSM.L["SEND DISENCHANTABLES"] = "SEND DISENCHANTABLES"
--[[Translation missing --]]
TSM.L["Send Excess Gold to Banker"] = "Send Excess Gold to Banker"
--[[Translation missing --]]
TSM.L["SEND GOLD"] = "SEND GOLD"
--[[Translation missing --]]
TSM.L["Send grouped items individually"] = "Send grouped items individually"
--[[Translation missing --]]
TSM.L["SEND MAIL"] = "SEND MAIL"
--[[Translation missing --]]
TSM.L["Send Money"] = "Send Money"
--[[Translation missing --]]
TSM.L["SENDING"] = "SENDING"
--[[Translation missing --]]
TSM.L["Sending %s individually to %s"] = "Sending %s individually to %s"
--[[Translation missing --]]
TSM.L["Sending %s to %s"] = "Sending %s to %s"
--[[Translation missing --]]
TSM.L["Sending %s to %s with a COD of %s"] = "Sending %s to %s with a COD of %s"
--[[Translation missing --]]
TSM.L["Sending Settings"] = "Sending Settings"
--[[Translation missing --]]
TSM.L["SENDING..."] = "SENDING..."
--[[Translation missing --]]
TSM.L["Set auction duration to:"] = "Set auction duration to:"
--[[Translation missing --]]
TSM.L["Set bid as percentage of buyout:"] = "Set bid as percentage of buyout:"
--[[Translation missing --]]
TSM.L["Set keep in bags quantity?"] = "Set keep in bags quantity?"
--[[Translation missing --]]
TSM.L["Set keep in bank quantity?"] = "Set keep in bank quantity?"
--[[Translation missing --]]
TSM.L["Set Maximum Price:"] = "Set Maximum Price:"
--[[Translation missing --]]
TSM.L["Set maximum quantity?"] = "Set maximum quantity?"
--[[Translation missing --]]
TSM.L["Set Minimum Price:"] = "Set Minimum Price:"
--[[Translation missing --]]
TSM.L["Set minimum profit?"] = "Set minimum profit?"
--[[Translation missing --]]
TSM.L["Set move quantity?"] = "Set move quantity?"
--[[Translation missing --]]
TSM.L["Set Normal Price:"] = "Set Normal Price:"
--[[Translation missing --]]
TSM.L["Set post cap to:"] = "Set post cap to:"
--[[Translation missing --]]
TSM.L["Set posted stack size to:"] = "Set posted stack size to:"
--[[Translation missing --]]
TSM.L["Set stack size for bags?"] = "Set stack size for bags?"
--[[Translation missing --]]
TSM.L["Setup"] = "Setup"
--[[Translation missing --]]
TSM.L["SETUP ACCOUNT SYNC"] = "SETUP ACCOUNT SYNC"
TSM.L["Shards"] = "Frammenti"
--[[Translation missing --]]
TSM.L["Shopping"] = "Shopping"
--[[Translation missing --]]
TSM.L["Shopping 'BUYOUT' Button"] = "Shopping 'BUYOUT' Button"
--[[Translation missing --]]
TSM.L["Shopping for auctions including those above the max price."] = "Shopping for auctions including those above the max price."
--[[Translation missing --]]
TSM.L["Shopping for auctions with a max price set."] = "Shopping for auctions with a max price set."
--[[Translation missing --]]
TSM.L["Shopping for even stacks including those above the max price"] = "Shopping for even stacks including those above the max price"
--[[Translation missing --]]
TSM.L["Shopping for even stacks with a max price set."] = "Shopping for even stacks with a max price set."
--[[Translation missing --]]
TSM.L["Shopping Tooltips"] = "Shopping Tooltips"
--[[Translation missing --]]
TSM.L["SHORTFALL TO BAGS"] = "SHORTFALL TO BAGS"
--[[Translation missing --]]
TSM.L["Show auctions above max price?"] = "Show auctions above max price?"
--[[Translation missing --]]
TSM.L["Show Description"] = "Show Description"
--[[Translation missing --]]
TSM.L["Show Destroying frame automatically"] = "Show Destroying frame automatically"
--[[Translation missing --]]
TSM.L["Show material cost"] = "Show material cost"
--[[Translation missing --]]
TSM.L["Show on Modifier"] = "Show on Modifier"
--[[Translation missing --]]
TSM.L["Showing %d Mail"] = "Showing %d Mail"
--[[Translation missing --]]
TSM.L["Showing %d of %d Mail"] = "Showing %d of %d Mail"
--[[Translation missing --]]
TSM.L["Showing %d of %d Mails"] = "Showing %d of %d Mails"
--[[Translation missing --]]
TSM.L["Showing all %d Mails"] = "Showing all %d Mails"
--[[Translation missing --]]
TSM.L["Simple"] = "Simple"
--[[Translation missing --]]
TSM.L["SKIP"] = "SKIP"
--[[Translation missing --]]
TSM.L["Skip Import / Export confirmations?"] = "Skip Import / Export confirmations?"
--[[Translation missing --]]
TSM.L["Skipped: No assigned operation"] = "Skipped: No assigned operation"
TSM.L["Slash Commands:"] = "Comandi Slash:"
--[[Translation missing --]]
TSM.L["Sniper 'BUYOUT' Button"] = "Sniper 'BUYOUT' Button"
--[[Translation missing --]]
TSM.L["Sniper Options"] = "Sniper Options"
--[[Translation missing --]]
TSM.L["Sniper Settings"] = "Sniper Settings"
--[[Translation missing --]]
TSM.L["Sniping items below a max price"] = "Sniping items below a max price"
--[[Translation missing --]]
TSM.L["Sold"] = "Sold"
--[[Translation missing --]]
TSM.L["Sold %s worth of items."] = "Sold %s worth of items."
--[[Translation missing --]]
TSM.L["Sold (Min/Avg/Max Price)"] = "Sold (Min/Avg/Max Price)"
--[[Translation missing --]]
TSM.L["Sold (Total Price)"] = "Sold (Total Price)"
--[[Translation missing --]]
TSM.L["Sold [%s]x%d for %s to %s"] = "Sold [%s]x%d for %s to %s"
--[[Translation missing --]]
TSM.L["Sold Auctions %s:"] = "Sold Auctions %s:"
--[[Translation missing --]]
TSM.L["Source"] = "Source"
--[[Translation missing --]]
TSM.L["SOURCE %d"] = "SOURCE %d"
--[[Translation missing --]]
TSM.L["SOURCES"] = "SOURCES"
--[[Translation missing --]]
TSM.L["Sources"] = "Sources"
--[[Translation missing --]]
TSM.L["Sources to include for restock:"] = "Sources to include for restock:"
--[[Translation missing --]]
TSM.L["Stack"] = "Stack"
--[[Translation missing --]]
TSM.L["Stack / Quantity"] = "Stack / Quantity"
--[[Translation missing --]]
TSM.L["Stack size multiple:"] = "Stack size multiple:"
--[[Translation missing --]]
TSM.L["Start either a 'Buyout' or 'Bid' sniper using the buttons above."] = "Start either a 'Buyout' or 'Bid' sniper using the buttons above."
--[[Translation missing --]]
TSM.L["Starting Scan..."] = "Starting Scan..."
--[[Translation missing --]]
TSM.L["STOP"] = "STOP"
--[[Translation missing --]]
TSM.L["Store operations globally"] = "Store operations globally"
--[[Translation missing --]]
TSM.L["Subject"] = "Subject"
--[[Translation missing --]]
TSM.L["SUBJECT"] = "SUBJECT"
--[[Translation missing --]]
TSM.L["Switch to %s"] = "Switch to %s"
--[[Translation missing --]]
TSM.L["Switch to WoW UI"] = "Switch to WoW UI"
--[[Translation missing --]]
TSM.L["Sync Setup Error: The specified player on the other account is not currently online."] = "Sync Setup Error: The specified player on the other account is not currently online."
--[[Translation missing --]]
TSM.L["Sync Setup Error: This character is already part of a known account."] = "Sync Setup Error: This character is already part of a known account."
--[[Translation missing --]]
TSM.L["Sync Setup Error: You entered the name of the current character and not the character on the other account."] = "Sync Setup Error: You entered the name of the current character and not the character on the other account."
--[[Translation missing --]]
TSM.L["TAKE ALL"] = "TAKE ALL"
--[[Translation missing --]]
TSM.L["Take Attachments"] = "Take Attachments"
--[[Translation missing --]]
TSM.L["Target Character"] = "Target Character"
--[[Translation missing --]]
TSM.L["TARGET SHORTFALL TO BAGS"] = "TARGET SHORTFALL TO BAGS"
--[[Translation missing --]]
TSM.L["Tasks Added to Task List"] = "Tasks Added to Task List"
--[[Translation missing --]]
TSM.L["Text (%s)"] = "Text (%s)"
--[[Translation missing --]]
TSM.L["The canlearn filter was ignored because the CanIMogIt addon was not found."] = "The canlearn filter was ignored because the CanIMogIt addon was not found."
--[[Translation missing --]]
TSM.L["The 'Craft Value Method' (%s) did not return a value for this item."] = "The 'Craft Value Method' (%s) did not return a value for this item."
--[[Translation missing --]]
TSM.L["The 'disenchant' price source has been replaced by the more general 'destroy' price source. Please update your custom prices."] = "The 'disenchant' price source has been replaced by the more general 'destroy' price source. Please update your custom prices."
--[[Translation missing --]]
TSM.L["The min profit (%s) did not evalulate to a valid value for this item."] = "The min profit (%s) did not evalulate to a valid value for this item."
--[[Translation missing --]]
TSM.L["The name can ONLY contain letters. No spaces, numbers, or special characters."] = "The name can ONLY contain letters. No spaces, numbers, or special characters."
--[[Translation missing --]]
TSM.L["The number which would be queued (%d) is less than the min restock quantity (%d)."] = "The number which would be queued (%d) is less than the min restock quantity (%d)."
--[[Translation missing --]]
TSM.L["The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."] = "The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."
--[[Translation missing --]]
TSM.L["The player \"%s\" is already on your whitelist."] = "The player \"%s\" is already on your whitelist."
--[[Translation missing --]]
TSM.L["The profit of this item (%s) is below the min profit (%s)."] = "The profit of this item (%s) is below the min profit (%s)."
--[[Translation missing --]]
TSM.L["The seller name of the lowest auction for %s was not given by the server. Skipping this item."] = "The seller name of the lowest auction for %s was not given by the server. Skipping this item."
--[[Translation missing --]]
TSM.L["The TradeSkillMaster_AppHelper addon is not enabled and is required for proper operation of TSM. TSM has enabled it and requires a reload."] = "The TradeSkillMaster_AppHelper addon is not enabled and is required for proper operation of TSM. TSM has enabled it and requires a reload."
--[[Translation missing --]]
TSM.L["The TradeSkillMaster_AppHelper addon is not installed and is required for proper operation of TSM."] = "The TradeSkillMaster_AppHelper addon is not installed and is required for proper operation of TSM."
--[[Translation missing --]]
TSM.L["The unlearned filter was ignored because the CanIMogIt addon was not found."] = "The unlearned filter was ignored because the CanIMogIt addon was not found."
--[[Translation missing --]]
TSM.L["There is a crafting cost and crafted item value, but TSM_Crafting wasn't able to calculate a profit. This shouldn't happen!"] = "There is a crafting cost and crafted item value, but TSM_Crafting wasn't able to calculate a profit. This shouldn't happen!"
--[[Translation missing --]]
TSM.L["There is no TSM_Crafting operation applied to this item's TSM group (%s)."] = "There is no TSM_Crafting operation applied to this item's TSM group (%s)."
--[[Translation missing --]]
TSM.L["This group already has operations. Would you like to add another one or replace the last one?"] = "This group already has operations. Would you like to add another one or replace the last one?"
--[[Translation missing --]]
TSM.L["This group already has the max number of operation. Would you like to replace the last one?"] = "This group already has the max number of operation. Would you like to replace the last one?"
--[[Translation missing --]]
TSM.L["This is not a valid profile name. Profile names must be at least one character long and may not contain '@' characters."] = "This is not a valid profile name. Profile names must be at least one character long and may not contain '@' characters."
--[[Translation missing --]]
TSM.L["This item does not have a crafting cost. Check that all of its mats have mat prices."] = "This item does not have a crafting cost. Check that all of its mats have mat prices."
--[[Translation missing --]]
TSM.L["This item is not in a TSM group."] = "This item is not in a TSM group."
--[[Translation missing --]]
TSM.L["This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general TSM_Crafting options."] = "This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general TSM_Crafting options."
--[[Translation missing --]]
TSM.L["This looks like an exported operation and not a custom price."] = "This looks like an exported operation and not a custom price."
--[[Translation missing --]]
TSM.L["This will copy the settings from '%s' into your currently-active one."] = "This will copy the settings from '%s' into your currently-active one."
--[[Translation missing --]]
TSM.L["This will permanently delete the '%s' profile."] = "This will permanently delete the '%s' profile."
--[[Translation missing --]]
TSM.L["This will reset all groups and operations (if not stored globally) to be wiped from this profile."] = "This will reset all groups and operations (if not stored globally) to be wiped from this profile."
--[[Translation missing --]]
TSM.L["Time"] = "Time"
--[[Translation missing --]]
TSM.L["Time Format"] = "Time Format"
--[[Translation missing --]]
TSM.L["Time Frame"] = "Time Frame"
--[[Translation missing --]]
TSM.L["TIME FRAME"] = "TIME FRAME"
--[[Translation missing --]]
TSM.L["TINKER"] = "TINKER"
--[[Translation missing --]]
TSM.L["Tooltip Price Format"] = "Tooltip Price Format"
--[[Translation missing --]]
TSM.L["Tooltip Settings"] = "Tooltip Settings"
--[[Translation missing --]]
TSM.L["Top Buyers:"] = "Top Buyers:"
--[[Translation missing --]]
TSM.L["Top Item:"] = "Top Item:"
--[[Translation missing --]]
TSM.L["Top Sellers:"] = "Top Sellers:"
--[[Translation missing --]]
TSM.L["Total"] = "Total"
--[[Translation missing --]]
TSM.L["Total Gold"] = "Total Gold"
--[[Translation missing --]]
TSM.L["Total Gold Earned:"] = "Total Gold Earned:"
--[[Translation missing --]]
TSM.L["Total Gold Spent:"] = "Total Gold Spent:"
--[[Translation missing --]]
TSM.L["Total Price"] = "Total Price"
--[[Translation missing --]]
TSM.L["Total Profit:"] = "Total Profit:"
--[[Translation missing --]]
TSM.L["Total Value"] = "Total Value"
--[[Translation missing --]]
TSM.L["Total Value of All Items: "] = "Total Value of All Items: "
--[[Translation missing --]]
TSM.L["Track Sales / Purchases via trade"] = "Track Sales / Purchases via trade"
--[[Translation missing --]]
TSM.L["TradeSkillMaster Info"] = "TradeSkillMaster Info"
--[[Translation missing --]]
TSM.L["Transform Value"] = "Transform Value"
--[[Translation missing --]]
TSM.L["TSM Banking"] = "TSM Banking"
--[[Translation missing --]]
TSM.L["TSM can sync data automatically between multiple accounts."] = "TSM can sync data automatically between multiple accounts."
--[[Translation missing --]]
TSM.L["TSM Crafting"] = "TSM Crafting"
--[[Translation missing --]]
TSM.L["TSM Destroying"] = "TSM Destroying"
--[[Translation missing --]]
TSM.L["TSM failed to scan some auctions. Please rerun the scan."] = "TSM failed to scan some auctions. Please rerun the scan."
--[[Translation missing --]]
TSM.L["TSM Groups"] = "TSM Groups"
--[[Translation missing --]]
TSM.L["TSM is missing important information from the TSM Desktop Application. Please ensure the TSM Desktop Application is running and is properly configured."] = "TSM is missing important information from the TSM Desktop Application. Please ensure the TSM Desktop Application is running and is properly configured."
--[[Translation missing --]]
TSM.L["TSM Mailing"] = "TSM Mailing"
--[[Translation missing --]]
TSM.L["TSM TASK LIST"] = "TSM TASK LIST"
--[[Translation missing --]]
TSM.L["TSM Vendoring"] = "TSM Vendoring"
--[[Translation missing --]]
TSM.L["TSM Version Info:"] = "TSM Version Info:"
--[[Translation missing --]]
TSM.L["TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"] = "TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"
--[[Translation missing --]]
TSM.L["TSM4"] = "TSM4"
--[[Translation missing --]]
TSM.L["TUJ 3-Day Price"] = "TUJ 3-Day Price"
--[[Translation missing --]]
TSM.L["Twitter Integration"] = "Twitter Integration"
--[[Translation missing --]]
TSM.L["Twitter Integration Not Enabled"] = "Twitter Integration Not Enabled"
--[[Translation missing --]]
TSM.L["Type"] = "Type"
--[[Translation missing --]]
TSM.L["Type Something"] = "Type Something"
--[[Translation missing --]]
TSM.L["Unbalanced parentheses."] = "Unbalanced parentheses."
--[[Translation missing --]]
TSM.L["Undercut amount:"] = "Undercut amount:"
--[[Translation missing --]]
TSM.L["Undercut by whitelisted player."] = "Undercut by whitelisted player."
--[[Translation missing --]]
TSM.L["Undercutting blacklisted player."] = "Undercutting blacklisted player."
--[[Translation missing --]]
TSM.L["Undercutting competition."] = "Undercutting competition."
--[[Translation missing --]]
TSM.L["Ungrouped Items"] = "Ungrouped Items"
--[[Translation missing --]]
TSM.L["Unknown Item"] = "Unknown Item"
--[[Translation missing --]]
TSM.L["Unwrap Gift"] = "Unwrap Gift"
--[[Translation missing --]]
TSM.L["Up"] = "Up"
--[[Translation missing --]]
TSM.L["UPDATE EXISTING MACRO"] = "UPDATE EXISTING MACRO"
--[[Translation missing --]]
TSM.L["Usage: /tsm price <ItemLink> <Price String>"] = "Usage: /tsm price <ItemLink> <Price String>"
--[[Translation missing --]]
TSM.L["Use smart average for purchase price"] = "Use smart average for purchase price"
--[[Translation missing --]]
TSM.L["Use the field below to search the auction house by filter"] = "Use the field below to search the auction house by filter"
--[[Translation missing --]]
TSM.L["Use the list to the left to select groups, & operations you'd like to create export strings for."] = "Use the list to the left to select groups, & operations you'd like to create export strings for."
--[[Translation missing --]]
TSM.L["VALUE PRICE SOURCE"] = "VALUE PRICE SOURCE"
--[[Translation missing --]]
TSM.L["ValueSources"] = "ValueSources"
--[[Translation missing --]]
TSM.L["Variable Name"] = "Variable Name"
--[[Translation missing --]]
TSM.L["Vendor"] = "Vendor"
--[[Translation missing --]]
TSM.L["Vendor Buy Price"] = "Vendor Buy Price"
--[[Translation missing --]]
TSM.L["Vendor Search"] = "Vendor Search"
--[[Translation missing --]]
TSM.L["VENDOR SEARCH"] = "VENDOR SEARCH"
--[[Translation missing --]]
TSM.L["Vendor Sell"] = "Vendor Sell"
--[[Translation missing --]]
TSM.L["Vendor Sell Price"] = "Vendor Sell Price"
--[[Translation missing --]]
TSM.L["Vendoring 'SELL ALL' Button"] = "Vendoring 'SELL ALL' Button"
--[[Translation missing --]]
TSM.L["View ignored items in the Destroying options."] = "View ignored items in the Destroying options."
--[[Translation missing --]]
TSM.L["Warehousing"] = "Warehousing"
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group."] = "Warehousing will move a max of %d of each item in this group."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group."] = "Warehousing will move all of the items in this group."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["WARNING: The macro was too long, so was truncated to fit by WoW."] = "WARNING: The macro was too long, so was truncated to fit by WoW."
--[[Translation missing --]]
TSM.L["WARNING: You minimum price for %s is below its vendorsell price (with AH cut taken into account). Consider raising your minimum price, or vendoring the item."] = "WARNING: You minimum price for %s is below its vendorsell price (with AH cut taken into account). Consider raising your minimum price, or vendoring the item."
--[[Translation missing --]]
TSM.L["When above maximum:"] = "When above maximum:"
--[[Translation missing --]]
TSM.L["When below minimum:"] = "When below minimum:"
--[[Translation missing --]]
TSM.L["Whitelist"] = "Whitelist"
--[[Translation missing --]]
TSM.L["Whitelisted Players"] = "Whitelisted Players"
--[[Translation missing --]]
TSM.L["You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"] = "You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"
--[[Translation missing --]]
TSM.L["You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."] = "You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."
TSM.L["You cannot use %s as part of this custom price."] = "Non puoi usare %s come prezzo personalizzato."
--[[Translation missing --]]
TSM.L["You cannot use %s within convert() as part of this custom price."] = "You cannot use %s within convert() as part of this custom price."
--[[Translation missing --]]
TSM.L["You do not need to add \"%s\", alts are whitelisted automatically."] = "You do not need to add \"%s\", alts are whitelisted automatically."
--[[Translation missing --]]
TSM.L["You don't know how to craft this item."] = "You don't know how to craft this item."
--[[Translation missing --]]
TSM.L["You must reload your UI for these settings to take effect. Reload now?"] = "You must reload your UI for these settings to take effect. Reload now?"
--[[Translation missing --]]
TSM.L["You won an auction for %sx%d for %s"] = "You won an auction for %sx%d for %s"
--[[Translation missing --]]
TSM.L["Your auction has not been undercut."] = "Your auction has not been undercut."
--[[Translation missing --]]
TSM.L["Your auction of %s expired"] = "Your auction of %s expired"
--[[Translation missing --]]
TSM.L["Your auction of %s has sold for %s!"] = "Your auction of %s has sold for %s!"
--[[Translation missing --]]
TSM.L["Your Buyout"] = "Your Buyout"
--[[Translation missing --]]
TSM.L["Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"] = "Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"
--[[Translation missing --]]
TSM.L["Your default craft value method was invalid so it has been returned to the default. Details: %s"] = "Your default craft value method was invalid so it has been returned to the default. Details: %s"
--[[Translation missing --]]
TSM.L["Your task list is currently empty."] = "Your task list is currently empty."
--[[Translation missing --]]
TSM.L["You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."] = "You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."
--[[Translation missing --]]
TSM.L["You've been undercut."] = "You've been undercut."
--[[Translation missing --]]
TSM.L["YY/MM/DD HH:MM"] = "YY/MM/DD HH:MM"
	elseif locale == "koKR" then
TSM.L = TSM.L or {}
--[[Translation missing --]]
TSM.L["%d |4Group:Groups; Selected (%d |4Item:Items;)"] = "%d |4Group:Groups; Selected (%d |4Item:Items;)"
--[[Translation missing --]]
TSM.L["%d auctions"] = "%d auctions"
--[[Translation missing --]]
TSM.L["%d Groups"] = "%d Groups"
--[[Translation missing --]]
TSM.L["%d Items"] = "%d Items"
--[[Translation missing --]]
TSM.L["%d of %d"] = "%d of %d"
--[[Translation missing --]]
TSM.L["%d Operations"] = "%d Operations"
--[[Translation missing --]]
TSM.L["%d Posted Auctions"] = "%d Posted Auctions"
--[[Translation missing --]]
TSM.L["%d Sold Auctions"] = "%d Sold Auctions"
TSM.L["%s (%s bags, %s bank, %s AH, %s mail)"] = "%s (%s 가방, %s 은행, %s 경매장, %s 우편) "
TSM.L["%s (%s player, %s alts, %s guild, %s AH)"] = "알트가 도대체 뭐지"
--[[Translation missing --]]
TSM.L["%s (%s profit)"] = "%s (%s profit)"
--[[Translation missing --]]
TSM.L["%s ago"] = "%s ago"
--[[Translation missing --]]
TSM.L["%s Crafts"] = "%s Crafts"
TSM.L["%s in guild vault"] = "%s 길드창고 "
TSM.L["%s is a valid custom price but %s is an invalid item."] = "%s은(는) 유효한 사용자 가격이지만 %s은(는) 유효하지 않은 아이템입니다."
TSM.L["%s is a valid custom price but did not give a value for %s."] = "%s은(는) 유효한 사용자 가격이지만 %s에 대한 가격은 없습니다."
--[[Translation missing --]]
TSM.L["'%s' is an invalid operation! Min restock of %d is higher than max restock of %d."] = "'%s' is an invalid operation! Min restock of %d is higher than max restock of %d."
TSM.L["%s is not a valid custom price and gave the following error: %s"] = "%s은(는) 유효하지 않은 사용자 가격이므로 에러가 발생하였습니다. %s"
--[[Translation missing --]]
TSM.L["%s operation(s)"] = "%s operation(s)"
TSM.L["%s removed."] = [=[%s 삭제됨
 ]=]
--[[Translation missing --]]
TSM.L["%s sent you %s"] = "%s sent you %s"
--[[Translation missing --]]
TSM.L["%s sent you %s and %s"] = "%s sent you %s and %s"
--[[Translation missing --]]
TSM.L["%s sent you a COD of %s for %s"] = "%s sent you a COD of %s for %s"
--[[Translation missing --]]
TSM.L["%s sent you a message: %s"] = "%s sent you a message: %s"
TSM.L["%s total"] = "총 %s  "
TSM.L["%sDrag%s to move this button"] = "%s드레그%s : 미니맵 아이콘 이동"
TSM.L["%sLeft-Click%s to open the main window"] = "%s좌클릭%s : 설정창 열기"
--[[Translation missing --]]
TSM.L["(%d/500 Characters)"] = "(%d/500 Characters)"
--[[Translation missing --]]
TSM.L["(max %d)"] = "(max %d)"
--[[Translation missing --]]
TSM.L["(max 200)"] = "(max 200)"
--[[Translation missing --]]
TSM.L["(max 5000)"] = "(max 5000)"
--[[Translation missing --]]
TSM.L["(min %d - max %d)"] = "(min %d - max %d)"
--[[Translation missing --]]
TSM.L["(min 0 - max 10000)"] = "(min 0 - max 10000)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 2)"] = "(minimum 0 - maximum 2)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 20)"] = "(minimum 0 - maximum 20)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 2000)"] = "(minimum 0 - maximum 2000)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 30)"] = "(minimum 0 - maximum 30)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 905)"] = "(minimum 0 - maximum 905)"
--[[Translation missing --]]
TSM.L["(minimum 0% - maximum 50%)"] = "(minimum 0% - maximum 50%)"
--[[Translation missing --]]
TSM.L["(minimum 0.5 - maximum 10)"] = "(minimum 0.5 - maximum 10)"
--[[Translation missing --]]
TSM.L["(minimum 1 - maximum 100)"] = "(minimum 1 - maximum 100)"
--[[Translation missing --]]
TSM.L["(minimum 8 - maximum 25)"] = "(minimum 8 - maximum 25)"
--[[Translation missing --]]
TSM.L["(New group(s) will be created)"] = "(New group(s) will be created)"
TSM.L["/tsm help|r - Shows this help listing"] = "/tsm help|r - 도움말 목록을 보여줍니다."
TSM.L["/tsm|r - opens the main TSM window."] = "/tsm|r - TSM 창을 엽니다."
--[[Translation missing --]]
TSM.L["_ Hr _ Min ago"] = "_ Hr _ Min ago"
--[[Translation missing --]]
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."] = "|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."
--[[Translation missing --]]
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."] = "|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."
--[[Translation missing --]]
TSM.L["|cffff0000WARNING:|r TSM_AuctionDB doesn't currently have any pricing data for your realm. Either download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update TSM_AuctionDB's data, or run a manual scan in-game."] = "|cffff0000WARNING:|r TSM_AuctionDB doesn't currently have any pricing data for your realm. Either download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update TSM_AuctionDB's data, or run a manual scan in-game."
--[[Translation missing --]]
TSM.L["|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."] = "|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."
--[[Translation missing --]]
TSM.L["|cffffd839Left-Click|r to ignore an item this session."] = "|cffffd839Left-Click|r to ignore an item this session."
--[[Translation missing --]]
TSM.L["|cffffd839Shift-Left-Click|r to ignore it permanently."] = "|cffffd839Shift-Left-Click|r to ignore it permanently."
--[[Translation missing --]]
TSM.L["1 Group"] = "1 Group"
--[[Translation missing --]]
TSM.L["1 Item"] = "1 Item"
--[[Translation missing --]]
TSM.L["12 hr"] = "12 hr"
--[[Translation missing --]]
TSM.L["24 hr"] = "24 hr"
--[[Translation missing --]]
TSM.L["48 hr"] = "48 hr"
TSM.L["A custom price of %s for %s evaluates to %s."] = "사용자 가격 %s인 %s의 평가 가치는 %s입니다."
TSM.L["A maximum of 1 convert() function is allowed."] = "convert() 함수가 허용하는 최대치는 1입니다."
--[[Translation missing --]]
TSM.L["A scan is already in progress. Please stop that scan before starting another one."] = "A scan is already in progress. Please stop that scan before starting another one."
--[[Translation missing --]]
TSM.L["Above max expires."] = "Above max expires."
--[[Translation missing --]]
TSM.L["Above max price. Not posting."] = "Above max price. Not posting."
--[[Translation missing --]]
TSM.L["Above max price. Posting at max price."] = "Above max price. Posting at max price."
--[[Translation missing --]]
TSM.L["Above max price. Posting at min price."] = "Above max price. Posting at min price."
--[[Translation missing --]]
TSM.L["Above max price. Posting at normal price."] = "Above max price. Posting at normal price."
--[[Translation missing --]]
TSM.L["Accepting these item(s) will cost"] = "Accepting these item(s) will cost"
--[[Translation missing --]]
TSM.L["Accepting this item will cost"] = "Accepting this item will cost"
--[[Translation missing --]]
TSM.L["Account sync removed. Please delete the account sync from the other account as well."] = "Account sync removed. Please delete the account sync from the other account as well."
TSM.L["Account Syncing"] = "계정 동기화 "
--[[Translation missing --]]
TSM.L["Accounting"] = "Accounting"
--[[Translation missing --]]
TSM.L["Accounting Tooltips"] = "Accounting Tooltips"
--[[Translation missing --]]
TSM.L["Activity Type"] = "Activity Type"
--[[Translation missing --]]
TSM.L["ADD %d ITEMS"] = "ADD %d ITEMS"
--[[Translation missing --]]
TSM.L["Add / Remove Items"] = "Add / Remove Items"
--[[Translation missing --]]
TSM.L["ADD NEW CUSTOM PRICE SOURCE"] = "ADD NEW CUSTOM PRICE SOURCE"
--[[Translation missing --]]
TSM.L["ADD OPERATION"] = "ADD OPERATION"
TSM.L["Add Player"] = "플레이어 추가"
--[[Translation missing --]]
TSM.L["Add Subject / Description"] = "Add Subject / Description"
--[[Translation missing --]]
TSM.L["Add Subject / Description (Optional)"] = "Add Subject / Description (Optional)"
--[[Translation missing --]]
TSM.L["ADD TO MAIL"] = "ADD TO MAIL"
TSM.L["Additional error suppressed"] = "추가적인 오류 표시 안 함"
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be auctioned."] = "Adjust the settings below to set how groups attached to this operation will be auctioned."
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be cancelled."] = "Adjust the settings below to set how groups attached to this operation will be cancelled."
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be priced."] = "Adjust the settings below to set how groups attached to this operation will be priced."
--[[Translation missing --]]
TSM.L["Advanced Item Search"] = "Advanced Item Search"
TSM.L["Advanced Options"] = "고급 옵션"
TSM.L["AH"] = "경매장 "
--[[Translation missing --]]
TSM.L["AH (Crafting)"] = "AH (Crafting)"
--[[Translation missing --]]
TSM.L["AH (Disenchanting)"] = "AH (Disenchanting)"
--[[Translation missing --]]
TSM.L["AH BUSY"] = "AH BUSY"
--[[Translation missing --]]
TSM.L["AH Frame Options"] = "AH Frame Options"
--[[Translation missing --]]
TSM.L["AH Rows Shown (requires reload)"] = "AH Rows Shown (requires reload)"
TSM.L["Alarm Clock"] = "알람 시계"
--[[Translation missing --]]
TSM.L["All Auctions"] = "All Auctions"
TSM.L["All Characters and Guilds"] = "모든 캐릭터와 길드"
--[[Translation missing --]]
TSM.L["All Professions"] = "All Professions"
--[[Translation missing --]]
TSM.L["Allow partial stack?"] = "Allow partial stack?"
--[[Translation missing --]]
TSM.L["Alt Guild Bank"] = "Alt Guild Bank"
--[[Translation missing --]]
TSM.L["Alts"] = "Alts"
--[[Translation missing --]]
TSM.L["Alts AH"] = "Alts AH"
--[[Translation missing --]]
TSM.L["Amount"] = "Amount"
--[[Translation missing --]]
TSM.L["AMOUNT"] = "AMOUNT"
--[[Translation missing --]]
TSM.L["Amount of Bag Space to Keep Free"] = "Amount of Bag Space to Keep Free"
TSM.L["Applied %s to %s."] = "%s을(를) %s에 적용하였습니다."
--[[Translation missing --]]
TSM.L["APPLY FILTERS"] = "APPLY FILTERS"
TSM.L["Apply operation to group:"] = "작업을 그룹에 적용:"
--[[Translation missing --]]
TSM.L["Are you sure you want to clear old accounting data?"] = "Are you sure you want to clear old accounting data?"
TSM.L["Are you sure you want to delete this group?"] = "정말로 선택된 그룹을 지우시겠습니까?"
TSM.L["Are you sure you want to delete this operation?"] = "정말로 선택된 작업을 지우시겠습니까?"
--[[Translation missing --]]
TSM.L["Are you sure you want to reset all operation settings?"] = "Are you sure you want to reset all operation settings?"
--[[Translation missing --]]
TSM.L["At above max price and not undercut."] = "At above max price and not undercut."
--[[Translation missing --]]
TSM.L["At normal price and not undercut."] = "At normal price and not undercut."
--[[Translation missing --]]
TSM.L["Auction"] = "Auction"
--[[Translation missing --]]
TSM.L["AUCTION DETAILS"] = "AUCTION DETAILS"
--[[Translation missing --]]
TSM.L["Auction Duration"] = "Auction Duration"
--[[Translation missing --]]
TSM.L["Auction has been bid on."] = "Auction has been bid on."
TSM.L["Auction Window Close"] = "경매장 창 종료음 "
TSM.L["Auction Window Open"] = "경매장 창 종료음"
TSM.L["Auctionator - Auction Value"] = "Auctionator - 경매가"
TSM.L["Auctioneer - Appraiser"] = "Auctioneer -  감정인"
TSM.L["Auctioneer - Market Value"] = "Auctioneer - 시장가"
TSM.L["Auctioneer - Minimum Buyout"] = "Auctioneer - 최소 구매가"
--[[Translation missing --]]
TSM.L["Auctioning"] = "Auctioning"
--[[Translation missing --]]
TSM.L["Auctioning Log"] = "Auctioning Log"
--[[Translation missing --]]
TSM.L["Auctioning Operation"] = "Auctioning Operation"
--[[Translation missing --]]
TSM.L["Auctioning 'POST'/'CANCEL' Button"] = "Auctioning 'POST'/'CANCEL' Button"
TSM.L["Auctions"] = "경매"
TSM.L["Auto Quest Complete"] = "자동 퀘스트 완료음"
--[[Translation missing --]]
TSM.L["Automatically sell vendor trash?"] = "Automatically sell vendor trash?"
--[[Translation missing --]]
TSM.L["Average Earned Per Day:"] = "Average Earned Per Day:"
--[[Translation missing --]]
TSM.L["Average Prices:"] = "Average Prices:"
--[[Translation missing --]]
TSM.L["Average Profit Per Day:"] = "Average Profit Per Day:"
--[[Translation missing --]]
TSM.L["Average Spent Per Day:"] = "Average Spent Per Day:"
--[[Translation missing --]]
TSM.L["Avg Buy Price"] = "Avg Buy Price"
--[[Translation missing --]]
TSM.L["Avg Resale Profit"] = "Avg Resale Profit"
--[[Translation missing --]]
TSM.L["Avg Sell Price"] = "Avg Sell Price"
--[[Translation missing --]]
TSM.L["BACK TO LIST"] = "BACK TO LIST"
--[[Translation missing --]]
TSM.L["Back to List"] = "Back to List"
--[[Translation missing --]]
TSM.L["Bag"] = "Bag"
TSM.L["Bags"] = "가방 "
--[[Translation missing --]]
TSM.L["Banks"] = "Banks"
TSM.L["BankUI Move Delay"] = "은행UI 이동 딜레이"
--[[Translation missing --]]
TSM.L["Base Group"] = "Base Group"
--[[Translation missing --]]
TSM.L["Base Item"] = "Base Item"
--[[Translation missing --]]
TSM.L["Batch size"] = "Batch size"
--[[Translation missing --]]
TSM.L["Below are your currently available price sources organized by module. The %skey|r is what you would type into a custom price box."] = "Below are your currently available price sources organized by module. The %skey|r is what you would type into a custom price box."
--[[Translation missing --]]
TSM.L["Below custom price:"] = "Below custom price:"
--[[Translation missing --]]
TSM.L["Below min price. Posting at max price."] = "Below min price. Posting at max price."
--[[Translation missing --]]
TSM.L["Below min price. Posting at min price."] = "Below min price. Posting at min price."
--[[Translation missing --]]
TSM.L["Below min price. Posting at normal price."] = "Below min price. Posting at normal price."
--[[Translation missing --]]
TSM.L["Below, you can manage your profiles which allow you to have entirely different sets of groups."] = "Below, you can manage your profiles which allow you to have entirely different sets of groups."
--[[Translation missing --]]
TSM.L["Bid %d / %d"] = "Bid %d / %d"
--[[Translation missing --]]
TSM.L["Bid (item)"] = "Bid (item)"
--[[Translation missing --]]
TSM.L["Bid (stack)"] = "Bid (stack)"
--[[Translation missing --]]
TSM.L["Bid Price"] = "Bid Price"
--[[Translation missing --]]
TSM.L["Bid Sniper Paused"] = "Bid Sniper Paused"
--[[Translation missing --]]
TSM.L["Bid Sniper Running"] = "Bid Sniper Running"
TSM.L["Blacklisted players:"] = "차단된 플레이어:"
--[[Translation missing --]]
TSM.L["Bought"] = "Bought"
--[[Translation missing --]]
TSM.L["Bought %sx%d for %s from %s"] = "Bought %sx%d for %s from %s"
--[[Translation missing --]]
TSM.L["Bound Actions"] = "Bound Actions"
--[[Translation missing --]]
TSM.L["BUSY"] = "BUSY"
--[[Translation missing --]]
TSM.L["BUY"] = "BUY"
--[[Translation missing --]]
TSM.L["Buy"] = "Buy"
--[[Translation missing --]]
TSM.L["Buy %d / %d"] = "Buy %d / %d"
--[[Translation missing --]]
TSM.L["Buy %d / %d (Confirming %d / %d)"] = "Buy %d / %d (Confirming %d / %d)"
--[[Translation missing --]]
TSM.L["Buy from AH"] = "Buy from AH"
TSM.L["Buy from Vendor"] = "상인에게 구매"
--[[Translation missing --]]
TSM.L["BUY GROUPS"] = "BUY GROUPS"
--[[Translation missing --]]
TSM.L["Buy Options"] = "Buy Options"
--[[Translation missing --]]
TSM.L["BUYBACK ALL"] = "BUYBACK ALL"
--[[Translation missing --]]
TSM.L["Buyer/Seller"] = "Buyer/Seller"
--[[Translation missing --]]
TSM.L["Buyout (item)"] = "Buyout (item)"
--[[Translation missing --]]
TSM.L["Buyout (stack)"] = "Buyout (stack)"
--[[Translation missing --]]
TSM.L["Buyout Price"] = "Buyout Price"
--[[Translation missing --]]
TSM.L["Buyout Sniper Paused"] = "Buyout Sniper Paused"
--[[Translation missing --]]
TSM.L["Buyout Sniper Running"] = "Buyout Sniper Running"
--[[Translation missing --]]
TSM.L["BUYS"] = "BUYS"
--[[Translation missing --]]
TSM.L["By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."] = "By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."
--[[Translation missing --]]
TSM.L["Can Craft At Least One, Profit, Craftable Quantity"] = "Can Craft At Least One, Profit, Craftable Quantity"
--[[Translation missing --]]
TSM.L["Cancel auctions with bids"] = "Cancel auctions with bids"
--[[Translation missing --]]
TSM.L["Cancel Scan"] = "Cancel Scan"
--[[Translation missing --]]
TSM.L["Cancel to repost higher?"] = "Cancel to repost higher?"
--[[Translation missing --]]
TSM.L["Cancel undercut auctions?"] = "Cancel undercut auctions?"
--[[Translation missing --]]
TSM.L["Canceling"] = "Canceling"
--[[Translation missing --]]
TSM.L["Canceling %d / %d"] = "Canceling %d / %d"
--[[Translation missing --]]
TSM.L["Canceling %d Auctions..."] = "Canceling %d Auctions..."
--[[Translation missing --]]
TSM.L["Canceling all auctions."] = "Canceling all auctions."
--[[Translation missing --]]
TSM.L["Canceling auction which you've undercut."] = "Canceling auction which you've undercut."
--[[Translation missing --]]
TSM.L["Canceling disabled."] = "Canceling disabled."
--[[Translation missing --]]
TSM.L["Canceling Settings"] = "Canceling Settings"
--[[Translation missing --]]
TSM.L["Canceling to repost at higher price."] = "Canceling to repost at higher price."
--[[Translation missing --]]
TSM.L["Canceling to repost at reset price."] = "Canceling to repost at reset price."
--[[Translation missing --]]
TSM.L["Canceling to repost higher."] = "Canceling to repost higher."
--[[Translation missing --]]
TSM.L["Canceling undercut auctions and to repost higher."] = "Canceling undercut auctions and to repost higher."
--[[Translation missing --]]
TSM.L["Canceling undercut auctions."] = "Canceling undercut auctions."
--[[Translation missing --]]
TSM.L["Cancelled"] = "Cancelled"
--[[Translation missing --]]
TSM.L["Cancelled auction of %sx%d"] = "Cancelled auction of %sx%d"
--[[Translation missing --]]
TSM.L["Cancelled Since Last Sale"] = "Cancelled Since Last Sale"
--[[Translation missing --]]
TSM.L["CANCELS"] = "CANCELS"
--[[Translation missing --]]
TSM.L["Cannot repair from the guild bank!"] = "Cannot repair from the guild bank!"
TSM.L["Can't load TSM tooltip while in combat"] = "전투 중에는 TSM 툴팁을 불러올 수 없습니다. "
TSM.L["Cash Register"] = "금전 등록기음"
--[[Translation missing --]]
TSM.L["Character"] = "Character"
--[[Translation missing --]]
TSM.L["CHARACTER"] = "CHARACTER"
--[[Translation missing --]]
TSM.L["Character Bags"] = "Character Bags"
--[[Translation missing --]]
TSM.L["Character Bank"] = "Character Bank"
--[[Translation missing --]]
TSM.L["CHARACTERS"] = "CHARACTERS"
TSM.L["Chat Tab"] = "채팅 탭"
--[[Translation missing --]]
TSM.L["Cheapest auction below min price."] = "Cheapest auction below min price."
--[[Translation missing --]]
TSM.L["Clean Automatically"] = "Clean Automatically"
TSM.L["Clear"] = "해제"
--[[Translation missing --]]
TSM.L["Clear All"] = "Clear All"
--[[Translation missing --]]
TSM.L["CLEAR DATA"] = "CLEAR DATA"
--[[Translation missing --]]
TSM.L["Clear Filters"] = "Clear Filters"
--[[Translation missing --]]
TSM.L["Clear Log After 'X' Amount of Days"] = "Clear Log After 'X' Amount of Days"
--[[Translation missing --]]
TSM.L["Clear Old Data"] = "Clear Old Data"
--[[Translation missing --]]
TSM.L["Clear Old Data Confirmation"] = "Clear Old Data Confirmation"
--[[Translation missing --]]
TSM.L["Clear Queue"] = "Clear Queue"
TSM.L["Clear Selection"] = "선택 해제"
--[[Translation missing --]]
TSM.L["COD"] = "COD"
TSM.L["Coins (%s)"] = "동전 (%s)"
--[[Translation missing --]]
TSM.L["Combine Partial Stacks"] = "Combine Partial Stacks"
--[[Translation missing --]]
TSM.L["Combining..."] = "Combining..."
--[[Translation missing --]]
TSM.L["Configuration Scroll Wheel"] = "Configuration Scroll Wheel"
--[[Translation missing --]]
TSM.L["Confirm"] = "Confirm"
--[[Translation missing --]]
TSM.L["Confirm Complete Sound"] = "Confirm Complete Sound"
--[[Translation missing --]]
TSM.L["Confirming %d / %d"] = "Confirming %d / %d"
--[[Translation missing --]]
TSM.L["Connected to %s"] = "Connected to %s"
--[[Translation missing --]]
TSM.L["Connecting to %s"] = "Connecting to %s"
--[[Translation missing --]]
TSM.L["CONTACTS"] = "CONTACTS"
--[[Translation missing --]]
TSM.L["Contacts Menu"] = "Contacts Menu"
--[[Translation missing --]]
TSM.L["Cooldown"] = "Cooldown"
--[[Translation missing --]]
TSM.L["Cooldowns"] = "Cooldowns"
--[[Translation missing --]]
TSM.L["Cost"] = "Cost"
--[[Translation missing --]]
TSM.L["Could not apply %s operation %s to %s - it has too many operations already."] = "Could not apply %s operation %s to %s - it has too many operations already."
--[[Translation missing --]]
TSM.L["Could not apply %s operation to group %s because the group does not exist"] = "Could not apply %s operation to group %s because the group does not exist"
--[[Translation missing --]]
TSM.L["Could not create macro as you already have too many. Delete one of your existing macros and try again."] = "Could not create macro as you already have too many. Delete one of your existing macros and try again."
--[[Translation missing --]]
TSM.L["Could not deserialize input"] = "Could not deserialize input"
--[[Translation missing --]]
TSM.L["Could not find enchanted item from"] = "Could not find enchanted item from"
--[[Translation missing --]]
TSM.L["Could not find pet"] = "Could not find pet"
--[[Translation missing --]]
TSM.L["Could not find profile '%s'. Possible profiles: '%s'"] = "Could not find profile '%s'. Possible profiles: '%s'"
--[[Translation missing --]]
TSM.L["Could not sell items due to not having free bag space available to split a stack of items."] = "Could not sell items due to not having free bag space available to split a stack of items."
--[[Translation missing --]]
TSM.L["Craft"] = "Craft"
--[[Translation missing --]]
TSM.L["CRAFT"] = "CRAFT"
--[[Translation missing --]]
TSM.L["Craft (Unprofitable)"] = "Craft (Unprofitable)"
--[[Translation missing --]]
TSM.L["Craft (When Profitable)"] = "Craft (When Profitable)"
--[[Translation missing --]]
TSM.L["Craft All"] = "Craft All"
--[[Translation missing --]]
TSM.L["CRAFT ALL"] = "CRAFT ALL"
--[[Translation missing --]]
TSM.L["Craft Name"] = "Craft Name"
--[[Translation missing --]]
TSM.L["CRAFT NEXT"] = "CRAFT NEXT"
--[[Translation missing --]]
TSM.L["Craft value method:"] = "Craft value method:"
--[[Translation missing --]]
TSM.L["Craftable Quantity, Profit"] = "Craftable Quantity, Profit"
--[[Translation missing --]]
TSM.L["CRAFTER"] = "CRAFTER"
--[[Translation missing --]]
TSM.L["CRAFTING"] = "CRAFTING"
--[[Translation missing --]]
TSM.L["Crafting"] = "Crafting"
--[[Translation missing --]]
TSM.L["Crafting Cost"] = "Crafting Cost"
--[[Translation missing --]]
TSM.L["Crafting 'CRAFT NEXT' Button"] = "Crafting 'CRAFT NEXT' Button"
--[[Translation missing --]]
TSM.L["Crafting Queue"] = "Crafting Queue"
--[[Translation missing --]]
TSM.L["Crafting Tooltips"] = "Crafting Tooltips"
--[[Translation missing --]]
TSM.L["Crafts"] = "Crafts"
--[[Translation missing --]]
TSM.L["Crafts %d"] = "Crafts %d"
--[[Translation missing --]]
TSM.L["CREATE MACRO"] = "CREATE MACRO"
TSM.L["Create New Operation"] = "새 작업 생성 "
--[[Translation missing --]]
TSM.L["CREATE NEW PROFILE"] = "CREATE NEW PROFILE"
TSM.L["Crystals"] = "수정"
--[[Translation missing --]]
TSM.L["Current Profiles"] = "Current Profiles"
--[[Translation missing --]]
TSM.L["CURRENT SEARCH"] = "CURRENT SEARCH"
--[[Translation missing --]]
TSM.L["CUSTOM POST"] = "CUSTOM POST"
--[[Translation missing --]]
TSM.L["Custom Price"] = "Custom Price"
TSM.L["Custom Price Source"] = "사용자 가격 출처"
--[[Translation missing --]]
TSM.L["Custom Sources"] = "Custom Sources"
--[[Translation missing --]]
TSM.L["Database Sources"] = "Database Sources"
--[[Translation missing --]]
TSM.L["DD/MM/YY HH:MM"] = "DD/MM/YY HH:MM"
--[[Translation missing --]]
TSM.L["Default Craft Value Method:"] = "Default Craft Value Method:"
--[[Translation missing --]]
TSM.L["Default Material Cost Method:"] = "Default Material Cost Method:"
--[[Translation missing --]]
TSM.L["Default Price"] = "Default Price"
--[[Translation missing --]]
TSM.L["Default Price Configuration"] = "Default Price Configuration"
--[[Translation missing --]]
TSM.L["Default vendoring page"] = "Default vendoring page"
--[[Translation missing --]]
TSM.L["Define whet priority Gathering gives certain sources."] = "Define whet priority Gathering gives certain sources."
--[[Translation missing --]]
TSM.L["Delete Profile Confirmation"] = "Delete Profile Confirmation"
--[[Translation missing --]]
TSM.L["DEPOSIT REAGENTS"] = "DEPOSIT REAGENTS"
TSM.L["Deselect All Groups"] = "모든 그룹 해제"
--[[Translation missing --]]
TSM.L["Deselect All Items"] = "Deselect All Items"
--[[Translation missing --]]
TSM.L["Destroy Next"] = "Destroy Next"
--[[Translation missing --]]
TSM.L["Destroy Value"] = "Destroy Value"
--[[Translation missing --]]
TSM.L["Destroy Value Source"] = "Destroy Value Source"
--[[Translation missing --]]
TSM.L["Destroying"] = "Destroying"
--[[Translation missing --]]
TSM.L["Destroying 'DESTROY NEXT' Button"] = "Destroying 'DESTROY NEXT' Button"
--[[Translation missing --]]
TSM.L["Destroying Tooltips"] = "Destroying Tooltips"
--[[Translation missing --]]
TSM.L["Destroying..."] = "Destroying..."
--[[Translation missing --]]
TSM.L["Details"] = "Details"
--[[Translation missing --]]
TSM.L["Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."] = "Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your maximum price (%s) is invalid. Check your settings."] = "Did not cancel %s because your maximum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your minimum price (%s) is invalid. Check your settings."] = "Did not cancel %s because your minimum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your normal price (%s) is invalid. Check your settings."] = "Did not cancel %s because your normal price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your undercut (%s) is invalid. Check your settings."] = "Did not cancel %s because your undercut (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."] = "Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."
--[[Translation missing --]]
TSM.L["Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."] = "Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."
--[[Translation missing --]]
TSM.L["Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."] = "Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."
--[[Translation missing --]]
TSM.L["Did not post %s because your maximum price (%s) is invalid. Check your settings."] = "Did not post %s because your maximum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your minimum price (%s) is invalid. Check your settings."] = "Did not post %s because your minimum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your normal price (%s) is invalid. Check your settings."] = "Did not post %s because your normal price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your stack size (%d) is higher than the max stack size of the item (%d)."] = "Did not post %s because your stack size (%d) is higher than the max stack size of the item (%d)."
--[[Translation missing --]]
TSM.L["Did not post %s because your undercut (%s) is invalid. Check your settings."] = "Did not post %s because your undercut (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Disable invalid price warnings"] = "Disable invalid price warnings"
--[[Translation missing --]]
TSM.L["Disenchant Search"] = "Disenchant Search"
--[[Translation missing --]]
TSM.L["DISENCHANT SEARCH"] = "DISENCHANT SEARCH"
--[[Translation missing --]]
TSM.L["Disenchant Search Options"] = "Disenchant Search Options"
--[[Translation missing --]]
TSM.L["Disenchant Value"] = "Disenchant Value"
--[[Translation missing --]]
TSM.L["Disenchanting Options"] = "Disenchanting Options"
--[[Translation missing --]]
TSM.L["Display auctioning values"] = "Display auctioning values"
--[[Translation missing --]]
TSM.L["Display cancelled since last sale"] = "Display cancelled since last sale"
--[[Translation missing --]]
TSM.L["Display crafting cost"] = "Display crafting cost"
--[[Translation missing --]]
TSM.L["Display detailed destroy info"] = "Display detailed destroy info"
--[[Translation missing --]]
TSM.L["Display disenchant value"] = "Display disenchant value"
--[[Translation missing --]]
TSM.L["Display global historical price"] = "Display global historical price"
--[[Translation missing --]]
TSM.L["Display global market value avg"] = "Display global market value avg"
--[[Translation missing --]]
TSM.L["Display global min buyout avg"] = "Display global min buyout avg"
--[[Translation missing --]]
TSM.L["Display global sale avg"] = "Display global sale avg"
--[[Translation missing --]]
TSM.L["Display group name"] = "Display group name"
--[[Translation missing --]]
TSM.L["Display historical price"] = "Display historical price"
--[[Translation missing --]]
TSM.L["Display market value"] = "Display market value"
--[[Translation missing --]]
TSM.L["Display mill value"] = "Display mill value"
--[[Translation missing --]]
TSM.L["Display min buyout"] = "Display min buyout"
TSM.L["Display Operation Names"] = "작업 이름 표시"
--[[Translation missing --]]
TSM.L["Display prospect value"] = "Display prospect value"
--[[Translation missing --]]
TSM.L["Display purchase info"] = "Display purchase info"
--[[Translation missing --]]
TSM.L["Display region historical price"] = "Display region historical price"
--[[Translation missing --]]
TSM.L["Display region market value avg"] = "Display region market value avg"
--[[Translation missing --]]
TSM.L["Display region min buyout avg"] = "Display region min buyout avg"
--[[Translation missing --]]
TSM.L["Display region sale avg"] = "Display region sale avg"
--[[Translation missing --]]
TSM.L["Display region sale rate"] = "Display region sale rate"
--[[Translation missing --]]
TSM.L["Display region sold per day"] = "Display region sold per day"
--[[Translation missing --]]
TSM.L["Display sale info"] = "Display sale info"
--[[Translation missing --]]
TSM.L["Display sale rate"] = "Display sale rate"
--[[Translation missing --]]
TSM.L["Display shopping max price"] = "Display shopping max price"
--[[Translation missing --]]
TSM.L["Display total money recieved in chat?"] = "Display total money recieved in chat?"
--[[Translation missing --]]
TSM.L["Display transform value"] = "Display transform value"
--[[Translation missing --]]
TSM.L["Display vendor buy price"] = "Display vendor buy price"
--[[Translation missing --]]
TSM.L["Display vendor sell price"] = "Display vendor sell price"
--[[Translation missing --]]
TSM.L["Doing so will also remove any sub-groups attached to this group."] = "Doing so will also remove any sub-groups attached to this group."
--[[Translation missing --]]
TSM.L["Done Canceling"] = "Done Canceling"
--[[Translation missing --]]
TSM.L["Done Posting"] = "Done Posting"
--[[Translation missing --]]
TSM.L["Done Scanning"] = "Done Scanning"
--[[Translation missing --]]
TSM.L["Don't post after this many expires:"] = "Don't post after this many expires:"
--[[Translation missing --]]
TSM.L["Don't Post Items"] = "Don't Post Items"
--[[Translation missing --]]
TSM.L["Don't prompt to record trades"] = "Don't prompt to record trades"
--[[Translation missing --]]
TSM.L["DOWN"] = "DOWN"
--[[Translation missing --]]
TSM.L["Drag in Additional Items (%d/%d Items)"] = "Drag in Additional Items (%d/%d Items)"
--[[Translation missing --]]
TSM.L["Drag Item(s) Into Box"] = "Drag Item(s) Into Box"
--[[Translation missing --]]
TSM.L["Duplicate"] = "Duplicate"
--[[Translation missing --]]
TSM.L["Duplicate Profile Confirmation"] = "Duplicate Profile Confirmation"
TSM.L["Dust"] = "가루(티끌)"
--[[Translation missing --]]
TSM.L["Elevate your gold-making!"] = "Elevate your gold-making!"
--[[Translation missing --]]
TSM.L["Embed TSM tooltips"] = "Embed TSM tooltips"
--[[Translation missing --]]
TSM.L["EMPTY BAGS"] = "EMPTY BAGS"
--[[Translation missing --]]
TSM.L["Empty parentheses are not allowed"] = "Empty parentheses are not allowed"
TSM.L["Empty price string."] = "빈 가격 문자열."
--[[Translation missing --]]
TSM.L["Enable automatic stack combination"] = "Enable automatic stack combination"
--[[Translation missing --]]
TSM.L["Enable buying?"] = "Enable buying?"
--[[Translation missing --]]
TSM.L["Enable inbox chat messages"] = "Enable inbox chat messages"
--[[Translation missing --]]
TSM.L["Enable restock?"] = "Enable restock?"
--[[Translation missing --]]
TSM.L["Enable selling?"] = "Enable selling?"
--[[Translation missing --]]
TSM.L["Enable sending chat messages"] = "Enable sending chat messages"
--[[Translation missing --]]
TSM.L["Enable smart crafting for quests"] = "Enable smart crafting for quests"
TSM.L["Enable TSM Tooltips"] = "TSM 툴팁 사용"
--[[Translation missing --]]
TSM.L["Enable tweet enhancement"] = "Enable tweet enhancement"
--[[Translation missing --]]
TSM.L["Enchant Vellum"] = "Enchant Vellum"
--[[Translation missing --]]
TSM.L["Enter a name for the new profile"] = "Enter a name for the new profile"
--[[Translation missing --]]
TSM.L["Enter Filter"] = "Enter Filter"
--[[Translation missing --]]
TSM.L["Enter Keyword"] = "Enter Keyword"
--[[Translation missing --]]
TSM.L["Enter name of logged-in character from other account"] = "Enter name of logged-in character from other account"
TSM.L["Enter player name"] = "플레이어 이름 입력"
TSM.L["Essences"] = "정수"
--[[Translation missing --]]
TSM.L["Establishing connection to %s. Make sure that you've entered this character's name on the other account."] = "Establishing connection to %s. Make sure that you've entered this character's name on the other account."
--[[Translation missing --]]
TSM.L["Estimated Cost:"] = "Estimated Cost:"
--[[Translation missing --]]
TSM.L["Estimated Profit:"] = "Estimated Profit:"
--[[Translation missing --]]
TSM.L["Exact Match Only?"] = "Exact Match Only?"
--[[Translation missing --]]
TSM.L["Exclude crafts with cooldowns"] = "Exclude crafts with cooldowns"
--[[Translation missing --]]
TSM.L["Expenses"] = "Expenses"
--[[Translation missing --]]
TSM.L["EXPENSES"] = "EXPENSES"
--[[Translation missing --]]
TSM.L["Expired"] = "Expired"
--[[Translation missing --]]
TSM.L["Expired Since Last Sale"] = "Expired Since Last Sale"
--[[Translation missing --]]
TSM.L["Expires"] = "Expires"
--[[Translation missing --]]
TSM.L["EXPIRES"] = "EXPIRES"
TSM.L["Exploration"] = "폭발음"
TSM.L["Export"] = "내보내기"
--[[Translation missing --]]
TSM.L["Export List"] = "Export List"
--[[Translation missing --]]
TSM.L["Failed Auctions"] = "Failed Auctions"
--[[Translation missing --]]
TSM.L["Failed Since Last Sale (Expired/Cancelled)"] = "Failed Since Last Sale (Expired/Cancelled)"
--[[Translation missing --]]
TSM.L["Failed to bid on auction of %s."] = "Failed to bid on auction of %s."
--[[Translation missing --]]
TSM.L["Failed to buy auction of %s."] = "Failed to buy auction of %s."
--[[Translation missing --]]
TSM.L["Failed to find auction for %s, so removing it from the results."] = "Failed to find auction for %s, so removing it from the results."
--[[Translation missing --]]
TSM.L["Favorite Scans"] = "Favorite Scans"
--[[Translation missing --]]
TSM.L["Favorite Searches"] = "Favorite Searches"
--[[Translation missing --]]
TSM.L["Filter Auctions by Duration"] = "Filter Auctions by Duration"
--[[Translation missing --]]
TSM.L["Filter Auctions by Keyword"] = "Filter Auctions by Keyword"
--[[Translation missing --]]
TSM.L["FILTER BY KEYWORD"] = "FILTER BY KEYWORD"
--[[Translation missing --]]
TSM.L["Filter by Keyword"] = "Filter by Keyword"
--[[Translation missing --]]
TSM.L["Filter group item lists based on the following price source"] = "Filter group item lists based on the following price source"
--[[Translation missing --]]
TSM.L["Filter Items"] = "Filter Items"
--[[Translation missing --]]
TSM.L["Filter Shopping"] = "Filter Shopping"
--[[Translation missing --]]
TSM.L["Finding Selected Auction"] = "Finding Selected Auction"
TSM.L["Fishing Reel In"] = "낚시 릴 스피닝음"
--[[Translation missing --]]
TSM.L["Forget Character"] = "Forget Character"
--[[Translation missing --]]
TSM.L["Found auction sound"] = "Found auction sound"
--[[Translation missing --]]
TSM.L["Friends"] = "Friends"
--[[Translation missing --]]
TSM.L["From"] = "From"
TSM.L["Full"] = "가득참"
--[[Translation missing --]]
TSM.L["Garrison"] = "Garrison"
--[[Translation missing --]]
TSM.L["Gathering"] = "Gathering"
--[[Translation missing --]]
TSM.L["Gathering Search"] = "Gathering Search"
TSM.L["General Options"] = "일반 옵션"
--[[Translation missing --]]
TSM.L["Get from Bank"] = "Get from Bank"
--[[Translation missing --]]
TSM.L["Get from Guild Bank"] = "Get from Guild Bank"
--[[Translation missing --]]
TSM.L["Global Data Tooltips"] = "Global Data Tooltips"
--[[Translation missing --]]
TSM.L["Global Historical Price"] = "Global Historical Price"
--[[Translation missing --]]
TSM.L["Global Market Value Avg"] = "Global Market Value Avg"
--[[Translation missing --]]
TSM.L["Global Min Buyout Avg"] = "Global Min Buyout Avg"
--[[Translation missing --]]
TSM.L["Global Operation Confirmation"] = "Global Operation Confirmation"
--[[Translation missing --]]
TSM.L["Global Sale Avg"] = "Global Sale Avg"
TSM.L["Gold"] = "골드"
TSM.L["Gold Earned:"] = "번 골드:"
--[[Translation missing --]]
TSM.L["GOLD ON HAND"] = "GOLD ON HAND"
TSM.L["Gold Spent:"] = "쓴 골드:"
--[[Translation missing --]]
TSM.L["GREAT DEALS SEARCH"] = "GREAT DEALS SEARCH"
--[[Translation missing --]]
TSM.L["Group already exists."] = "Group already exists."
TSM.L["Group Management"] = "그룹 관리"
--[[Translation missing --]]
TSM.L["Group Operations"] = "Group Operations"
--[[Translation missing --]]
TSM.L["Group Settings"] = "Group Settings"
--[[Translation missing --]]
TSM.L["Grouped Items"] = "Grouped Items"
TSM.L["Groups"] = "그룹"
--[[Translation missing --]]
TSM.L["Guild"] = "Guild"
--[[Translation missing --]]
TSM.L["Guild Bank"] = "Guild Bank"
--[[Translation missing --]]
TSM.L["GUILDS"] = "GUILDS"
--[[Translation missing --]]
TSM.L["GVault"] = "GVault"
--[[Translation missing --]]
TSM.L["Have"] = "Have"
--[[Translation missing --]]
TSM.L["Have Materials"] = "Have Materials"
--[[Translation missing --]]
TSM.L["Have Skill Up"] = "Have Skill Up"
--[[Translation missing --]]
TSM.L["Help & Info"] = "Help & Info"
--[[Translation missing --]]
TSM.L["Hide auctions with bids"] = "Hide auctions with bids"
--[[Translation missing --]]
TSM.L["Hide Description"] = "Hide Description"
--[[Translation missing --]]
TSM.L["Hide minimap icon"] = "Hide minimap icon"
--[[Translation missing --]]
TSM.L["Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."] = "Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."
--[[Translation missing --]]
TSM.L["Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."] = "Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."
--[[Translation missing --]]
TSM.L["High Bidder"] = "High Bidder"
--[[Translation missing --]]
TSM.L["Historical Price"] = "Historical Price"
--[[Translation missing --]]
TSM.L["Hold ALT to repair from the guild bank."] = "Hold ALT to repair from the guild bank."
--[[Translation missing --]]
TSM.L["Hr"] = "Hr"
--[[Translation missing --]]
TSM.L["Hrs"] = "Hrs"
--[[Translation missing --]]
TSM.L["I just bought [%s]x%d for %s! %s #TSM4 #warcraft"] = "I just bought [%s]x%d for %s! %s #TSM4 #warcraft"
--[[Translation missing --]]
TSM.L["I just sold [%s] for %s! %s #TSM4 #warcraft"] = "I just sold [%s] for %s! %s #TSM4 #warcraft"
--[[Translation missing --]]
TSM.L["If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."] = "If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."
TSM.L["If you have multiple profile set up with operations, enabling this will cause all but the current profile's operations to be irreversibly lost. Are you sure you want to continue?"] = "다중 프로파일이 작업과 연결되어 있을 때 사용하면 모든 프로파일에 적용되지만 현재 프로파일의 작업은 복구 불가능한 손실이 발생합니다. 계속 하시겠습니까?"
--[[Translation missing --]]
TSM.L["If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."] = "If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."
--[[Translation missing --]]
TSM.L["Ignore Auctions Below Min"] = "Ignore Auctions Below Min"
--[[Translation missing --]]
TSM.L["Ignore auctions by duration?"] = "Ignore auctions by duration?"
--[[Translation missing --]]
TSM.L["Ignore Characters"] = "Ignore Characters"
--[[Translation missing --]]
TSM.L["Ignore duplicate operations?"] = "Ignore duplicate operations?"
TSM.L["Ignore Guilds"] = "길드 제외시키기"
--[[Translation missing --]]
TSM.L["Ignore operation on characters:"] = "Ignore operation on characters:"
--[[Translation missing --]]
TSM.L["Ignore operation on faction-realms:"] = "Ignore operation on faction-realms:"
--[[Translation missing --]]
TSM.L["Ignore random enchants?"] = "Ignore random enchants?"
--[[Translation missing --]]
TSM.L["Ignored Cooldowns"] = "Ignored Cooldowns"
--[[Translation missing --]]
TSM.L["Ignored Items"] = "Ignored Items"
--[[Translation missing --]]
TSM.L["ilvl"] = "ilvl"
TSM.L["Import"] = "가져오기"
TSM.L["IMPORT"] = "가져오기"
--[[Translation missing --]]
TSM.L["Import %d Items and %s Operations?"] = "Import %d Items and %s Operations?"
--[[Translation missing --]]
TSM.L["Import Groups & Operations"] = "Import Groups & Operations"
--[[Translation missing --]]
TSM.L["Imported Items"] = "Imported Items"
--[[Translation missing --]]
TSM.L["Imported Operations"] = "Imported Operations"
--[[Translation missing --]]
TSM.L["Inbox Settings"] = "Inbox Settings"
--[[Translation missing --]]
TSM.L["Include Attached Operations"] = "Include Attached Operations"
--[[Translation missing --]]
TSM.L["Include operations?"] = "Include operations?"
--[[Translation missing --]]
TSM.L["Include soulbound items"] = "Include soulbound items"
TSM.L["Information"] = "정보"
--[[Translation missing --]]
TSM.L["Invalid custom price entered."] = "Invalid custom price entered."
--[[Translation missing --]]
TSM.L["Invalid custom price source for %s. %s"] = "Invalid custom price source for %s. %s"
TSM.L["Invalid custom price."] = "잘못된 사용자 가격입니다."
TSM.L["Invalid function."] = "잘못된 함수입니다."
--[[Translation missing --]]
TSM.L["Invalid group name."] = "Invalid group name."
TSM.L["Invalid item link."] = "잘못된 아이템 링크입니다."
--[[Translation missing --]]
TSM.L["Invalid operation name."] = "Invalid operation name."
--[[Translation missing --]]
TSM.L["Invalid operator at end of custom price."] = "Invalid operator at end of custom price."
--[[Translation missing --]]
TSM.L["Invalid parameter to price source."] = "Invalid parameter to price source."
TSM.L["Invalid player name."] = "잘못된 플레이어 이름입니다."
TSM.L["Invalid price source in convert."] = "잘못된 가격 출처입니다."
--[[Translation missing --]]
TSM.L["Invalid price source."] = "Invalid price source."
--[[Translation missing --]]
TSM.L["Invalid seller data returned by server."] = "Invalid seller data returned by server."
TSM.L["Invalid word: '%s'"] = "잘못된 단어: '%s'"
--[[Translation missing --]]
TSM.L["Inventory"] = "Inventory"
--[[Translation missing --]]
TSM.L["Inventory / Mailing"] = "Inventory / Mailing"
--[[Translation missing --]]
TSM.L["Inventory Options"] = "Inventory Options"
--[[Translation missing --]]
TSM.L["Inventory Tooltip Format"] = "Inventory Tooltip Format"
--[[Translation missing --]]
TSM.L["It appears that you've manually copied your saved variables between accounts which will cause TSM's automatic sync'ing to not work. You'll need to undo this, and/or delete the TradeSkillMaster and TSM_Crafting saved variables files on both accounts (with WoW closed) in order to fix this."] = "It appears that you've manually copied your saved variables between accounts which will cause TSM's automatic sync'ing to not work. You'll need to undo this, and/or delete the TradeSkillMaster and TSM_Crafting saved variables files on both accounts (with WoW closed) in order to fix this."
TSM.L["Item"] = "아이템"
--[[Translation missing --]]
TSM.L["ITEM CLASS"] = "ITEM CLASS"
--[[Translation missing --]]
TSM.L["Item Level"] = "Item Level"
--[[Translation missing --]]
TSM.L["ITEM LEVEL RANGE"] = "ITEM LEVEL RANGE"
TSM.L["Item links may only be used as parameters to price sources."] = "아이템 링크는 가격 출처에 대한 매개 변수로만 사용할 수 있습니다."
TSM.L["Item Name"] = "아이템 이름 "
--[[Translation missing --]]
TSM.L["Item Quality"] = "Item Quality"
--[[Translation missing --]]
TSM.L["ITEM SEARCH"] = "ITEM SEARCH"
--[[Translation missing --]]
TSM.L["ITEM SUBCLASS"] = "ITEM SUBCLASS"
--[[Translation missing --]]
TSM.L["Item Value"] = "Item Value"
--[[Translation missing --]]
TSM.L["Item/Group is invalid (see chat)."] = "Item/Group is invalid (see chat)."
--[[Translation missing --]]
TSM.L["ITEMS"] = "ITEMS"
TSM.L["Items"] = "아이템"
--[[Translation missing --]]
TSM.L["Items in Bags"] = "Items in Bags"
--[[Translation missing --]]
TSM.L["Keep in bags quantity:"] = "Keep in bags quantity:"
--[[Translation missing --]]
TSM.L["Keep in bank quantity:"] = "Keep in bank quantity:"
--[[Translation missing --]]
TSM.L["Keep posted:"] = "Keep posted:"
--[[Translation missing --]]
TSM.L["Keep quantity:"] = "Keep quantity:"
--[[Translation missing --]]
TSM.L["Keep this amount in bags:"] = "Keep this amount in bags:"
--[[Translation missing --]]
TSM.L["Keep this amount:"] = "Keep this amount:"
--[[Translation missing --]]
TSM.L["Keeping %d."] = "Keeping %d."
--[[Translation missing --]]
TSM.L["Keeping undercut auctions posted."] = "Keeping undercut auctions posted."
--[[Translation missing --]]
TSM.L["Last 14 Days"] = "Last 14 Days"
--[[Translation missing --]]
TSM.L["Last 3 Days"] = "Last 3 Days"
--[[Translation missing --]]
TSM.L["Last 30 Days"] = "Last 30 Days"
--[[Translation missing --]]
TSM.L["LAST 30 DAYS"] = "LAST 30 DAYS"
--[[Translation missing --]]
TSM.L["Last 60 Days"] = "Last 60 Days"
--[[Translation missing --]]
TSM.L["Last 7 Days"] = "Last 7 Days"
--[[Translation missing --]]
TSM.L["LAST 7 DAYS"] = "LAST 7 DAYS"
--[[Translation missing --]]
TSM.L["Last Data Update:"] = "Last Data Update:"
--[[Translation missing --]]
TSM.L["Last Purchased"] = "Last Purchased"
--[[Translation missing --]]
TSM.L["Last Sold"] = "Last Sold"
TSM.L["Level Up"] = "레벨 업"
--[[Translation missing --]]
TSM.L["LIMIT"] = "LIMIT"
--[[Translation missing --]]
TSM.L["Link to Another Operation"] = "Link to Another Operation"
--[[Translation missing --]]
TSM.L["List"] = "List"
--[[Translation missing --]]
TSM.L["List materials in tooltip"] = "List materials in tooltip"
--[[Translation missing --]]
TSM.L["Loading Mails..."] = "Loading Mails..."
--[[Translation missing --]]
TSM.L["Loading..."] = "Loading..."
TSM.L["Looks like TradeSkillMaster has encountered an error. Please help the author fix this error by following the instructions shown."] = "TradeSkillMaster에 에러가 발생한 것 같습니다. 아래 표시된 안내에 따라 제작자가 에러를 수정할 수 있도록 도움을 주시기 바랍니다."
--[[Translation missing --]]
TSM.L["Loop detected in the following custom price:"] = "Loop detected in the following custom price:"
--[[Translation missing --]]
TSM.L["Lowest auction by whitelisted player."] = "Lowest auction by whitelisted player."
--[[Translation missing --]]
TSM.L["Macro created and scroll wheel bound!"] = "Macro created and scroll wheel bound!"
TSM.L["Macro Setup"] = "매크로 설정"
TSM.L["Mail"] = "우편"
--[[Translation missing --]]
TSM.L["Mail Disenchantables"] = "Mail Disenchantables"
--[[Translation missing --]]
TSM.L["Mail Disenchantables Max Quality"] = "Mail Disenchantables Max Quality"
--[[Translation missing --]]
TSM.L["MAIL SELECTED GROUPS"] = "MAIL SELECTED GROUPS"
--[[Translation missing --]]
TSM.L["Mail to %s"] = "Mail to %s"
--[[Translation missing --]]
TSM.L["Mailing"] = "Mailing"
--[[Translation missing --]]
TSM.L["Mailing all to %s."] = "Mailing all to %s."
--[[Translation missing --]]
TSM.L["Mailing Options"] = "Mailing Options"
--[[Translation missing --]]
TSM.L["Mailing up to %d to %s."] = "Mailing up to %d to %s."
--[[Translation missing --]]
TSM.L["Main Settings"] = "Main Settings"
--[[Translation missing --]]
TSM.L["Make Cash On Delivery?"] = "Make Cash On Delivery?"
TSM.L["Management Options"] = "관리 옵션"
--[[Translation missing --]]
TSM.L["Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."] = "Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."
TSM.L["Map Ping"] = "미니맵 표시음(ping)"
--[[Translation missing --]]
TSM.L["Market Value"] = "Market Value"
--[[Translation missing --]]
TSM.L["Market Value Price Source"] = "Market Value Price Source"
--[[Translation missing --]]
TSM.L["Market Value Source"] = "Market Value Source"
--[[Translation missing --]]
TSM.L["Mat Cost"] = "Mat Cost"
--[[Translation missing --]]
TSM.L["Mat Price"] = "Mat Price"
--[[Translation missing --]]
TSM.L["Match stack size?"] = "Match stack size?"
--[[Translation missing --]]
TSM.L["Match whitelisted players"] = "Match whitelisted players"
--[[Translation missing --]]
TSM.L["Material Name"] = "Material Name"
--[[Translation missing --]]
TSM.L["Materials"] = "Materials"
--[[Translation missing --]]
TSM.L["Materials to Gather"] = "Materials to Gather"
--[[Translation missing --]]
TSM.L["Max Destroy Value"] = "Max Destroy Value"
--[[Translation missing --]]
TSM.L["MAX EXPIRES TO BANK"] = "MAX EXPIRES TO BANK"
--[[Translation missing --]]
TSM.L["Max Market Value"] = "Max Market Value"
--[[Translation missing --]]
TSM.L["Max Shopping Price"] = "Max Shopping Price"
--[[Translation missing --]]
TSM.L["Maximum amount already posted."] = "Maximum amount already posted."
--[[Translation missing --]]
TSM.L["Maximum Auction Price (Per Item)"] = "Maximum Auction Price (Per Item)"
--[[Translation missing --]]
TSM.L["Maximum Destroy Value (Enter '0c' to disable)"] = "Maximum Destroy Value (Enter '0c' to disable)"
--[[Translation missing --]]
TSM.L["Maximum disenchant level:"] = "Maximum disenchant level:"
--[[Translation missing --]]
TSM.L["Maximum Disenchant Quality"] = "Maximum Disenchant Quality"
--[[Translation missing --]]
TSM.L["Maximum disenchant search percentage:"] = "Maximum disenchant search percentage:"
--[[Translation missing --]]
TSM.L["Maximum Market Value (Enter '0c' to disable)"] = "Maximum Market Value (Enter '0c' to disable)"
--[[Translation missing --]]
TSM.L["MAXIMUM QUANTITY TO BUY:"] = "MAXIMUM QUANTITY TO BUY:"
--[[Translation missing --]]
TSM.L["Maximum quantity:"] = "Maximum quantity:"
--[[Translation missing --]]
TSM.L["Maximum restock quantity:"] = "Maximum restock quantity:"
--[[Translation missing --]]
TSM.L["Mill Value"] = "Mill Value"
--[[Translation missing --]]
TSM.L["Min"] = "Min"
--[[Translation missing --]]
TSM.L["Min Buyout"] = "Min Buyout"
--[[Translation missing --]]
TSM.L["Min/Normal/Max Prices"] = "Min/Normal/Max Prices"
--[[Translation missing --]]
TSM.L["Minimum Days Old"] = "Minimum Days Old"
--[[Translation missing --]]
TSM.L["Minimum disenchant level:"] = "Minimum disenchant level:"
--[[Translation missing --]]
TSM.L["Minimum expires:"] = "Minimum expires:"
--[[Translation missing --]]
TSM.L["Minimum profit:"] = "Minimum profit:"
--[[Translation missing --]]
TSM.L["MINIMUM RARITY"] = "MINIMUM RARITY"
--[[Translation missing --]]
TSM.L["Minimum restock quantity:"] = "Minimum restock quantity:"
TSM.L["Misplaced comma"] = "콤마의 위치가 잘못됐습니다."
--[[Translation missing --]]
TSM.L["Missing Materials"] = "Missing Materials"
--[[Translation missing --]]
TSM.L["MM/DD/YY HH:MM"] = "MM/DD/YY HH:MM"
--[[Translation missing --]]
TSM.L["Modifiers:"] = "Modifiers:"
TSM.L["Money Frame Open"] = "머니프레임 오픈음"
--[[Translation missing --]]
TSM.L["Money Transfer"] = "Money Transfer"
--[[Translation missing --]]
TSM.L["Most Profitable Item:"] = "Most Profitable Item:"
--[[Translation missing --]]
TSM.L["MOVE"] = "MOVE"
--[[Translation missing --]]
TSM.L["Move already grouped items?"] = "Move already grouped items?"
--[[Translation missing --]]
TSM.L["Move Quantity Settings"] = "Move Quantity Settings"
--[[Translation missing --]]
TSM.L["MOVE TO BAGS"] = "MOVE TO BAGS"
--[[Translation missing --]]
TSM.L["MOVE TO BANK"] = "MOVE TO BANK"
--[[Translation missing --]]
TSM.L["MOVING"] = "MOVING"
--[[Translation missing --]]
TSM.L["Moving"] = "Moving"
--[[Translation missing --]]
TSM.L["Multiple Items"] = "Multiple Items"
--[[Translation missing --]]
TSM.L["My Auctions"] = "My Auctions"
--[[Translation missing --]]
TSM.L["My Auctions 'CANCEL' Button"] = "My Auctions 'CANCEL' Button"
--[[Translation missing --]]
TSM.L["Neat Stacks only?"] = "Neat Stacks only?"
--[[Translation missing --]]
TSM.L["NEED MATS"] = "NEED MATS"
TSM.L["New Group"] = "새 그룹"
TSM.L["New Operation"] = "새 작업 "
TSM.L["NEWS AND INFORMATION"] = "뉴스 및 정보"
--[[Translation missing --]]
TSM.L["No Attachments"] = "No Attachments"
TSM.L["No Data"] = "데이터 없음"
--[[Translation missing --]]
TSM.L["No group selected"] = "No group selected"
--[[Translation missing --]]
TSM.L["No item specified. Usage: /tsm restock_help [ITEM_LINK]"] = "No item specified. Usage: /tsm restock_help [ITEM_LINK]"
--[[Translation missing --]]
TSM.L["NO ITEMS"] = "NO ITEMS"
--[[Translation missing --]]
TSM.L["No Materials to Gather"] = "No Materials to Gather"
TSM.L["No Operation Selected"] = "선택한 작업 없음"
--[[Translation missing --]]
TSM.L["No posting."] = "No posting."
--[[Translation missing --]]
TSM.L["No Profession Opened"] = "No Profession Opened"
--[[Translation missing --]]
TSM.L["No Profession Selected"] = "No Profession Selected"
--[[Translation missing --]]
TSM.L["No profile specified. Possible profiles: '%s'"] = "No profile specified. Possible profiles: '%s'"
--[[Translation missing --]]
TSM.L["No recent AuctionDB scan data found."] = "No recent AuctionDB scan data found."
TSM.L["No Sound"] = "소리 없음"
TSM.L["None"] = "없음"
TSM.L["None (Always Show)"] = "없음 (항상 표시)"
--[[Translation missing --]]
TSM.L["None Selected"] = "None Selected"
--[[Translation missing --]]
TSM.L["NONGROUP TO BANK"] = "NONGROUP TO BANK"
--[[Translation missing --]]
TSM.L["Normal"] = "Normal"
--[[Translation missing --]]
TSM.L["Not canceling auction at reset price."] = "Not canceling auction at reset price."
--[[Translation missing --]]
TSM.L["Not canceling auction below min price."] = "Not canceling auction below min price."
--[[Translation missing --]]
TSM.L["Not canceling."] = "Not canceling."
--[[Translation missing --]]
TSM.L["Not enough items in bags."] = "Not enough items in bags."
--[[Translation missing --]]
TSM.L["NOT OPEN"] = "NOT OPEN"
--[[Translation missing --]]
TSM.L["Not Scanned"] = "Not Scanned"
--[[Translation missing --]]
TSM.L["NPC"] = "NPC"
--[[Translation missing --]]
TSM.L["Number Owned"] = "Number Owned"
--[[Translation missing --]]
TSM.L["of"] = "of"
--[[Translation missing --]]
TSM.L["Offline"] = "Offline"
--[[Translation missing --]]
TSM.L["Old TSM addons detected. TSM has disabled them and requires a reload."] = "Old TSM addons detected. TSM has disabled them and requires a reload."
--[[Translation missing --]]
TSM.L["On Cooldown"] = "On Cooldown"
--[[Translation missing --]]
TSM.L["Only show craftable"] = "Only show craftable"
--[[Translation missing --]]
TSM.L["Only show items with disenchant value above custom price"] = "Only show items with disenchant value above custom price"
--[[Translation missing --]]
TSM.L["OPEN"] = "OPEN"
--[[Translation missing --]]
TSM.L["Open all bags when auctioning"] = "Open all bags when auctioning"
--[[Translation missing --]]
TSM.L["OPEN ALL MAIL"] = "OPEN ALL MAIL"
--[[Translation missing --]]
TSM.L["Open Mail"] = "Open Mail"
--[[Translation missing --]]
TSM.L["Open Mail Complete Sound"] = "Open Mail Complete Sound"
--[[Translation missing --]]
TSM.L["Open Task List"] = "Open Task List"
TSM.L["Operation"] = "작업"
TSM.L["Operations"] = "작업"
--[[Translation missing --]]
TSM.L["Other Character"] = "Other Character"
TSM.L["Other Settings"] = "기타 설정"
--[[Translation missing --]]
TSM.L["Other Shopping Searches"] = "Other Shopping Searches"
--[[Translation missing --]]
TSM.L["Override default craft value method?"] = "Override default craft value method?"
--[[Translation missing --]]
TSM.L["Override parent operations"] = "Override parent operations"
--[[Translation missing --]]
TSM.L["Parent Items"] = "Parent Items"
TSM.L["Past 7 Days"] = "지난 주"
TSM.L["Past Day"] = "지난 날"
TSM.L["Past Month"] = "지난 달"
TSM.L["Past Year"] = "지난 해"
--[[Translation missing --]]
TSM.L["Paste string here"] = "Paste string here"
--[[Translation missing --]]
TSM.L["Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."] = "Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."
--[[Translation missing --]]
TSM.L["Per Item"] = "Per Item"
--[[Translation missing --]]
TSM.L["Per Stack"] = "Per Stack"
--[[Translation missing --]]
TSM.L["Per Unit"] = "Per Unit"
TSM.L["Player Gold"] = "플레이어 골드"
TSM.L["Player Invite Accept"] = "초대 효과음"
--[[Translation missing --]]
TSM.L["Please select a group to export"] = "Please select a group to export"
--[[Translation missing --]]
TSM.L["POST"] = "POST"
--[[Translation missing --]]
TSM.L["Post at Maximum Price"] = "Post at Maximum Price"
--[[Translation missing --]]
TSM.L["Post at Minimum Price"] = "Post at Minimum Price"
--[[Translation missing --]]
TSM.L["Post at Normal Price"] = "Post at Normal Price"
--[[Translation missing --]]
TSM.L["POST CAP TO BAGS"] = "POST CAP TO BAGS"
--[[Translation missing --]]
TSM.L["Post Scan"] = "Post Scan"
--[[Translation missing --]]
TSM.L["POST SELECTED"] = "POST SELECTED"
--[[Translation missing --]]
TSM.L["POSTAGE"] = "POSTAGE"
--[[Translation missing --]]
TSM.L["Postage"] = "Postage"
--[[Translation missing --]]
TSM.L["Posted at whitelisted player's price."] = "Posted at whitelisted player's price."
--[[Translation missing --]]
TSM.L["Posted Auctions %s:"] = "Posted Auctions %s:"
--[[Translation missing --]]
TSM.L["Posting"] = "Posting"
--[[Translation missing --]]
TSM.L["Posting %d / %d"] = "Posting %d / %d"
--[[Translation missing --]]
TSM.L["Posting %d stack(s) of %d for %d hours."] = "Posting %d stack(s) of %d for %d hours."
--[[Translation missing --]]
TSM.L["Posting at normal price."] = "Posting at normal price."
--[[Translation missing --]]
TSM.L["Posting at whitelisted player's price."] = "Posting at whitelisted player's price."
--[[Translation missing --]]
TSM.L["Posting at your current price."] = "Posting at your current price."
--[[Translation missing --]]
TSM.L["Posting disabled."] = "Posting disabled."
--[[Translation missing --]]
TSM.L["Posting Settings"] = "Posting Settings"
--[[Translation missing --]]
TSM.L["Potential"] = "Potential"
TSM.L["Price Settings"] = "가격 설정"
--[[Translation missing --]]
TSM.L["PRICE SOURCE"] = "PRICE SOURCE"
--[[Translation missing --]]
TSM.L["Price source with name '%s' already exists."] = "Price source with name '%s' already exists."
--[[Translation missing --]]
TSM.L["Price Variables"] = "Price Variables"
--[[Translation missing --]]
TSM.L["Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."] = "Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."
--[[Translation missing --]]
TSM.L["PROFESSION"] = "PROFESSION"
--[[Translation missing --]]
TSM.L["Profession Filters"] = "Profession Filters"
--[[Translation missing --]]
TSM.L["Profession loading..."] = "Profession loading..."
--[[Translation missing --]]
TSM.L["Professions Used In"] = "Professions Used In"
--[[Translation missing --]]
TSM.L["Profile changed to '%s'."] = "Profile changed to '%s'."
TSM.L["Profiles"] = "프로파일"
--[[Translation missing --]]
TSM.L["Profit"] = "Profit"
--[[Translation missing --]]
TSM.L["PROFIT"] = "PROFIT"
--[[Translation missing --]]
TSM.L["Profit Deduction"] = "Profit Deduction"
--[[Translation missing --]]
TSM.L["Profit, Craftable Quantity"] = "Profit, Craftable Quantity"
--[[Translation missing --]]
TSM.L["Prospect Value"] = "Prospect Value"
--[[Translation missing --]]
TSM.L["PURCHASE DATA"] = "PURCHASE DATA"
--[[Translation missing --]]
TSM.L["Purchased (Min/Avg/Max Price)"] = "Purchased (Min/Avg/Max Price)"
--[[Translation missing --]]
TSM.L["Purchased (Total Price)"] = "Purchased (Total Price)"
--[[Translation missing --]]
TSM.L["Purchases"] = "Purchases"
--[[Translation missing --]]
TSM.L["Qty"] = "Qty"
--[[Translation missing --]]
TSM.L["Quantity Bought:"] = "Quantity Bought:"
--[[Translation missing --]]
TSM.L["Quantity Sold:"] = "Quantity Sold:"
--[[Translation missing --]]
TSM.L["Quantity to move:"] = "Quantity to move:"
TSM.L["Quest Added"] = "퀘스트 추가음"
TSM.L["Quest Completed"] = "퀘스트 완료음"
TSM.L["Quest Objectives Complete"] = "퀘스트 물건 수집완료음"
--[[Translation missing --]]
TSM.L["QUEUE"] = "QUEUE"
--[[Translation missing --]]
TSM.L["Queue Sorting Method"] = "Queue Sorting Method"
--[[Translation missing --]]
TSM.L["Quick Sell"] = "Quick Sell"
--[[Translation missing --]]
TSM.L["Quick Sell Options"] = "Quick Sell Options"
--[[Translation missing --]]
TSM.L["Quickly mail all excess disenchantable items to a character"] = "Quickly mail all excess disenchantable items to a character"
--[[Translation missing --]]
TSM.L["Quickly mail all excess gold (limited to a certain amount) to a character"] = "Quickly mail all excess gold (limited to a certain amount) to a character"
TSM.L["Raid Warning"] = "공격대 경보음"
--[[Translation missing --]]
TSM.L["Read More"] = "Read More"
TSM.L["Ready Check"] = "준비완료 확인음"
--[[Translation missing --]]
TSM.L["Ready to Cancel"] = "Ready to Cancel"
--[[Translation missing --]]
TSM.L["Reagent Bank"] = "Reagent Bank"
--[[Translation missing --]]
TSM.L["Realm Data Tooltips"] = "Realm Data Tooltips"
--[[Translation missing --]]
TSM.L["Recent Scans"] = "Recent Scans"
--[[Translation missing --]]
TSM.L["Recent Searches"] = "Recent Searches"
--[[Translation missing --]]
TSM.L["Recently Mailed"] = "Recently Mailed"
--[[Translation missing --]]
TSM.L["RECIPIENT"] = "RECIPIENT"
--[[Translation missing --]]
TSM.L["Region Avg Daily Sold"] = "Region Avg Daily Sold"
--[[Translation missing --]]
TSM.L["Region Data Tooltips"] = "Region Data Tooltips"
--[[Translation missing --]]
TSM.L["Region Historical Price"] = "Region Historical Price"
--[[Translation missing --]]
TSM.L["Region Market Value Avg"] = "Region Market Value Avg"
--[[Translation missing --]]
TSM.L["Region Min Buyout Avg"] = "Region Min Buyout Avg"
--[[Translation missing --]]
TSM.L["Region Sale Avg"] = "Region Sale Avg"
--[[Translation missing --]]
TSM.L["Region Sale Rate"] = "Region Sale Rate"
--[[Translation missing --]]
TSM.L["Reload"] = "Reload"
--[[Translation missing --]]
TSM.L["REMOVE %d ITEMS"] = "REMOVE %d ITEMS"
--[[Translation missing --]]
TSM.L["Removed a total of %s old records."] = "Removed a total of %s old records."
--[[Translation missing --]]
TSM.L["REPAIR"] = "REPAIR"
--[[Translation missing --]]
TSM.L["Repair Bill"] = "Repair Bill"
TSM.L["Replace"] = "대체"
--[[Translation missing --]]
TSM.L["REPLY"] = "REPLY"
--[[Translation missing --]]
TSM.L["REPORT SPAM"] = "REPORT SPAM"
--[[Translation missing --]]
TSM.L["Repost Higher Threshold"] = "Repost Higher Threshold"
--[[Translation missing --]]
TSM.L["Required Level"] = "Required Level"
--[[Translation missing --]]
TSM.L["REQUIRED LEVEL RANGE"] = "REQUIRED LEVEL RANGE"
--[[Translation missing --]]
TSM.L["Requires TSM Desktop Application"] = "Requires TSM Desktop Application"
--[[Translation missing --]]
TSM.L["Resale"] = "Resale"
--[[Translation missing --]]
TSM.L["RESCAN"] = "RESCAN"
--[[Translation missing --]]
TSM.L["RESET"] = "RESET"
--[[Translation missing --]]
TSM.L["Reset All"] = "Reset All"
--[[Translation missing --]]
TSM.L["Reset Filters"] = "Reset Filters"
--[[Translation missing --]]
TSM.L["Reset Profile Confirmation"] = "Reset Profile Confirmation"
--[[Translation missing --]]
TSM.L["RESTART"] = "RESTART"
--[[Translation missing --]]
TSM.L["Restart Delay (minutes)"] = "Restart Delay (minutes)"
--[[Translation missing --]]
TSM.L["RESTOCK BAGS"] = "RESTOCK BAGS"
--[[Translation missing --]]
TSM.L["Restock help for %s:"] = "Restock help for %s:"
--[[Translation missing --]]
TSM.L["Restock Quantity Settings"] = "Restock Quantity Settings"
--[[Translation missing --]]
TSM.L["Restock quantity:"] = "Restock quantity:"
--[[Translation missing --]]
TSM.L["RESTOCK SELECTED GROUPS"] = "RESTOCK SELECTED GROUPS"
--[[Translation missing --]]
TSM.L["Restock Settings"] = "Restock Settings"
--[[Translation missing --]]
TSM.L["Restock target to max quantity?"] = "Restock target to max quantity?"
--[[Translation missing --]]
TSM.L["Restocking to %d."] = "Restocking to %d."
--[[Translation missing --]]
TSM.L["Restocking to a max of %d (min of %d) with a min profit."] = "Restocking to a max of %d (min of %d) with a min profit."
--[[Translation missing --]]
TSM.L["Restocking to a max of %d (min of %d) with no min profit."] = "Restocking to a max of %d (min of %d) with no min profit."
--[[Translation missing --]]
TSM.L["RESTORE BAGS"] = "RESTORE BAGS"
--[[Translation missing --]]
TSM.L["Resume Scan"] = "Resume Scan"
--[[Translation missing --]]
TSM.L["Retrying %d auction(s) which failed."] = "Retrying %d auction(s) which failed."
--[[Translation missing --]]
TSM.L["Revenue"] = "Revenue"
--[[Translation missing --]]
TSM.L["Round normal price"] = "Round normal price"
--[[Translation missing --]]
TSM.L["RUN ADVANCED ITEM SEARCH"] = "RUN ADVANCED ITEM SEARCH"
--[[Translation missing --]]
TSM.L["Run Bid Sniper"] = "Run Bid Sniper"
--[[Translation missing --]]
TSM.L["Run Buyout Sniper"] = "Run Buyout Sniper"
--[[Translation missing --]]
TSM.L["RUN CANCEL SCAN"] = "RUN CANCEL SCAN"
--[[Translation missing --]]
TSM.L["RUN POST SCAN"] = "RUN POST SCAN"
--[[Translation missing --]]
TSM.L["RUN SHOPPING SCAN"] = "RUN SHOPPING SCAN"
--[[Translation missing --]]
TSM.L["Running Sniper Scan"] = "Running Sniper Scan"
--[[Translation missing --]]
TSM.L["Sale"] = "Sale"
--[[Translation missing --]]
TSM.L["SALE DATA"] = "SALE DATA"
--[[Translation missing --]]
TSM.L["Sale Rate"] = "Sale Rate"
TSM.L["Sales"] = "판매"
TSM.L["SALES"] = "판매"
TSM.L["Sales Summary"] = "판매 요약"
--[[Translation missing --]]
TSM.L["SCAN ALL"] = "SCAN ALL"
--[[Translation missing --]]
TSM.L["Scan Complete Sound"] = "Scan Complete Sound"
--[[Translation missing --]]
TSM.L["Scan Paused"] = "Scan Paused"
--[[Translation missing --]]
TSM.L["SCANNING"] = "SCANNING"
--[[Translation missing --]]
TSM.L["Scanning %d / %d (Page %d / %d)"] = "Scanning %d / %d (Page %d / %d)"
--[[Translation missing --]]
TSM.L["Scroll wheel direction:"] = "Scroll wheel direction:"
--[[Translation missing --]]
TSM.L["Search"] = "Search"
--[[Translation missing --]]
TSM.L["Search Bags"] = "Search Bags"
--[[Translation missing --]]
TSM.L["Search for Item"] = "Search for Item"
--[[Translation missing --]]
TSM.L["Search Groups"] = "Search Groups"
--[[Translation missing --]]
TSM.L["Search Inbox"] = "Search Inbox"
TSM.L["Search Operations"] = "작업 검색"
--[[Translation missing --]]
TSM.L["Search Patterns"] = "Search Patterns"
--[[Translation missing --]]
TSM.L["Search Usable Items Only?"] = "Search Usable Items Only?"
--[[Translation missing --]]
TSM.L["Search Vendor"] = "Search Vendor"
--[[Translation missing --]]
TSM.L["Select a Source"] = "Select a Source"
--[[Translation missing --]]
TSM.L["Select Action"] = "Select Action"
TSM.L["Select All Groups"] = "모든 그룹 선택"
--[[Translation missing --]]
TSM.L["Select All Items"] = "Select All Items"
--[[Translation missing --]]
TSM.L["Select Auction to Cancel"] = "Select Auction to Cancel"
--[[Translation missing --]]
TSM.L["Select crafter"] = "Select crafter"
--[[Translation missing --]]
TSM.L["Select custom price sources to include in item tooltips"] = "Select custom price sources to include in item tooltips"
--[[Translation missing --]]
TSM.L["Select Duration"] = "Select Duration"
--[[Translation missing --]]
TSM.L["Select Items to Add"] = "Select Items to Add"
--[[Translation missing --]]
TSM.L["Select Items to Remove"] = "Select Items to Remove"
--[[Translation missing --]]
TSM.L["Select Operation"] = "Select Operation"
--[[Translation missing --]]
TSM.L["Select professions"] = "Select professions"
--[[Translation missing --]]
TSM.L["Select which accounting information to display in item tooltips."] = "Select which accounting information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which auctioning information to display in item tooltips."] = "Select which auctioning information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which crafting information to display in item tooltips."] = "Select which crafting information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which destroying information to display in item tooltips."] = "Select which destroying information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which shopping information to display in item tooltips."] = "Select which shopping information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Selected Groups"] = "Selected Groups"
--[[Translation missing --]]
TSM.L["SELECTED ITEM"] = "SELECTED ITEM"
--[[Translation missing --]]
TSM.L["Selected Operations"] = "Selected Operations"
--[[Translation missing --]]
TSM.L["Sell"] = "Sell"
--[[Translation missing --]]
TSM.L["SELL ALL"] = "SELL ALL"
--[[Translation missing --]]
TSM.L["SELL BOES"] = "SELL BOES"
--[[Translation missing --]]
TSM.L["SELL GROUPS"] = "SELL GROUPS"
--[[Translation missing --]]
TSM.L["Sell Options"] = "Sell Options"
--[[Translation missing --]]
TSM.L["Sell soulbound items?"] = "Sell soulbound items?"
TSM.L["Sell to Vendor"] = "상인에게 판매"
--[[Translation missing --]]
TSM.L["SELL TRASH"] = "SELL TRASH"
--[[Translation missing --]]
TSM.L["Seller"] = "Seller"
--[[Translation missing --]]
TSM.L["Selling soulbound items."] = "Selling soulbound items."
--[[Translation missing --]]
TSM.L["Send"] = "Send"
--[[Translation missing --]]
TSM.L["SEND DISENCHANTABLES"] = "SEND DISENCHANTABLES"
--[[Translation missing --]]
TSM.L["Send Excess Gold to Banker"] = "Send Excess Gold to Banker"
--[[Translation missing --]]
TSM.L["SEND GOLD"] = "SEND GOLD"
--[[Translation missing --]]
TSM.L["Send grouped items individually"] = "Send grouped items individually"
--[[Translation missing --]]
TSM.L["SEND MAIL"] = "SEND MAIL"
--[[Translation missing --]]
TSM.L["Send Money"] = "Send Money"
--[[Translation missing --]]
TSM.L["SENDING"] = "SENDING"
--[[Translation missing --]]
TSM.L["Sending %s individually to %s"] = "Sending %s individually to %s"
--[[Translation missing --]]
TSM.L["Sending %s to %s"] = "Sending %s to %s"
--[[Translation missing --]]
TSM.L["Sending %s to %s with a COD of %s"] = "Sending %s to %s with a COD of %s"
--[[Translation missing --]]
TSM.L["Sending Settings"] = "Sending Settings"
--[[Translation missing --]]
TSM.L["SENDING..."] = "SENDING..."
--[[Translation missing --]]
TSM.L["Set auction duration to:"] = "Set auction duration to:"
--[[Translation missing --]]
TSM.L["Set bid as percentage of buyout:"] = "Set bid as percentage of buyout:"
--[[Translation missing --]]
TSM.L["Set keep in bags quantity?"] = "Set keep in bags quantity?"
--[[Translation missing --]]
TSM.L["Set keep in bank quantity?"] = "Set keep in bank quantity?"
--[[Translation missing --]]
TSM.L["Set Maximum Price:"] = "Set Maximum Price:"
--[[Translation missing --]]
TSM.L["Set maximum quantity?"] = "Set maximum quantity?"
--[[Translation missing --]]
TSM.L["Set Minimum Price:"] = "Set Minimum Price:"
--[[Translation missing --]]
TSM.L["Set minimum profit?"] = "Set minimum profit?"
--[[Translation missing --]]
TSM.L["Set move quantity?"] = "Set move quantity?"
--[[Translation missing --]]
TSM.L["Set Normal Price:"] = "Set Normal Price:"
--[[Translation missing --]]
TSM.L["Set post cap to:"] = "Set post cap to:"
--[[Translation missing --]]
TSM.L["Set posted stack size to:"] = "Set posted stack size to:"
--[[Translation missing --]]
TSM.L["Set stack size for bags?"] = "Set stack size for bags?"
--[[Translation missing --]]
TSM.L["Setup"] = "Setup"
--[[Translation missing --]]
TSM.L["SETUP ACCOUNT SYNC"] = "SETUP ACCOUNT SYNC"
TSM.L["Shards"] = "조각(파편)"
--[[Translation missing --]]
TSM.L["Shopping"] = "Shopping"
--[[Translation missing --]]
TSM.L["Shopping 'BUYOUT' Button"] = "Shopping 'BUYOUT' Button"
--[[Translation missing --]]
TSM.L["Shopping for auctions including those above the max price."] = "Shopping for auctions including those above the max price."
--[[Translation missing --]]
TSM.L["Shopping for auctions with a max price set."] = "Shopping for auctions with a max price set."
--[[Translation missing --]]
TSM.L["Shopping for even stacks including those above the max price"] = "Shopping for even stacks including those above the max price"
--[[Translation missing --]]
TSM.L["Shopping for even stacks with a max price set."] = "Shopping for even stacks with a max price set."
--[[Translation missing --]]
TSM.L["Shopping Tooltips"] = "Shopping Tooltips"
--[[Translation missing --]]
TSM.L["SHORTFALL TO BAGS"] = "SHORTFALL TO BAGS"
--[[Translation missing --]]
TSM.L["Show auctions above max price?"] = "Show auctions above max price?"
--[[Translation missing --]]
TSM.L["Show Description"] = "Show Description"
--[[Translation missing --]]
TSM.L["Show Destroying frame automatically"] = "Show Destroying frame automatically"
--[[Translation missing --]]
TSM.L["Show material cost"] = "Show material cost"
--[[Translation missing --]]
TSM.L["Show on Modifier"] = "Show on Modifier"
--[[Translation missing --]]
TSM.L["Showing %d Mail"] = "Showing %d Mail"
--[[Translation missing --]]
TSM.L["Showing %d of %d Mail"] = "Showing %d of %d Mail"
--[[Translation missing --]]
TSM.L["Showing %d of %d Mails"] = "Showing %d of %d Mails"
--[[Translation missing --]]
TSM.L["Showing all %d Mails"] = "Showing all %d Mails"
TSM.L["Simple"] = "단순히"
--[[Translation missing --]]
TSM.L["SKIP"] = "SKIP"
--[[Translation missing --]]
TSM.L["Skip Import / Export confirmations?"] = "Skip Import / Export confirmations?"
--[[Translation missing --]]
TSM.L["Skipped: No assigned operation"] = "Skipped: No assigned operation"
TSM.L["Slash Commands:"] = "슬래시 명령어:"
--[[Translation missing --]]
TSM.L["Sniper 'BUYOUT' Button"] = "Sniper 'BUYOUT' Button"
--[[Translation missing --]]
TSM.L["Sniper Options"] = "Sniper Options"
--[[Translation missing --]]
TSM.L["Sniper Settings"] = "Sniper Settings"
--[[Translation missing --]]
TSM.L["Sniping items below a max price"] = "Sniping items below a max price"
--[[Translation missing --]]
TSM.L["Sold"] = "Sold"
--[[Translation missing --]]
TSM.L["Sold %s worth of items."] = "Sold %s worth of items."
--[[Translation missing --]]
TSM.L["Sold (Min/Avg/Max Price)"] = "Sold (Min/Avg/Max Price)"
--[[Translation missing --]]
TSM.L["Sold (Total Price)"] = "Sold (Total Price)"
--[[Translation missing --]]
TSM.L["Sold [%s]x%d for %s to %s"] = "Sold [%s]x%d for %s to %s"
--[[Translation missing --]]
TSM.L["Sold Auctions %s:"] = "Sold Auctions %s:"
--[[Translation missing --]]
TSM.L["Source"] = "Source"
--[[Translation missing --]]
TSM.L["SOURCE %d"] = "SOURCE %d"
--[[Translation missing --]]
TSM.L["SOURCES"] = "SOURCES"
TSM.L["Sources"] = "출처"
--[[Translation missing --]]
TSM.L["Sources to include for restock:"] = "Sources to include for restock:"
--[[Translation missing --]]
TSM.L["Stack"] = "Stack"
--[[Translation missing --]]
TSM.L["Stack / Quantity"] = "Stack / Quantity"
--[[Translation missing --]]
TSM.L["Stack size multiple:"] = "Stack size multiple:"
--[[Translation missing --]]
TSM.L["Start either a 'Buyout' or 'Bid' sniper using the buttons above."] = "Start either a 'Buyout' or 'Bid' sniper using the buttons above."
--[[Translation missing --]]
TSM.L["Starting Scan..."] = "Starting Scan..."
--[[Translation missing --]]
TSM.L["STOP"] = "STOP"
--[[Translation missing --]]
TSM.L["Store operations globally"] = "Store operations globally"
--[[Translation missing --]]
TSM.L["Subject"] = "Subject"
--[[Translation missing --]]
TSM.L["SUBJECT"] = "SUBJECT"
--[[Translation missing --]]
TSM.L["Switch to %s"] = "Switch to %s"
--[[Translation missing --]]
TSM.L["Switch to WoW UI"] = "Switch to WoW UI"
--[[Translation missing --]]
TSM.L["Sync Setup Error: The specified player on the other account is not currently online."] = "Sync Setup Error: The specified player on the other account is not currently online."
--[[Translation missing --]]
TSM.L["Sync Setup Error: This character is already part of a known account."] = "Sync Setup Error: This character is already part of a known account."
--[[Translation missing --]]
TSM.L["Sync Setup Error: You entered the name of the current character and not the character on the other account."] = "Sync Setup Error: You entered the name of the current character and not the character on the other account."
--[[Translation missing --]]
TSM.L["TAKE ALL"] = "TAKE ALL"
--[[Translation missing --]]
TSM.L["Take Attachments"] = "Take Attachments"
--[[Translation missing --]]
TSM.L["Target Character"] = "Target Character"
--[[Translation missing --]]
TSM.L["TARGET SHORTFALL TO BAGS"] = "TARGET SHORTFALL TO BAGS"
--[[Translation missing --]]
TSM.L["Tasks Added to Task List"] = "Tasks Added to Task List"
TSM.L["Text (%s)"] = "문자 (%s)"
--[[Translation missing --]]
TSM.L["The canlearn filter was ignored because the CanIMogIt addon was not found."] = "The canlearn filter was ignored because the CanIMogIt addon was not found."
--[[Translation missing --]]
TSM.L["The 'Craft Value Method' (%s) did not return a value for this item."] = "The 'Craft Value Method' (%s) did not return a value for this item."
--[[Translation missing --]]
TSM.L["The 'disenchant' price source has been replaced by the more general 'destroy' price source. Please update your custom prices."] = "The 'disenchant' price source has been replaced by the more general 'destroy' price source. Please update your custom prices."
--[[Translation missing --]]
TSM.L["The min profit (%s) did not evalulate to a valid value for this item."] = "The min profit (%s) did not evalulate to a valid value for this item."
TSM.L["The name can ONLY contain letters. No spaces, numbers, or special characters."] = "이름은 오직 문자만 기입가능합니다. 띄어스기, 숫자, 특수문자 불가"
--[[Translation missing --]]
TSM.L["The number which would be queued (%d) is less than the min restock quantity (%d)."] = "The number which would be queued (%d) is less than the min restock quantity (%d)."
--[[Translation missing --]]
TSM.L["The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."] = "The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."
--[[Translation missing --]]
TSM.L["The player \"%s\" is already on your whitelist."] = "The player \"%s\" is already on your whitelist."
--[[Translation missing --]]
TSM.L["The profit of this item (%s) is below the min profit (%s)."] = "The profit of this item (%s) is below the min profit (%s)."
--[[Translation missing --]]
TSM.L["The seller name of the lowest auction for %s was not given by the server. Skipping this item."] = "The seller name of the lowest auction for %s was not given by the server. Skipping this item."
--[[Translation missing --]]
TSM.L["The TradeSkillMaster_AppHelper addon is not enabled and is required for proper operation of TSM. TSM has enabled it and requires a reload."] = "The TradeSkillMaster_AppHelper addon is not enabled and is required for proper operation of TSM. TSM has enabled it and requires a reload."
--[[Translation missing --]]
TSM.L["The TradeSkillMaster_AppHelper addon is not installed and is required for proper operation of TSM."] = "The TradeSkillMaster_AppHelper addon is not installed and is required for proper operation of TSM."
--[[Translation missing --]]
TSM.L["The unlearned filter was ignored because the CanIMogIt addon was not found."] = "The unlearned filter was ignored because the CanIMogIt addon was not found."
--[[Translation missing --]]
TSM.L["There is a crafting cost and crafted item value, but TSM_Crafting wasn't able to calculate a profit. This shouldn't happen!"] = "There is a crafting cost and crafted item value, but TSM_Crafting wasn't able to calculate a profit. This shouldn't happen!"
--[[Translation missing --]]
TSM.L["There is no TSM_Crafting operation applied to this item's TSM group (%s)."] = "There is no TSM_Crafting operation applied to this item's TSM group (%s)."
TSM.L["This group already has operations. Would you like to add another one or replace the last one?"] = "이 그룹은 이미 작업을 가지고 있습니다. 다른 작업을 추가하거나 마지막 작업을 교체하시겠습니까?"
TSM.L["This group already has the max number of operation. Would you like to replace the last one?"] = "이 그룹은 이미 최대 개수의 작업을 가지고 있습니다. 마지막 작업을 교체하시겠습니까?"
--[[Translation missing --]]
TSM.L["This is not a valid profile name. Profile names must be at least one character long and may not contain '@' characters."] = "This is not a valid profile name. Profile names must be at least one character long and may not contain '@' characters."
--[[Translation missing --]]
TSM.L["This item does not have a crafting cost. Check that all of its mats have mat prices."] = "This item does not have a crafting cost. Check that all of its mats have mat prices."
--[[Translation missing --]]
TSM.L["This item is not in a TSM group."] = "This item is not in a TSM group."
--[[Translation missing --]]
TSM.L["This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general TSM_Crafting options."] = "This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general TSM_Crafting options."
--[[Translation missing --]]
TSM.L["This looks like an exported operation and not a custom price."] = "This looks like an exported operation and not a custom price."
--[[Translation missing --]]
TSM.L["This will copy the settings from '%s' into your currently-active one."] = "This will copy the settings from '%s' into your currently-active one."
--[[Translation missing --]]
TSM.L["This will permanently delete the '%s' profile."] = "This will permanently delete the '%s' profile."
--[[Translation missing --]]
TSM.L["This will reset all groups and operations (if not stored globally) to be wiped from this profile."] = "This will reset all groups and operations (if not stored globally) to be wiped from this profile."
--[[Translation missing --]]
TSM.L["Time"] = "Time"
--[[Translation missing --]]
TSM.L["Time Format"] = "Time Format"
--[[Translation missing --]]
TSM.L["Time Frame"] = "Time Frame"
--[[Translation missing --]]
TSM.L["TIME FRAME"] = "TIME FRAME"
--[[Translation missing --]]
TSM.L["TINKER"] = "TINKER"
TSM.L["Tooltip Price Format"] = "툴팁 가격 형식"
TSM.L["Tooltip Settings"] = "툴팁 설정"
--[[Translation missing --]]
TSM.L["Top Buyers:"] = "Top Buyers:"
--[[Translation missing --]]
TSM.L["Top Item:"] = "Top Item:"
--[[Translation missing --]]
TSM.L["Top Sellers:"] = "Top Sellers:"
TSM.L["Total"] = "총"
TSM.L["Total Gold"] = "총 골드"
TSM.L["Total Gold Earned:"] = "번 총 골드:"
TSM.L["Total Gold Spent:"] = "쓴 총 골드:"
TSM.L["Total Price"] = "총 가격"
--[[Translation missing --]]
TSM.L["Total Profit:"] = "Total Profit:"
TSM.L["Total Value"] = "총 가치"
TSM.L["Total Value of All Items: "] = "모든 아이템의 총 가치:"
--[[Translation missing --]]
TSM.L["Track Sales / Purchases via trade"] = "Track Sales / Purchases via trade"
--[[Translation missing --]]
TSM.L["TradeSkillMaster Info"] = "TradeSkillMaster Info"
--[[Translation missing --]]
TSM.L["Transform Value"] = "Transform Value"
--[[Translation missing --]]
TSM.L["TSM Banking"] = "TSM Banking"
--[[Translation missing --]]
TSM.L["TSM can sync data automatically between multiple accounts."] = "TSM can sync data automatically between multiple accounts."
--[[Translation missing --]]
TSM.L["TSM Crafting"] = "TSM Crafting"
--[[Translation missing --]]
TSM.L["TSM Destroying"] = "TSM Destroying"
--[[Translation missing --]]
TSM.L["TSM failed to scan some auctions. Please rerun the scan."] = "TSM failed to scan some auctions. Please rerun the scan."
--[[Translation missing --]]
TSM.L["TSM Groups"] = "TSM Groups"
TSM.L["TSM is missing important information from the TSM Desktop Application. Please ensure the TSM Desktop Application is running and is properly configured."] = "TSM 데스크톱 애플리케이션에서 중요한 정보가 빠졌습니다. TSM 데스크톱 애플리케이션이 실행 중이며 제대로 구성되어 있는지 확인해 주세요."
--[[Translation missing --]]
TSM.L["TSM Mailing"] = "TSM Mailing"
--[[Translation missing --]]
TSM.L["TSM TASK LIST"] = "TSM TASK LIST"
--[[Translation missing --]]
TSM.L["TSM Vendoring"] = "TSM Vendoring"
TSM.L["TSM Version Info:"] = "TSM 버전 정보:"
--[[Translation missing --]]
TSM.L["TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"] = "TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"
TSM.L["TSM4"] = "TSM4"
TSM.L["TUJ 3-Day Price"] = "TUJ 3일간 가격"
TSM.L["Twitter Integration"] = "트위터 통합"
--[[Translation missing --]]
TSM.L["Twitter Integration Not Enabled"] = "Twitter Integration Not Enabled"
--[[Translation missing --]]
TSM.L["Type"] = "Type"
--[[Translation missing --]]
TSM.L["Type Something"] = "Type Something"
TSM.L["Unbalanced parentheses."] = "잘못된 괄호 사용."
--[[Translation missing --]]
TSM.L["Undercut amount:"] = "Undercut amount:"
--[[Translation missing --]]
TSM.L["Undercut by whitelisted player."] = "Undercut by whitelisted player."
--[[Translation missing --]]
TSM.L["Undercutting blacklisted player."] = "Undercutting blacklisted player."
--[[Translation missing --]]
TSM.L["Undercutting competition."] = "Undercutting competition."
--[[Translation missing --]]
TSM.L["Ungrouped Items"] = "Ungrouped Items"
--[[Translation missing --]]
TSM.L["Unknown Item"] = "Unknown Item"
TSM.L["Unwrap Gift"] = "선물포장지 오픈음"
TSM.L["Up"] = "위로 "
--[[Translation missing --]]
TSM.L["UPDATE EXISTING MACRO"] = "UPDATE EXISTING MACRO"
TSM.L["Usage: /tsm price <ItemLink> <Price String>"] = "사용법: /tsm 가격 <아이템 링크> <가격 문자열>"
--[[Translation missing --]]
TSM.L["Use smart average for purchase price"] = "Use smart average for purchase price"
--[[Translation missing --]]
TSM.L["Use the field below to search the auction house by filter"] = "Use the field below to search the auction house by filter"
--[[Translation missing --]]
TSM.L["Use the list to the left to select groups, & operations you'd like to create export strings for."] = "Use the list to the left to select groups, & operations you'd like to create export strings for."
--[[Translation missing --]]
TSM.L["VALUE PRICE SOURCE"] = "VALUE PRICE SOURCE"
--[[Translation missing --]]
TSM.L["ValueSources"] = "ValueSources"
--[[Translation missing --]]
TSM.L["Variable Name"] = "Variable Name"
--[[Translation missing --]]
TSM.L["Vendor"] = "Vendor"
--[[Translation missing --]]
TSM.L["Vendor Buy Price"] = "Vendor Buy Price"
--[[Translation missing --]]
TSM.L["Vendor Search"] = "Vendor Search"
--[[Translation missing --]]
TSM.L["VENDOR SEARCH"] = "VENDOR SEARCH"
--[[Translation missing --]]
TSM.L["Vendor Sell"] = "Vendor Sell"
--[[Translation missing --]]
TSM.L["Vendor Sell Price"] = "Vendor Sell Price"
--[[Translation missing --]]
TSM.L["Vendoring 'SELL ALL' Button"] = "Vendoring 'SELL ALL' Button"
--[[Translation missing --]]
TSM.L["View ignored items in the Destroying options."] = "View ignored items in the Destroying options."
--[[Translation missing --]]
TSM.L["Warehousing"] = "Warehousing"
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group."] = "Warehousing will move a max of %d of each item in this group."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group."] = "Warehousing will move all of the items in this group."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."
TSM.L["WARNING: The macro was too long, so was truncated to fit by WoW."] = "경고: 매크로가 너무 깁니다, 적당한 길이로 조정할것"
--[[Translation missing --]]
TSM.L["WARNING: You minimum price for %s is below its vendorsell price (with AH cut taken into account). Consider raising your minimum price, or vendoring the item."] = "WARNING: You minimum price for %s is below its vendorsell price (with AH cut taken into account). Consider raising your minimum price, or vendoring the item."
--[[Translation missing --]]
TSM.L["When above maximum:"] = "When above maximum:"
--[[Translation missing --]]
TSM.L["When below minimum:"] = "When below minimum:"
--[[Translation missing --]]
TSM.L["Whitelist"] = "Whitelist"
TSM.L["Whitelisted Players"] = "허용된 플레이어"
--[[Translation missing --]]
TSM.L["You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"] = "You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"
--[[Translation missing --]]
TSM.L["You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."] = "You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."
TSM.L["You cannot use %s as part of this custom price."] = "이 사용자 가격의 일부분으로 %s|1을;를; 사용할 수 없습니다."
--[[Translation missing --]]
TSM.L["You cannot use %s within convert() as part of this custom price."] = "You cannot use %s within convert() as part of this custom price."
--[[Translation missing --]]
TSM.L["You do not need to add \"%s\", alts are whitelisted automatically."] = "You do not need to add \"%s\", alts are whitelisted automatically."
--[[Translation missing --]]
TSM.L["You don't know how to craft this item."] = "You don't know how to craft this item."
TSM.L["You must reload your UI for these settings to take effect. Reload now?"] = "당신의 UI를 다시 불러와야 설정이 적용됩니다. 다시 불러옵니까? "
TSM.L["You won an auction for %sx%d for %s"] = "당신은 경매물품 %s 을(를) %s 에 낙찰받으셨습니다!"
--[[Translation missing --]]
TSM.L["Your auction has not been undercut."] = "Your auction has not been undercut."
--[[Translation missing --]]
TSM.L["Your auction of %s expired"] = "Your auction of %s expired"
TSM.L["Your auction of %s has sold for %s!"] = "당신의 경매물품 %s (이)가 %s 에 판매되었습니다!"
--[[Translation missing --]]
TSM.L["Your Buyout"] = "Your Buyout"
--[[Translation missing --]]
TSM.L["Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"] = "Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"
--[[Translation missing --]]
TSM.L["Your default craft value method was invalid so it has been returned to the default. Details: %s"] = "Your default craft value method was invalid so it has been returned to the default. Details: %s"
--[[Translation missing --]]
TSM.L["Your task list is currently empty."] = "Your task list is currently empty."
--[[Translation missing --]]
TSM.L["You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."] = "You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."
--[[Translation missing --]]
TSM.L["You've been undercut."] = "You've been undercut."
--[[Translation missing --]]
TSM.L["YY/MM/DD HH:MM"] = "YY/MM/DD HH:MM"
	elseif locale == "ptBR" then
TSM.L = TSM.L or {}
--[[Translation missing --]]
TSM.L["%d |4Group:Groups; Selected (%d |4Item:Items;)"] = "%d |4Group:Groups; Selected (%d |4Item:Items;)"
TSM.L["%d auctions"] = "%d leilões"
TSM.L["%d Groups"] = "%d Grupos"
TSM.L["%d Items"] = "%d Items"
TSM.L["%d of %d"] = "%d de %d"
TSM.L["%d Operations"] = "%d Operações"
TSM.L["%d Posted Auctions"] = "%d Leilões Postados"
TSM.L["%d Sold Auctions"] = "%d Leilões Vendidos"
TSM.L["%s (%s bags, %s bank, %s AH, %s mail)"] = "%s (%s bolsas, %s banco, %s CdL, %s correio) "
TSM.L["%s (%s player, %s alts, %s guild, %s AH)"] = "%s (%s jogador, %s alts, %s guilda, %s CdL)"
TSM.L["%s (%s profit)"] = "%s (%s lucro)"
TSM.L["%s ago"] = "%s atrás"
TSM.L["%s Crafts"] = "%s Criações"
TSM.L["%s in guild vault"] = "%s no cofre da guilda"
TSM.L["%s is a valid custom price but %s is an invalid item."] = "%s é um preço personalizado válido mas %s é um item inválido."
TSM.L["%s is a valid custom price but did not give a value for %s."] = "%s é um preço personalizado válido mas deu um valor para %."
TSM.L["'%s' is an invalid operation! Min restock of %d is higher than max restock of %d."] = "'%s' é uma operação inválida! reabastecimento mínimo de %d é maior que o reabastecimento máximo de %d."
TSM.L["%s is not a valid custom price and gave the following error: %s"] = "%s não é um preço personalizado válido e deu o seguinte erro: %s"
TSM.L["%s operation(s)"] = "%s operação(ões)"
TSM.L["%s removed."] = "%s removido."
TSM.L["%s sent you %s"] = "%s lhe enviou %s"
TSM.L["%s sent you %s and %s"] = "%s lhe enviou %s e %s"
TSM.L["%s sent you a COD of %s for %s"] = "%s lhe enviou uma Carta a Cobrar de %s por %s"
TSM.L["%s sent you a message: %s"] = "%s lhe enviou uma mensagem: %s"
TSM.L["%s total"] = "%s total"
TSM.L["%sDrag%s to move this button"] = "%sArraste%s para mover este botão"
TSM.L["%sLeft-Click%s to open the main window"] = "%sClique-Esquerdo%s para abrir a janela principal"
TSM.L["(%d/500 Characters)"] = "(%d/500 Caracteres)"
TSM.L["(max %d)"] = "(máximo %d)"
TSM.L["(max 200)"] = "(máximo 200)"
TSM.L["(max 5000)"] = "(máximo 5000)"
TSM.L["(min %d - max %d)"] = "(mínimo %d - máximo %d)"
TSM.L["(min 0 - max 10000)"] = "(mínimo 0 - máximo 10000)"
TSM.L["(minimum 0 - maximum 2)"] = "(mínimo 0 - máximo 2)"
TSM.L["(minimum 0 - maximum 20)"] = "(mínimo 0 - máximo 20)"
TSM.L["(minimum 0 - maximum 2000)"] = "(mínimo 0 - máximo 2000)"
TSM.L["(minimum 0 - maximum 30)"] = "(mínimo 0 - máximo 30)"
TSM.L["(minimum 0 - maximum 905)"] = "(mínimo 0 - máximo 905)"
TSM.L["(minimum 0% - maximum 50%)"] = "(mínimo 0% - máximo 50%)"
TSM.L["(minimum 0.5 - maximum 10)"] = "(mínimo 0.5 - máximo 10)"
TSM.L["(minimum 1 - maximum 100)"] = "(mínimo 1 - máximo 100)"
TSM.L["(minimum 8 - maximum 25)"] = "(mínimo 8 - máximo 25)"
TSM.L["(New group(s) will be created)"] = "(Novo grupo(s) será criado)"
TSM.L["/tsm help|r - Shows this help listing"] = "/tsm help|r - Mostra esta lista de ajuda"
TSM.L["/tsm|r - opens the main TSM window."] = "/tsm|r - abre a janela principal do TSM."
TSM.L["_ Hr _ Min ago"] = "_ Hr _ Min atrás"
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."] = "|cffff0000IMPORTANT:|r Quando TSM_Accounting salvou os dados para este reino, eles eram muito grandes para o WoW lidar, então os dados antigos foram automaticamente cortados para evitar a corrupção das variáveis salvas. O último %s de dados de compra foi preservado."
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."] = "|cffff0000IMPORTANT:|r Quando TSM_Accounting salvou os dados para este reino, eles eram muito grandes para o WoW lidar, então os dados antigos foram automaticamente cortados para evitar a corrupção das variáveis salvas. O último %s de dados de venda foi preservado."
TSM.L["|cffff0000WARNING:|r TSM_AuctionDB doesn't currently have any pricing data for your realm. Either download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update TSM_AuctionDB's data, or run a manual scan in-game."] = "|cffff0000WARNING:|r TSM_AuctionDB não tem dados de preços para o seu reino. Baixe o TSM Desktop Application de |cff99ffffhttp://tradeskillmaster.com|r para atualizar automaticamente os dados de TSM_AuctionDB, ou faça um scan manual dentro do jogo."
TSM.L["|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."] = "|cffffd839Left-Click|r para ignorar um item nesta sessão. Segure |cffffd839Shift|r para ignorar permanentemente. Você pode remover itens ignorados permanentemente nas configurações de venda."
TSM.L["|cffffd839Left-Click|r to ignore an item this session."] = "|cffffd839Left-Click|r para ignorar um item nesta sessão."
TSM.L["|cffffd839Shift-Left-Click|r to ignore it permanently."] = "|cffffd839Shift-Left-Click|r para ignorar isto permanentemente."
TSM.L["1 Group"] = "1 Grupo"
TSM.L["1 Item"] = "1 Item"
TSM.L["12 hr"] = "12hs"
TSM.L["24 hr"] = "24hs"
TSM.L["48 hr"] = "48hs"
TSM.L["A custom price of %s for %s evaluates to %s."] = "O preço personalizado de %s para %s calcula %s."
TSM.L["A maximum of 1 convert() function is allowed."] = "É permitida no máximo 1 função convert()."
TSM.L["A scan is already in progress. Please stop that scan before starting another one."] = "Um scan está atualmente em progresso. Por favor pare este scan antes de iniciar outro."
--[[Translation missing --]]
TSM.L["Above max expires."] = "Above max expires."
--[[Translation missing --]]
TSM.L["Above max price. Not posting."] = "Above max price. Not posting."
--[[Translation missing --]]
TSM.L["Above max price. Posting at max price."] = "Above max price. Posting at max price."
--[[Translation missing --]]
TSM.L["Above max price. Posting at min price."] = "Above max price. Posting at min price."
--[[Translation missing --]]
TSM.L["Above max price. Posting at normal price."] = "Above max price. Posting at normal price."
--[[Translation missing --]]
TSM.L["Accepting these item(s) will cost"] = "Accepting these item(s) will cost"
--[[Translation missing --]]
TSM.L["Accepting this item will cost"] = "Accepting this item will cost"
--[[Translation missing --]]
TSM.L["Account sync removed. Please delete the account sync from the other account as well."] = "Account sync removed. Please delete the account sync from the other account as well."
TSM.L["Account Syncing"] = "Sincronização da Conta"
--[[Translation missing --]]
TSM.L["Accounting"] = "Accounting"
--[[Translation missing --]]
TSM.L["Accounting Tooltips"] = "Accounting Tooltips"
--[[Translation missing --]]
TSM.L["Activity Type"] = "Activity Type"
--[[Translation missing --]]
TSM.L["ADD %d ITEMS"] = "ADD %d ITEMS"
--[[Translation missing --]]
TSM.L["Add / Remove Items"] = "Add / Remove Items"
--[[Translation missing --]]
TSM.L["ADD NEW CUSTOM PRICE SOURCE"] = "ADD NEW CUSTOM PRICE SOURCE"
--[[Translation missing --]]
TSM.L["ADD OPERATION"] = "ADD OPERATION"
--[[Translation missing --]]
TSM.L["Add Player"] = "Add Player"
--[[Translation missing --]]
TSM.L["Add Subject / Description"] = "Add Subject / Description"
--[[Translation missing --]]
TSM.L["Add Subject / Description (Optional)"] = "Add Subject / Description (Optional)"
--[[Translation missing --]]
TSM.L["ADD TO MAIL"] = "ADD TO MAIL"
TSM.L["Additional error suppressed"] = "Erro adicional suprimido"
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be auctioned."] = "Adjust the settings below to set how groups attached to this operation will be auctioned."
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be cancelled."] = "Adjust the settings below to set how groups attached to this operation will be cancelled."
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be priced."] = "Adjust the settings below to set how groups attached to this operation will be priced."
--[[Translation missing --]]
TSM.L["Advanced Item Search"] = "Advanced Item Search"
--[[Translation missing --]]
TSM.L["Advanced Options"] = "Advanced Options"
TSM.L["AH"] = "CdL"
TSM.L["AH (Crafting)"] = "CdL (Criação)"
TSM.L["AH (Disenchanting)"] = "CdL (Desencantamento)"
TSM.L["AH BUSY"] = "CdL OCUPADA"
TSM.L["AH Frame Options"] = "Opções da Janela de CdL"
TSM.L["AH Rows Shown (requires reload)"] = "Linhas Exibidas na CdL (requerer recarregamento)"
TSM.L["Alarm Clock"] = "Despertador"
--[[Translation missing --]]
TSM.L["All Auctions"] = "All Auctions"
--[[Translation missing --]]
TSM.L["All Characters and Guilds"] = "All Characters and Guilds"
--[[Translation missing --]]
TSM.L["All Professions"] = "All Professions"
--[[Translation missing --]]
TSM.L["Allow partial stack?"] = "Allow partial stack?"
--[[Translation missing --]]
TSM.L["Alt Guild Bank"] = "Alt Guild Bank"
--[[Translation missing --]]
TSM.L["Alts"] = "Alts"
TSM.L["Alts AH"] = "Alts CdL"
--[[Translation missing --]]
TSM.L["Amount"] = "Amount"
--[[Translation missing --]]
TSM.L["AMOUNT"] = "AMOUNT"
--[[Translation missing --]]
TSM.L["Amount of Bag Space to Keep Free"] = "Amount of Bag Space to Keep Free"
TSM.L["Applied %s to %s."] = "Aplicado %s em %s."
--[[Translation missing --]]
TSM.L["APPLY FILTERS"] = "APPLY FILTERS"
--[[Translation missing --]]
TSM.L["Apply operation to group:"] = "Apply operation to group:"
--[[Translation missing --]]
TSM.L["Are you sure you want to clear old accounting data?"] = "Are you sure you want to clear old accounting data?"
TSM.L["Are you sure you want to delete this group?"] = "Você tem certeza que você quer excluir esse grupo? "
TSM.L["Are you sure you want to delete this operation?"] = "Você tem certeza que você quer excluir essa operação?"
--[[Translation missing --]]
TSM.L["Are you sure you want to reset all operation settings?"] = "Are you sure you want to reset all operation settings?"
--[[Translation missing --]]
TSM.L["At above max price and not undercut."] = "At above max price and not undercut."
--[[Translation missing --]]
TSM.L["At normal price and not undercut."] = "At normal price and not undercut."
--[[Translation missing --]]
TSM.L["Auction"] = "Auction"
--[[Translation missing --]]
TSM.L["AUCTION DETAILS"] = "AUCTION DETAILS"
--[[Translation missing --]]
TSM.L["Auction Duration"] = "Auction Duration"
--[[Translation missing --]]
TSM.L["Auction has been bid on."] = "Auction has been bid on."
TSM.L["Auction Window Close"] = "Fechar Janela de Leilão"
TSM.L["Auction Window Open"] = "Abrir Janela de Leilão"
TSM.L["Auctionator - Auction Value"] = "Auctionator - Valor de Leilão"
TSM.L["Auctioneer - Appraiser"] = "Auctioneer - Avaliador"
TSM.L["Auctioneer - Market Value"] = "Auctioneer - Valor de Mercado"
TSM.L["Auctioneer - Minimum Buyout"] = "Auctioneer - Arremate Mínimo"
--[[Translation missing --]]
TSM.L["Auctioning"] = "Auctioning"
--[[Translation missing --]]
TSM.L["Auctioning Log"] = "Auctioning Log"
--[[Translation missing --]]
TSM.L["Auctioning Operation"] = "Auctioning Operation"
--[[Translation missing --]]
TSM.L["Auctioning 'POST'/'CANCEL' Button"] = "Auctioning 'POST'/'CANCEL' Button"
TSM.L["Auctions"] = "Leilões "
TSM.L["Auto Quest Complete"] = "Busca Automática Concluída "
--[[Translation missing --]]
TSM.L["Automatically sell vendor trash?"] = "Automatically sell vendor trash?"
--[[Translation missing --]]
TSM.L["Average Earned Per Day:"] = "Average Earned Per Day:"
--[[Translation missing --]]
TSM.L["Average Prices:"] = "Average Prices:"
--[[Translation missing --]]
TSM.L["Average Profit Per Day:"] = "Average Profit Per Day:"
--[[Translation missing --]]
TSM.L["Average Spent Per Day:"] = "Average Spent Per Day:"
--[[Translation missing --]]
TSM.L["Avg Buy Price"] = "Avg Buy Price"
--[[Translation missing --]]
TSM.L["Avg Resale Profit"] = "Avg Resale Profit"
--[[Translation missing --]]
TSM.L["Avg Sell Price"] = "Avg Sell Price"
--[[Translation missing --]]
TSM.L["BACK TO LIST"] = "BACK TO LIST"
--[[Translation missing --]]
TSM.L["Back to List"] = "Back to List"
--[[Translation missing --]]
TSM.L["Bag"] = "Bag"
TSM.L["Bags"] = "Bolsas"
--[[Translation missing --]]
TSM.L["Banks"] = "Banks"
TSM.L["BankUI Move Delay"] = "Atraso de movimento IUBanco"
--[[Translation missing --]]
TSM.L["Base Group"] = "Base Group"
--[[Translation missing --]]
TSM.L["Base Item"] = "Base Item"
--[[Translation missing --]]
TSM.L["Batch size"] = "Batch size"
TSM.L["Below are your currently available price sources organized by module. The %skey|r is what you would type into a custom price box."] = "Abaixo estão suas fontes de preços atualmente disponíveis e organizadas por módulo. O %skey|r é o que você digitaria em uma caixa de preço personalizado."
--[[Translation missing --]]
TSM.L["Below custom price:"] = "Below custom price:"
--[[Translation missing --]]
TSM.L["Below min price. Posting at max price."] = "Below min price. Posting at max price."
--[[Translation missing --]]
TSM.L["Below min price. Posting at min price."] = "Below min price. Posting at min price."
--[[Translation missing --]]
TSM.L["Below min price. Posting at normal price."] = "Below min price. Posting at normal price."
--[[Translation missing --]]
TSM.L["Below, you can manage your profiles which allow you to have entirely different sets of groups."] = "Below, you can manage your profiles which allow you to have entirely different sets of groups."
--[[Translation missing --]]
TSM.L["Bid %d / %d"] = "Bid %d / %d"
--[[Translation missing --]]
TSM.L["Bid (item)"] = "Bid (item)"
--[[Translation missing --]]
TSM.L["Bid (stack)"] = "Bid (stack)"
--[[Translation missing --]]
TSM.L["Bid Price"] = "Bid Price"
--[[Translation missing --]]
TSM.L["Bid Sniper Paused"] = "Bid Sniper Paused"
--[[Translation missing --]]
TSM.L["Bid Sniper Running"] = "Bid Sniper Running"
--[[Translation missing --]]
TSM.L["Blacklisted players:"] = "Blacklisted players:"
--[[Translation missing --]]
TSM.L["Bought"] = "Bought"
--[[Translation missing --]]
TSM.L["Bought %sx%d for %s from %s"] = "Bought %sx%d for %s from %s"
--[[Translation missing --]]
TSM.L["Bound Actions"] = "Bound Actions"
--[[Translation missing --]]
TSM.L["BUSY"] = "BUSY"
--[[Translation missing --]]
TSM.L["BUY"] = "BUY"
--[[Translation missing --]]
TSM.L["Buy"] = "Buy"
--[[Translation missing --]]
TSM.L["Buy %d / %d"] = "Buy %d / %d"
--[[Translation missing --]]
TSM.L["Buy %d / %d (Confirming %d / %d)"] = "Buy %d / %d (Confirming %d / %d)"
TSM.L["Buy from AH"] = "Comprar da CdL"
TSM.L["Buy from Vendor"] = "Comprar do Vendedor"
--[[Translation missing --]]
TSM.L["BUY GROUPS"] = "BUY GROUPS"
--[[Translation missing --]]
TSM.L["Buy Options"] = "Buy Options"
--[[Translation missing --]]
TSM.L["BUYBACK ALL"] = "BUYBACK ALL"
--[[Translation missing --]]
TSM.L["Buyer/Seller"] = "Buyer/Seller"
--[[Translation missing --]]
TSM.L["Buyout (item)"] = "Buyout (item)"
--[[Translation missing --]]
TSM.L["Buyout (stack)"] = "Buyout (stack)"
--[[Translation missing --]]
TSM.L["Buyout Price"] = "Buyout Price"
--[[Translation missing --]]
TSM.L["Buyout Sniper Paused"] = "Buyout Sniper Paused"
--[[Translation missing --]]
TSM.L["Buyout Sniper Running"] = "Buyout Sniper Running"
--[[Translation missing --]]
TSM.L["BUYS"] = "BUYS"
--[[Translation missing --]]
TSM.L["By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."] = "By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."
TSM.L["Can Craft At Least One, Profit, Craftable Quantity"] = "Pode Criar Pelo Menos Um, Lucro, Quantidade Criável"
--[[Translation missing --]]
TSM.L["Cancel auctions with bids"] = "Cancel auctions with bids"
--[[Translation missing --]]
TSM.L["Cancel Scan"] = "Cancel Scan"
--[[Translation missing --]]
TSM.L["Cancel to repost higher?"] = "Cancel to repost higher?"
--[[Translation missing --]]
TSM.L["Cancel undercut auctions?"] = "Cancel undercut auctions?"
--[[Translation missing --]]
TSM.L["Canceling"] = "Canceling"
--[[Translation missing --]]
TSM.L["Canceling %d / %d"] = "Canceling %d / %d"
--[[Translation missing --]]
TSM.L["Canceling %d Auctions..."] = "Canceling %d Auctions..."
--[[Translation missing --]]
TSM.L["Canceling all auctions."] = "Canceling all auctions."
--[[Translation missing --]]
TSM.L["Canceling auction which you've undercut."] = "Canceling auction which you've undercut."
--[[Translation missing --]]
TSM.L["Canceling disabled."] = "Canceling disabled."
--[[Translation missing --]]
TSM.L["Canceling Settings"] = "Canceling Settings"
--[[Translation missing --]]
TSM.L["Canceling to repost at higher price."] = "Canceling to repost at higher price."
--[[Translation missing --]]
TSM.L["Canceling to repost at reset price."] = "Canceling to repost at reset price."
--[[Translation missing --]]
TSM.L["Canceling to repost higher."] = "Canceling to repost higher."
--[[Translation missing --]]
TSM.L["Canceling undercut auctions and to repost higher."] = "Canceling undercut auctions and to repost higher."
--[[Translation missing --]]
TSM.L["Canceling undercut auctions."] = "Canceling undercut auctions."
--[[Translation missing --]]
TSM.L["Cancelled"] = "Cancelled"
--[[Translation missing --]]
TSM.L["Cancelled auction of %sx%d"] = "Cancelled auction of %sx%d"
--[[Translation missing --]]
TSM.L["Cancelled Since Last Sale"] = "Cancelled Since Last Sale"
--[[Translation missing --]]
TSM.L["CANCELS"] = "CANCELS"
--[[Translation missing --]]
TSM.L["Cannot repair from the guild bank!"] = "Cannot repair from the guild bank!"
TSM.L["Can't load TSM tooltip while in combat"] = "Não é possível carregar as informações do TSM emquanto estiver em combate."
TSM.L["Cash Register"] = "Caixa Registradora"
--[[Translation missing --]]
TSM.L["Character"] = "Character"
--[[Translation missing --]]
TSM.L["CHARACTER"] = "CHARACTER"
--[[Translation missing --]]
TSM.L["Character Bags"] = "Character Bags"
--[[Translation missing --]]
TSM.L["Character Bank"] = "Character Bank"
--[[Translation missing --]]
TSM.L["CHARACTERS"] = "CHARACTERS"
TSM.L["Chat Tab"] = "Aba de Bate-Papo"
--[[Translation missing --]]
TSM.L["Cheapest auction below min price."] = "Cheapest auction below min price."
--[[Translation missing --]]
TSM.L["Clean Automatically"] = "Clean Automatically"
TSM.L["Clear"] = "Limpar"
--[[Translation missing --]]
TSM.L["Clear All"] = "Clear All"
--[[Translation missing --]]
TSM.L["CLEAR DATA"] = "CLEAR DATA"
--[[Translation missing --]]
TSM.L["Clear Filters"] = "Clear Filters"
--[[Translation missing --]]
TSM.L["Clear Log After 'X' Amount of Days"] = "Clear Log After 'X' Amount of Days"
--[[Translation missing --]]
TSM.L["Clear Old Data"] = "Clear Old Data"
--[[Translation missing --]]
TSM.L["Clear Old Data Confirmation"] = "Clear Old Data Confirmation"
--[[Translation missing --]]
TSM.L["Clear Queue"] = "Clear Queue"
TSM.L["Clear Selection"] = "Limpar Seleção"
--[[Translation missing --]]
TSM.L["COD"] = "COD"
TSM.L["Coins (%s)"] = "Moedas (%s)"
--[[Translation missing --]]
TSM.L["Combine Partial Stacks"] = "Combine Partial Stacks"
--[[Translation missing --]]
TSM.L["Combining..."] = "Combining..."
--[[Translation missing --]]
TSM.L["Configuration Scroll Wheel"] = "Configuration Scroll Wheel"
--[[Translation missing --]]
TSM.L["Confirm"] = "Confirm"
--[[Translation missing --]]
TSM.L["Confirm Complete Sound"] = "Confirm Complete Sound"
--[[Translation missing --]]
TSM.L["Confirming %d / %d"] = "Confirming %d / %d"
TSM.L["Connected to %s"] = "Conectado a %s"
--[[Translation missing --]]
TSM.L["Connecting to %s"] = "Connecting to %s"
--[[Translation missing --]]
TSM.L["CONTACTS"] = "CONTACTS"
--[[Translation missing --]]
TSM.L["Contacts Menu"] = "Contacts Menu"
--[[Translation missing --]]
TSM.L["Cooldown"] = "Cooldown"
--[[Translation missing --]]
TSM.L["Cooldowns"] = "Cooldowns"
--[[Translation missing --]]
TSM.L["Cost"] = "Cost"
--[[Translation missing --]]
TSM.L["Could not apply %s operation %s to %s - it has too many operations already."] = "Could not apply %s operation %s to %s - it has too many operations already."
--[[Translation missing --]]
TSM.L["Could not apply %s operation to group %s because the group does not exist"] = "Could not apply %s operation to group %s because the group does not exist"
--[[Translation missing --]]
TSM.L["Could not create macro as you already have too many. Delete one of your existing macros and try again."] = "Could not create macro as you already have too many. Delete one of your existing macros and try again."
--[[Translation missing --]]
TSM.L["Could not deserialize input"] = "Could not deserialize input"
--[[Translation missing --]]
TSM.L["Could not find enchanted item from"] = "Could not find enchanted item from"
--[[Translation missing --]]
TSM.L["Could not find pet"] = "Could not find pet"
TSM.L["Could not find profile '%s'. Possible profiles: '%s'"] = "Não foi possível encontrar o perfil '%s'. Perfis possíveis: '%s'"
--[[Translation missing --]]
TSM.L["Could not sell items due to not having free bag space available to split a stack of items."] = "Could not sell items due to not having free bag space available to split a stack of items."
TSM.L["Craft"] = "Criação"
TSM.L["CRAFT"] = "CRIAR"
TSM.L["Craft (Unprofitable)"] = "Criar (Sem lucro)"
TSM.L["Craft (When Profitable)"] = "Criar (Quando existir Lucro)"
TSM.L["Craft All"] = "Criar Todos"
TSM.L["CRAFT ALL"] = "CRIAR TODOS"
TSM.L["Craft Name"] = "Nome da Criação"
TSM.L["CRAFT NEXT"] = "CRIAR PRÓXIMO"
TSM.L["Craft value method:"] = "Método de valor da criação:"
TSM.L["Craftable Quantity, Profit"] = "Quantidade Criável, Lucro"
TSM.L["CRAFTER"] = "CRIADOR"
TSM.L["CRAFTING"] = "CRIAÇÃO"
TSM.L["Crafting"] = "Criação"
TSM.L["Crafting Cost"] = "Custo de Criação"
--[[Translation missing --]]
TSM.L["Crafting 'CRAFT NEXT' Button"] = "Crafting 'CRAFT NEXT' Button"
TSM.L["Crafting Queue"] = "Fila de Criação"
TSM.L["Crafting Tooltips"] = "Tooltips de Criação"
TSM.L["Crafts"] = "Criações"
TSM.L["Crafts %d"] = "Criações %d"
--[[Translation missing --]]
TSM.L["CREATE MACRO"] = "CREATE MACRO"
TSM.L["Create New Operation"] = "Criar Nova Operação"
--[[Translation missing --]]
TSM.L["CREATE NEW PROFILE"] = "CREATE NEW PROFILE"
TSM.L["Crystals"] = "Cristais "
--[[Translation missing --]]
TSM.L["Current Profiles"] = "Current Profiles"
--[[Translation missing --]]
TSM.L["CURRENT SEARCH"] = "CURRENT SEARCH"
--[[Translation missing --]]
TSM.L["CUSTOM POST"] = "CUSTOM POST"
--[[Translation missing --]]
TSM.L["Custom Price"] = "Custom Price"
TSM.L["Custom Price Source"] = "Fonte de Preço Personalizado"
--[[Translation missing --]]
TSM.L["Custom Sources"] = "Custom Sources"
--[[Translation missing --]]
TSM.L["Database Sources"] = "Database Sources"
--[[Translation missing --]]
TSM.L["DD/MM/YY HH:MM"] = "DD/MM/YY HH:MM"
TSM.L["Default Craft Value Method:"] = "Método de Valor de Criação Padrão:"
--[[Translation missing --]]
TSM.L["Default Material Cost Method:"] = "Default Material Cost Method:"
--[[Translation missing --]]
TSM.L["Default Price"] = "Default Price"
--[[Translation missing --]]
TSM.L["Default Price Configuration"] = "Default Price Configuration"
--[[Translation missing --]]
TSM.L["Default vendoring page"] = "Default vendoring page"
--[[Translation missing --]]
TSM.L["Define whet priority Gathering gives certain sources."] = "Define whet priority Gathering gives certain sources."
--[[Translation missing --]]
TSM.L["Delete Profile Confirmation"] = "Delete Profile Confirmation"
--[[Translation missing --]]
TSM.L["DEPOSIT REAGENTS"] = "DEPOSIT REAGENTS"
TSM.L["Deselect All Groups"] = "Desselecionar Todos os Grupos"
--[[Translation missing --]]
TSM.L["Deselect All Items"] = "Deselect All Items"
--[[Translation missing --]]
TSM.L["Destroy Next"] = "Destroy Next"
TSM.L["Destroy Value"] = "Valor de Destruição"
--[[Translation missing --]]
TSM.L["Destroy Value Source"] = "Destroy Value Source"
--[[Translation missing --]]
TSM.L["Destroying"] = "Destroying"
--[[Translation missing --]]
TSM.L["Destroying 'DESTROY NEXT' Button"] = "Destroying 'DESTROY NEXT' Button"
--[[Translation missing --]]
TSM.L["Destroying Tooltips"] = "Destroying Tooltips"
--[[Translation missing --]]
TSM.L["Destroying..."] = "Destroying..."
--[[Translation missing --]]
TSM.L["Details"] = "Details"
--[[Translation missing --]]
TSM.L["Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."] = "Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your maximum price (%s) is invalid. Check your settings."] = "Did not cancel %s because your maximum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your minimum price (%s) is invalid. Check your settings."] = "Did not cancel %s because your minimum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your normal price (%s) is invalid. Check your settings."] = "Did not cancel %s because your normal price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your undercut (%s) is invalid. Check your settings."] = "Did not cancel %s because your undercut (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."] = "Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."
--[[Translation missing --]]
TSM.L["Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."] = "Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."
--[[Translation missing --]]
TSM.L["Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."] = "Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."
--[[Translation missing --]]
TSM.L["Did not post %s because your maximum price (%s) is invalid. Check your settings."] = "Did not post %s because your maximum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your minimum price (%s) is invalid. Check your settings."] = "Did not post %s because your minimum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your normal price (%s) is invalid. Check your settings."] = "Did not post %s because your normal price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your stack size (%d) is higher than the max stack size of the item (%d)."] = "Did not post %s because your stack size (%d) is higher than the max stack size of the item (%d)."
--[[Translation missing --]]
TSM.L["Did not post %s because your undercut (%s) is invalid. Check your settings."] = "Did not post %s because your undercut (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Disable invalid price warnings"] = "Disable invalid price warnings"
--[[Translation missing --]]
TSM.L["Disenchant Search"] = "Disenchant Search"
--[[Translation missing --]]
TSM.L["DISENCHANT SEARCH"] = "DISENCHANT SEARCH"
--[[Translation missing --]]
TSM.L["Disenchant Search Options"] = "Disenchant Search Options"
--[[Translation missing --]]
TSM.L["Disenchant Value"] = "Disenchant Value"
--[[Translation missing --]]
TSM.L["Disenchanting Options"] = "Disenchanting Options"
--[[Translation missing --]]
TSM.L["Display auctioning values"] = "Display auctioning values"
--[[Translation missing --]]
TSM.L["Display cancelled since last sale"] = "Display cancelled since last sale"
TSM.L["Display crafting cost"] = "Exibir custo de criação"
--[[Translation missing --]]
TSM.L["Display detailed destroy info"] = "Display detailed destroy info"
--[[Translation missing --]]
TSM.L["Display disenchant value"] = "Display disenchant value"
--[[Translation missing --]]
TSM.L["Display global historical price"] = "Display global historical price"
--[[Translation missing --]]
TSM.L["Display global market value avg"] = "Display global market value avg"
--[[Translation missing --]]
TSM.L["Display global min buyout avg"] = "Display global min buyout avg"
--[[Translation missing --]]
TSM.L["Display global sale avg"] = "Display global sale avg"
--[[Translation missing --]]
TSM.L["Display group name"] = "Display group name"
--[[Translation missing --]]
TSM.L["Display historical price"] = "Display historical price"
--[[Translation missing --]]
TSM.L["Display market value"] = "Display market value"
--[[Translation missing --]]
TSM.L["Display mill value"] = "Display mill value"
--[[Translation missing --]]
TSM.L["Display min buyout"] = "Display min buyout"
--[[Translation missing --]]
TSM.L["Display Operation Names"] = "Display Operation Names"
--[[Translation missing --]]
TSM.L["Display prospect value"] = "Display prospect value"
--[[Translation missing --]]
TSM.L["Display purchase info"] = "Display purchase info"
--[[Translation missing --]]
TSM.L["Display region historical price"] = "Display region historical price"
--[[Translation missing --]]
TSM.L["Display region market value avg"] = "Display region market value avg"
--[[Translation missing --]]
TSM.L["Display region min buyout avg"] = "Display region min buyout avg"
--[[Translation missing --]]
TSM.L["Display region sale avg"] = "Display region sale avg"
--[[Translation missing --]]
TSM.L["Display region sale rate"] = "Display region sale rate"
--[[Translation missing --]]
TSM.L["Display region sold per day"] = "Display region sold per day"
--[[Translation missing --]]
TSM.L["Display sale info"] = "Display sale info"
--[[Translation missing --]]
TSM.L["Display sale rate"] = "Display sale rate"
--[[Translation missing --]]
TSM.L["Display shopping max price"] = "Display shopping max price"
--[[Translation missing --]]
TSM.L["Display total money recieved in chat?"] = "Display total money recieved in chat?"
--[[Translation missing --]]
TSM.L["Display transform value"] = "Display transform value"
--[[Translation missing --]]
TSM.L["Display vendor buy price"] = "Display vendor buy price"
--[[Translation missing --]]
TSM.L["Display vendor sell price"] = "Display vendor sell price"
--[[Translation missing --]]
TSM.L["Doing so will also remove any sub-groups attached to this group."] = "Doing so will also remove any sub-groups attached to this group."
--[[Translation missing --]]
TSM.L["Done Canceling"] = "Done Canceling"
--[[Translation missing --]]
TSM.L["Done Posting"] = "Done Posting"
--[[Translation missing --]]
TSM.L["Done Scanning"] = "Done Scanning"
--[[Translation missing --]]
TSM.L["Don't post after this many expires:"] = "Don't post after this many expires:"
--[[Translation missing --]]
TSM.L["Don't Post Items"] = "Don't Post Items"
--[[Translation missing --]]
TSM.L["Don't prompt to record trades"] = "Don't prompt to record trades"
--[[Translation missing --]]
TSM.L["DOWN"] = "DOWN"
--[[Translation missing --]]
TSM.L["Drag in Additional Items (%d/%d Items)"] = "Drag in Additional Items (%d/%d Items)"
--[[Translation missing --]]
TSM.L["Drag Item(s) Into Box"] = "Drag Item(s) Into Box"
--[[Translation missing --]]
TSM.L["Duplicate"] = "Duplicate"
--[[Translation missing --]]
TSM.L["Duplicate Profile Confirmation"] = "Duplicate Profile Confirmation"
TSM.L["Dust"] = "Pó"
--[[Translation missing --]]
TSM.L["Elevate your gold-making!"] = "Elevate your gold-making!"
--[[Translation missing --]]
TSM.L["Embed TSM tooltips"] = "Embed TSM tooltips"
--[[Translation missing --]]
TSM.L["EMPTY BAGS"] = "EMPTY BAGS"
TSM.L["Empty parentheses are not allowed"] = "Parênteses vazios não são permitidos"
TSM.L["Empty price string."] = "Preço vazio"
--[[Translation missing --]]
TSM.L["Enable automatic stack combination"] = "Enable automatic stack combination"
--[[Translation missing --]]
TSM.L["Enable buying?"] = "Enable buying?"
--[[Translation missing --]]
TSM.L["Enable inbox chat messages"] = "Enable inbox chat messages"
--[[Translation missing --]]
TSM.L["Enable restock?"] = "Enable restock?"
--[[Translation missing --]]
TSM.L["Enable selling?"] = "Enable selling?"
--[[Translation missing --]]
TSM.L["Enable sending chat messages"] = "Enable sending chat messages"
TSM.L["Enable smart crafting for quests"] = "Habilitar criação inteligente para missões"
--[[Translation missing --]]
TSM.L["Enable TSM Tooltips"] = "Enable TSM Tooltips"
--[[Translation missing --]]
TSM.L["Enable tweet enhancement"] = "Enable tweet enhancement"
--[[Translation missing --]]
TSM.L["Enchant Vellum"] = "Enchant Vellum"
--[[Translation missing --]]
TSM.L["Enter a name for the new profile"] = "Enter a name for the new profile"
--[[Translation missing --]]
TSM.L["Enter Filter"] = "Enter Filter"
--[[Translation missing --]]
TSM.L["Enter Keyword"] = "Enter Keyword"
--[[Translation missing --]]
TSM.L["Enter name of logged-in character from other account"] = "Enter name of logged-in character from other account"
--[[Translation missing --]]
TSM.L["Enter player name"] = "Enter player name"
TSM.L["Essences"] = "Essências"
TSM.L["Establishing connection to %s. Make sure that you've entered this character's name on the other account."] = "Estabelecendo conexão com %s. Certifique-se de ter inserido o nome desse personagem na outra conta."
--[[Translation missing --]]
TSM.L["Estimated Cost:"] = "Estimated Cost:"
--[[Translation missing --]]
TSM.L["Estimated Profit:"] = "Estimated Profit:"
--[[Translation missing --]]
TSM.L["Exact Match Only?"] = "Exact Match Only?"
TSM.L["Exclude crafts with cooldowns"] = "Excluir criações com limitações"
--[[Translation missing --]]
TSM.L["Expenses"] = "Expenses"
--[[Translation missing --]]
TSM.L["EXPENSES"] = "EXPENSES"
--[[Translation missing --]]
TSM.L["Expired"] = "Expired"
--[[Translation missing --]]
TSM.L["Expired Since Last Sale"] = "Expired Since Last Sale"
--[[Translation missing --]]
TSM.L["Expires"] = "Expires"
--[[Translation missing --]]
TSM.L["EXPIRES"] = "EXPIRES"
TSM.L["Exploration"] = "Exploração"
--[[Translation missing --]]
TSM.L["Export"] = "Export"
--[[Translation missing --]]
TSM.L["Export List"] = "Export List"
--[[Translation missing --]]
TSM.L["Failed Auctions"] = "Failed Auctions"
--[[Translation missing --]]
TSM.L["Failed Since Last Sale (Expired/Cancelled)"] = "Failed Since Last Sale (Expired/Cancelled)"
--[[Translation missing --]]
TSM.L["Failed to bid on auction of %s."] = "Failed to bid on auction of %s."
--[[Translation missing --]]
TSM.L["Failed to buy auction of %s."] = "Failed to buy auction of %s."
--[[Translation missing --]]
TSM.L["Failed to find auction for %s, so removing it from the results."] = "Failed to find auction for %s, so removing it from the results."
--[[Translation missing --]]
TSM.L["Favorite Scans"] = "Favorite Scans"
--[[Translation missing --]]
TSM.L["Favorite Searches"] = "Favorite Searches"
--[[Translation missing --]]
TSM.L["Filter Auctions by Duration"] = "Filter Auctions by Duration"
--[[Translation missing --]]
TSM.L["Filter Auctions by Keyword"] = "Filter Auctions by Keyword"
--[[Translation missing --]]
TSM.L["FILTER BY KEYWORD"] = "FILTER BY KEYWORD"
--[[Translation missing --]]
TSM.L["Filter by Keyword"] = "Filter by Keyword"
--[[Translation missing --]]
TSM.L["Filter group item lists based on the following price source"] = "Filter group item lists based on the following price source"
--[[Translation missing --]]
TSM.L["Filter Items"] = "Filter Items"
--[[Translation missing --]]
TSM.L["Filter Shopping"] = "Filter Shopping"
--[[Translation missing --]]
TSM.L["Finding Selected Auction"] = "Finding Selected Auction"
TSM.L["Fishing Reel In"] = "Molinete de Pesca em"
--[[Translation missing --]]
TSM.L["Forget Character"] = "Forget Character"
--[[Translation missing --]]
TSM.L["Found auction sound"] = "Found auction sound"
--[[Translation missing --]]
TSM.L["Friends"] = "Friends"
--[[Translation missing --]]
TSM.L["From"] = "From"
TSM.L["Full"] = "Cheio"
--[[Translation missing --]]
TSM.L["Garrison"] = "Garrison"
--[[Translation missing --]]
TSM.L["Gathering"] = "Gathering"
--[[Translation missing --]]
TSM.L["Gathering Search"] = "Gathering Search"
TSM.L["General Options"] = "Opções gerais"
--[[Translation missing --]]
TSM.L["Get from Bank"] = "Get from Bank"
--[[Translation missing --]]
TSM.L["Get from Guild Bank"] = "Get from Guild Bank"
--[[Translation missing --]]
TSM.L["Global Data Tooltips"] = "Global Data Tooltips"
--[[Translation missing --]]
TSM.L["Global Historical Price"] = "Global Historical Price"
--[[Translation missing --]]
TSM.L["Global Market Value Avg"] = "Global Market Value Avg"
--[[Translation missing --]]
TSM.L["Global Min Buyout Avg"] = "Global Min Buyout Avg"
--[[Translation missing --]]
TSM.L["Global Operation Confirmation"] = "Global Operation Confirmation"
--[[Translation missing --]]
TSM.L["Global Sale Avg"] = "Global Sale Avg"
--[[Translation missing --]]
TSM.L["Gold"] = "Gold"
--[[Translation missing --]]
TSM.L["Gold Earned:"] = "Gold Earned:"
--[[Translation missing --]]
TSM.L["GOLD ON HAND"] = "GOLD ON HAND"
--[[Translation missing --]]
TSM.L["Gold Spent:"] = "Gold Spent:"
--[[Translation missing --]]
TSM.L["GREAT DEALS SEARCH"] = "GREAT DEALS SEARCH"
--[[Translation missing --]]
TSM.L["Group already exists."] = "Group already exists."
TSM.L["Group Management"] = "Gerenciamento de Grupo"
--[[Translation missing --]]
TSM.L["Group Operations"] = "Group Operations"
--[[Translation missing --]]
TSM.L["Group Settings"] = "Group Settings"
--[[Translation missing --]]
TSM.L["Grouped Items"] = "Grouped Items"
TSM.L["Groups"] = "Grupos "
--[[Translation missing --]]
TSM.L["Guild"] = "Guild"
--[[Translation missing --]]
TSM.L["Guild Bank"] = "Guild Bank"
--[[Translation missing --]]
TSM.L["GUILDS"] = "GUILDS"
TSM.L["GVault"] = "Cofre da Guilda"
--[[Translation missing --]]
TSM.L["Have"] = "Have"
--[[Translation missing --]]
TSM.L["Have Materials"] = "Have Materials"
--[[Translation missing --]]
TSM.L["Have Skill Up"] = "Have Skill Up"
--[[Translation missing --]]
TSM.L["Help & Info"] = "Help & Info"
--[[Translation missing --]]
TSM.L["Hide auctions with bids"] = "Hide auctions with bids"
--[[Translation missing --]]
TSM.L["Hide Description"] = "Hide Description"
--[[Translation missing --]]
TSM.L["Hide minimap icon"] = "Hide minimap icon"
--[[Translation missing --]]
TSM.L["Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."] = "Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."
--[[Translation missing --]]
TSM.L["Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."] = "Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."
--[[Translation missing --]]
TSM.L["High Bidder"] = "High Bidder"
--[[Translation missing --]]
TSM.L["Historical Price"] = "Historical Price"
--[[Translation missing --]]
TSM.L["Hold ALT to repair from the guild bank."] = "Hold ALT to repair from the guild bank."
--[[Translation missing --]]
TSM.L["Hr"] = "Hr"
--[[Translation missing --]]
TSM.L["Hrs"] = "Hrs"
TSM.L["I just bought [%s]x%d for %s! %s #TSM4 #warcraft"] = "Acabei de comprar [%s]x%d por %s #TSM4 #warcraft"
TSM.L["I just sold [%s] for %s! %s #TSM4 #warcraft"] = "Acabei de vender [%s] por %s! %s #TSM4 #warcraft"
--[[Translation missing --]]
TSM.L["If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."] = "If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."
TSM.L["If you have multiple profile set up with operations, enabling this will cause all but the current profile's operations to be irreversibly lost. Are you sure you want to continue?"] = "Se você tiver múltiplos perfis configurados com as operações, habilitar isso fará com que todas as operações, exceto as do perfil atual, sejam irreversivelmente perdidas. Você tem certeza que quer continuar?"
--[[Translation missing --]]
TSM.L["If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."] = "If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."
--[[Translation missing --]]
TSM.L["Ignore Auctions Below Min"] = "Ignore Auctions Below Min"
--[[Translation missing --]]
TSM.L["Ignore auctions by duration?"] = "Ignore auctions by duration?"
--[[Translation missing --]]
TSM.L["Ignore Characters"] = "Ignore Characters"
--[[Translation missing --]]
TSM.L["Ignore duplicate operations?"] = "Ignore duplicate operations?"
TSM.L["Ignore Guilds"] = "Ignorar Guildas"
--[[Translation missing --]]
TSM.L["Ignore operation on characters:"] = "Ignore operation on characters:"
--[[Translation missing --]]
TSM.L["Ignore operation on faction-realms:"] = "Ignore operation on faction-realms:"
--[[Translation missing --]]
TSM.L["Ignore random enchants?"] = "Ignore random enchants?"
--[[Translation missing --]]
TSM.L["Ignored Cooldowns"] = "Ignored Cooldowns"
--[[Translation missing --]]
TSM.L["Ignored Items"] = "Ignored Items"
TSM.L["ilvl"] = "ilvl"
--[[Translation missing --]]
TSM.L["Import"] = "Import"
--[[Translation missing --]]
TSM.L["IMPORT"] = "IMPORT"
--[[Translation missing --]]
TSM.L["Import %d Items and %s Operations?"] = "Import %d Items and %s Operations?"
--[[Translation missing --]]
TSM.L["Import Groups & Operations"] = "Import Groups & Operations"
--[[Translation missing --]]
TSM.L["Imported Items"] = "Imported Items"
--[[Translation missing --]]
TSM.L["Imported Operations"] = "Imported Operations"
--[[Translation missing --]]
TSM.L["Inbox Settings"] = "Inbox Settings"
--[[Translation missing --]]
TSM.L["Include Attached Operations"] = "Include Attached Operations"
--[[Translation missing --]]
TSM.L["Include operations?"] = "Include operations?"
--[[Translation missing --]]
TSM.L["Include soulbound items"] = "Include soulbound items"
--[[Translation missing --]]
TSM.L["Information"] = "Information"
--[[Translation missing --]]
TSM.L["Invalid custom price entered."] = "Invalid custom price entered."
--[[Translation missing --]]
TSM.L["Invalid custom price source for %s. %s"] = "Invalid custom price source for %s. %s"
TSM.L["Invalid custom price."] = "Preço personalizado inválido."
TSM.L["Invalid function."] = "Função inválida."
--[[Translation missing --]]
TSM.L["Invalid group name."] = "Invalid group name."
TSM.L["Invalid item link."] = "Link inválido de item. "
--[[Translation missing --]]
TSM.L["Invalid operation name."] = "Invalid operation name."
TSM.L["Invalid operator at end of custom price."] = "Operador inválido no final do preço personalizado."
TSM.L["Invalid parameter to price source."] = "Parâmetro inválido para fonte de preço;"
--[[Translation missing --]]
TSM.L["Invalid player name."] = "Invalid player name."
TSM.L["Invalid price source in convert."] = "Fonte de preço inválido convertido."
--[[Translation missing --]]
TSM.L["Invalid price source."] = "Invalid price source."
--[[Translation missing --]]
TSM.L["Invalid seller data returned by server."] = "Invalid seller data returned by server."
TSM.L["Invalid word: '%s'"] = "Palavra inválida: '%s'"
--[[Translation missing --]]
TSM.L["Inventory"] = "Inventory"
--[[Translation missing --]]
TSM.L["Inventory / Mailing"] = "Inventory / Mailing"
--[[Translation missing --]]
TSM.L["Inventory Options"] = "Inventory Options"
--[[Translation missing --]]
TSM.L["Inventory Tooltip Format"] = "Inventory Tooltip Format"
TSM.L["It appears that you've manually copied your saved variables between accounts which will cause TSM's automatic sync'ing to not work. You'll need to undo this, and/or delete the TradeSkillMaster and TSM_Crafting saved variables files on both accounts (with WoW closed) in order to fix this."] = "Parece que você copiou manualmente suas variáveis salvas entre as contas, o que fará com que a sincronização automática do TSM não funcione. Você precisará desfazer isso e/ou excluir os arquivos de variáveis salvas \"TradeSkillMaster\" e \"TSM_Crafting\" em ambas as contas (com o WoW fechado) para corrigir isso."
TSM.L["Item"] = "Item"
--[[Translation missing --]]
TSM.L["ITEM CLASS"] = "ITEM CLASS"
--[[Translation missing --]]
TSM.L["Item Level"] = "Item Level"
--[[Translation missing --]]
TSM.L["ITEM LEVEL RANGE"] = "ITEM LEVEL RANGE"
TSM.L["Item links may only be used as parameters to price sources."] = "Os links de itens só podem ser usados como parâmetros para fontes de preço."
TSM.L["Item Name"] = "Nome do Item"
--[[Translation missing --]]
TSM.L["Item Quality"] = "Item Quality"
--[[Translation missing --]]
TSM.L["ITEM SEARCH"] = "ITEM SEARCH"
--[[Translation missing --]]
TSM.L["ITEM SUBCLASS"] = "ITEM SUBCLASS"
--[[Translation missing --]]
TSM.L["Item Value"] = "Item Value"
--[[Translation missing --]]
TSM.L["Item/Group is invalid (see chat)."] = "Item/Group is invalid (see chat)."
--[[Translation missing --]]
TSM.L["ITEMS"] = "ITEMS"
TSM.L["Items"] = "Itens"
--[[Translation missing --]]
TSM.L["Items in Bags"] = "Items in Bags"
--[[Translation missing --]]
TSM.L["Keep in bags quantity:"] = "Keep in bags quantity:"
--[[Translation missing --]]
TSM.L["Keep in bank quantity:"] = "Keep in bank quantity:"
--[[Translation missing --]]
TSM.L["Keep posted:"] = "Keep posted:"
--[[Translation missing --]]
TSM.L["Keep quantity:"] = "Keep quantity:"
--[[Translation missing --]]
TSM.L["Keep this amount in bags:"] = "Keep this amount in bags:"
--[[Translation missing --]]
TSM.L["Keep this amount:"] = "Keep this amount:"
--[[Translation missing --]]
TSM.L["Keeping %d."] = "Keeping %d."
--[[Translation missing --]]
TSM.L["Keeping undercut auctions posted."] = "Keeping undercut auctions posted."
--[[Translation missing --]]
TSM.L["Last 14 Days"] = "Last 14 Days"
--[[Translation missing --]]
TSM.L["Last 3 Days"] = "Last 3 Days"
--[[Translation missing --]]
TSM.L["Last 30 Days"] = "Last 30 Days"
--[[Translation missing --]]
TSM.L["LAST 30 DAYS"] = "LAST 30 DAYS"
--[[Translation missing --]]
TSM.L["Last 60 Days"] = "Last 60 Days"
--[[Translation missing --]]
TSM.L["Last 7 Days"] = "Last 7 Days"
--[[Translation missing --]]
TSM.L["LAST 7 DAYS"] = "LAST 7 DAYS"
--[[Translation missing --]]
TSM.L["Last Data Update:"] = "Last Data Update:"
--[[Translation missing --]]
TSM.L["Last Purchased"] = "Last Purchased"
--[[Translation missing --]]
TSM.L["Last Sold"] = "Last Sold"
TSM.L["Level Up"] = "Subir de Nível"
--[[Translation missing --]]
TSM.L["LIMIT"] = "LIMIT"
--[[Translation missing --]]
TSM.L["Link to Another Operation"] = "Link to Another Operation"
--[[Translation missing --]]
TSM.L["List"] = "List"
--[[Translation missing --]]
TSM.L["List materials in tooltip"] = "List materials in tooltip"
--[[Translation missing --]]
TSM.L["Loading Mails..."] = "Loading Mails..."
--[[Translation missing --]]
TSM.L["Loading..."] = "Loading..."
TSM.L["Looks like TradeSkillMaster has encountered an error. Please help the author fix this error by following the instructions shown."] = "Parece que o TradeSkillMaster encontrou um erro. Por favor ajude o autor a corrigir este erro seguindo as instruções exibidas."
TSM.L["Loop detected in the following custom price:"] = "Repetição detectada no seguinte preço personalizado:"
--[[Translation missing --]]
TSM.L["Lowest auction by whitelisted player."] = "Lowest auction by whitelisted player."
TSM.L["Macro created and scroll wheel bound!"] = "Macro criada e associada ao botão de rolagem!"
TSM.L["Macro Setup"] = "Configuração de Macro"
TSM.L["Mail"] = "Correio"
--[[Translation missing --]]
TSM.L["Mail Disenchantables"] = "Mail Disenchantables"
--[[Translation missing --]]
TSM.L["Mail Disenchantables Max Quality"] = "Mail Disenchantables Max Quality"
--[[Translation missing --]]
TSM.L["MAIL SELECTED GROUPS"] = "MAIL SELECTED GROUPS"
--[[Translation missing --]]
TSM.L["Mail to %s"] = "Mail to %s"
--[[Translation missing --]]
TSM.L["Mailing"] = "Mailing"
--[[Translation missing --]]
TSM.L["Mailing all to %s."] = "Mailing all to %s."
--[[Translation missing --]]
TSM.L["Mailing Options"] = "Mailing Options"
--[[Translation missing --]]
TSM.L["Mailing up to %d to %s."] = "Mailing up to %d to %s."
--[[Translation missing --]]
TSM.L["Main Settings"] = "Main Settings"
--[[Translation missing --]]
TSM.L["Make Cash On Delivery?"] = "Make Cash On Delivery?"
--[[Translation missing --]]
TSM.L["Management Options"] = "Management Options"
--[[Translation missing --]]
TSM.L["Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."] = "Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."
TSM.L["Map Ping"] = "Mapeamento"
--[[Translation missing --]]
TSM.L["Market Value"] = "Market Value"
--[[Translation missing --]]
TSM.L["Market Value Price Source"] = "Market Value Price Source"
--[[Translation missing --]]
TSM.L["Market Value Source"] = "Market Value Source"
--[[Translation missing --]]
TSM.L["Mat Cost"] = "Mat Cost"
--[[Translation missing --]]
TSM.L["Mat Price"] = "Mat Price"
--[[Translation missing --]]
TSM.L["Match stack size?"] = "Match stack size?"
--[[Translation missing --]]
TSM.L["Match whitelisted players"] = "Match whitelisted players"
--[[Translation missing --]]
TSM.L["Material Name"] = "Material Name"
--[[Translation missing --]]
TSM.L["Materials"] = "Materials"
--[[Translation missing --]]
TSM.L["Materials to Gather"] = "Materials to Gather"
--[[Translation missing --]]
TSM.L["Max Destroy Value"] = "Max Destroy Value"
--[[Translation missing --]]
TSM.L["MAX EXPIRES TO BANK"] = "MAX EXPIRES TO BANK"
--[[Translation missing --]]
TSM.L["Max Market Value"] = "Max Market Value"
--[[Translation missing --]]
TSM.L["Max Shopping Price"] = "Max Shopping Price"
--[[Translation missing --]]
TSM.L["Maximum amount already posted."] = "Maximum amount already posted."
--[[Translation missing --]]
TSM.L["Maximum Auction Price (Per Item)"] = "Maximum Auction Price (Per Item)"
--[[Translation missing --]]
TSM.L["Maximum Destroy Value (Enter '0c' to disable)"] = "Maximum Destroy Value (Enter '0c' to disable)"
--[[Translation missing --]]
TSM.L["Maximum disenchant level:"] = "Maximum disenchant level:"
--[[Translation missing --]]
TSM.L["Maximum Disenchant Quality"] = "Maximum Disenchant Quality"
--[[Translation missing --]]
TSM.L["Maximum disenchant search percentage:"] = "Maximum disenchant search percentage:"
--[[Translation missing --]]
TSM.L["Maximum Market Value (Enter '0c' to disable)"] = "Maximum Market Value (Enter '0c' to disable)"
--[[Translation missing --]]
TSM.L["MAXIMUM QUANTITY TO BUY:"] = "MAXIMUM QUANTITY TO BUY:"
--[[Translation missing --]]
TSM.L["Maximum quantity:"] = "Maximum quantity:"
--[[Translation missing --]]
TSM.L["Maximum restock quantity:"] = "Maximum restock quantity:"
--[[Translation missing --]]
TSM.L["Mill Value"] = "Mill Value"
--[[Translation missing --]]
TSM.L["Min"] = "Min"
--[[Translation missing --]]
TSM.L["Min Buyout"] = "Min Buyout"
--[[Translation missing --]]
TSM.L["Min/Normal/Max Prices"] = "Min/Normal/Max Prices"
--[[Translation missing --]]
TSM.L["Minimum Days Old"] = "Minimum Days Old"
--[[Translation missing --]]
TSM.L["Minimum disenchant level:"] = "Minimum disenchant level:"
--[[Translation missing --]]
TSM.L["Minimum expires:"] = "Minimum expires:"
--[[Translation missing --]]
TSM.L["Minimum profit:"] = "Minimum profit:"
--[[Translation missing --]]
TSM.L["MINIMUM RARITY"] = "MINIMUM RARITY"
--[[Translation missing --]]
TSM.L["Minimum restock quantity:"] = "Minimum restock quantity:"
TSM.L["Misplaced comma"] = "Vírgula mal colocada "
--[[Translation missing --]]
TSM.L["Missing Materials"] = "Missing Materials"
--[[Translation missing --]]
TSM.L["MM/DD/YY HH:MM"] = "MM/DD/YY HH:MM"
TSM.L["Modifiers:"] = "Modificadores:"
TSM.L["Money Frame Open"] = "Abre Quadro de Dinheiro"
--[[Translation missing --]]
TSM.L["Money Transfer"] = "Money Transfer"
--[[Translation missing --]]
TSM.L["Most Profitable Item:"] = "Most Profitable Item:"
--[[Translation missing --]]
TSM.L["MOVE"] = "MOVE"
--[[Translation missing --]]
TSM.L["Move already grouped items?"] = "Move already grouped items?"
--[[Translation missing --]]
TSM.L["Move Quantity Settings"] = "Move Quantity Settings"
--[[Translation missing --]]
TSM.L["MOVE TO BAGS"] = "MOVE TO BAGS"
--[[Translation missing --]]
TSM.L["MOVE TO BANK"] = "MOVE TO BANK"
--[[Translation missing --]]
TSM.L["MOVING"] = "MOVING"
--[[Translation missing --]]
TSM.L["Moving"] = "Moving"
--[[Translation missing --]]
TSM.L["Multiple Items"] = "Multiple Items"
--[[Translation missing --]]
TSM.L["My Auctions"] = "My Auctions"
--[[Translation missing --]]
TSM.L["My Auctions 'CANCEL' Button"] = "My Auctions 'CANCEL' Button"
--[[Translation missing --]]
TSM.L["Neat Stacks only?"] = "Neat Stacks only?"
--[[Translation missing --]]
TSM.L["NEED MATS"] = "NEED MATS"
TSM.L["New Group"] = "Novo grupo"
TSM.L["New Operation"] = "Nova Operação"
--[[Translation missing --]]
TSM.L["NEWS AND INFORMATION"] = "NEWS AND INFORMATION"
--[[Translation missing --]]
TSM.L["No Attachments"] = "No Attachments"
--[[Translation missing --]]
TSM.L["No Data"] = "No Data"
--[[Translation missing --]]
TSM.L["No group selected"] = "No group selected"
--[[Translation missing --]]
TSM.L["No item specified. Usage: /tsm restock_help [ITEM_LINK]"] = "No item specified. Usage: /tsm restock_help [ITEM_LINK]"
--[[Translation missing --]]
TSM.L["NO ITEMS"] = "NO ITEMS"
--[[Translation missing --]]
TSM.L["No Materials to Gather"] = "No Materials to Gather"
--[[Translation missing --]]
TSM.L["No Operation Selected"] = "No Operation Selected"
--[[Translation missing --]]
TSM.L["No posting."] = "No posting."
--[[Translation missing --]]
TSM.L["No Profession Opened"] = "No Profession Opened"
--[[Translation missing --]]
TSM.L["No Profession Selected"] = "No Profession Selected"
TSM.L["No profile specified. Possible profiles: '%s'"] = "Nenhum perfil especificado. Possíveis perfis: '%s'"
--[[Translation missing --]]
TSM.L["No recent AuctionDB scan data found."] = "No recent AuctionDB scan data found."
TSM.L["No Sound"] = "Sem Som"
TSM.L["None"] = "Nenhum"
TSM.L["None (Always Show)"] = "Nenhum (Exibir Sempre)"
--[[Translation missing --]]
TSM.L["None Selected"] = "None Selected"
--[[Translation missing --]]
TSM.L["NONGROUP TO BANK"] = "NONGROUP TO BANK"
--[[Translation missing --]]
TSM.L["Normal"] = "Normal"
--[[Translation missing --]]
TSM.L["Not canceling auction at reset price."] = "Not canceling auction at reset price."
--[[Translation missing --]]
TSM.L["Not canceling auction below min price."] = "Not canceling auction below min price."
--[[Translation missing --]]
TSM.L["Not canceling."] = "Not canceling."
--[[Translation missing --]]
TSM.L["Not enough items in bags."] = "Not enough items in bags."
--[[Translation missing --]]
TSM.L["NOT OPEN"] = "NOT OPEN"
--[[Translation missing --]]
TSM.L["Not Scanned"] = "Not Scanned"
--[[Translation missing --]]
TSM.L["NPC"] = "NPC"
--[[Translation missing --]]
TSM.L["Number Owned"] = "Number Owned"
--[[Translation missing --]]
TSM.L["of"] = "of"
TSM.L["Offline"] = "Desconectado"
--[[Translation missing --]]
TSM.L["Old TSM addons detected. TSM has disabled them and requires a reload."] = "Old TSM addons detected. TSM has disabled them and requires a reload."
--[[Translation missing --]]
TSM.L["On Cooldown"] = "On Cooldown"
TSM.L["Only show craftable"] = "Exibir apenas criáveis"
--[[Translation missing --]]
TSM.L["Only show items with disenchant value above custom price"] = "Only show items with disenchant value above custom price"
--[[Translation missing --]]
TSM.L["OPEN"] = "OPEN"
--[[Translation missing --]]
TSM.L["Open all bags when auctioning"] = "Open all bags when auctioning"
--[[Translation missing --]]
TSM.L["OPEN ALL MAIL"] = "OPEN ALL MAIL"
--[[Translation missing --]]
TSM.L["Open Mail"] = "Open Mail"
--[[Translation missing --]]
TSM.L["Open Mail Complete Sound"] = "Open Mail Complete Sound"
--[[Translation missing --]]
TSM.L["Open Task List"] = "Open Task List"
--[[Translation missing --]]
TSM.L["Operation"] = "Operation"
TSM.L["Operations"] = "Operações"
--[[Translation missing --]]
TSM.L["Other Character"] = "Other Character"
--[[Translation missing --]]
TSM.L["Other Settings"] = "Other Settings"
--[[Translation missing --]]
TSM.L["Other Shopping Searches"] = "Other Shopping Searches"
TSM.L["Override default craft value method?"] = "Substituir o método de valor de criação padrão?"
--[[Translation missing --]]
TSM.L["Override parent operations"] = "Override parent operations"
--[[Translation missing --]]
TSM.L["Parent Items"] = "Parent Items"
--[[Translation missing --]]
TSM.L["Past 7 Days"] = "Past 7 Days"
--[[Translation missing --]]
TSM.L["Past Day"] = "Past Day"
--[[Translation missing --]]
TSM.L["Past Month"] = "Past Month"
--[[Translation missing --]]
TSM.L["Past Year"] = "Past Year"
--[[Translation missing --]]
TSM.L["Paste string here"] = "Paste string here"
--[[Translation missing --]]
TSM.L["Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."] = "Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."
--[[Translation missing --]]
TSM.L["Per Item"] = "Per Item"
--[[Translation missing --]]
TSM.L["Per Stack"] = "Per Stack"
--[[Translation missing --]]
TSM.L["Per Unit"] = "Per Unit"
TSM.L["Player Gold"] = "Ouro do Jogador"
TSM.L["Player Invite Accept"] = "Convite de Jogador Aceito"
--[[Translation missing --]]
TSM.L["Please select a group to export"] = "Please select a group to export"
--[[Translation missing --]]
TSM.L["POST"] = "POST"
--[[Translation missing --]]
TSM.L["Post at Maximum Price"] = "Post at Maximum Price"
--[[Translation missing --]]
TSM.L["Post at Minimum Price"] = "Post at Minimum Price"
--[[Translation missing --]]
TSM.L["Post at Normal Price"] = "Post at Normal Price"
--[[Translation missing --]]
TSM.L["POST CAP TO BAGS"] = "POST CAP TO BAGS"
--[[Translation missing --]]
TSM.L["Post Scan"] = "Post Scan"
--[[Translation missing --]]
TSM.L["POST SELECTED"] = "POST SELECTED"
--[[Translation missing --]]
TSM.L["POSTAGE"] = "POSTAGE"
--[[Translation missing --]]
TSM.L["Postage"] = "Postage"
--[[Translation missing --]]
TSM.L["Posted at whitelisted player's price."] = "Posted at whitelisted player's price."
--[[Translation missing --]]
TSM.L["Posted Auctions %s:"] = "Posted Auctions %s:"
--[[Translation missing --]]
TSM.L["Posting"] = "Posting"
--[[Translation missing --]]
TSM.L["Posting %d / %d"] = "Posting %d / %d"
--[[Translation missing --]]
TSM.L["Posting %d stack(s) of %d for %d hours."] = "Posting %d stack(s) of %d for %d hours."
--[[Translation missing --]]
TSM.L["Posting at normal price."] = "Posting at normal price."
--[[Translation missing --]]
TSM.L["Posting at whitelisted player's price."] = "Posting at whitelisted player's price."
--[[Translation missing --]]
TSM.L["Posting at your current price."] = "Posting at your current price."
--[[Translation missing --]]
TSM.L["Posting disabled."] = "Posting disabled."
--[[Translation missing --]]
TSM.L["Posting Settings"] = "Posting Settings"
--[[Translation missing --]]
TSM.L["Potential"] = "Potential"
--[[Translation missing --]]
TSM.L["Price Settings"] = "Price Settings"
--[[Translation missing --]]
TSM.L["PRICE SOURCE"] = "PRICE SOURCE"
--[[Translation missing --]]
TSM.L["Price source with name '%s' already exists."] = "Price source with name '%s' already exists."
--[[Translation missing --]]
TSM.L["Price Variables"] = "Price Variables"
--[[Translation missing --]]
TSM.L["Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."] = "Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."
--[[Translation missing --]]
TSM.L["PROFESSION"] = "PROFESSION"
--[[Translation missing --]]
TSM.L["Profession Filters"] = "Profession Filters"
--[[Translation missing --]]
TSM.L["Profession loading..."] = "Profession loading..."
--[[Translation missing --]]
TSM.L["Professions Used In"] = "Professions Used In"
TSM.L["Profile changed to '%s'."] = "Perfil alterado para '%s'."
TSM.L["Profiles"] = "Perfis"
--[[Translation missing --]]
TSM.L["Profit"] = "Profit"
--[[Translation missing --]]
TSM.L["PROFIT"] = "PROFIT"
--[[Translation missing --]]
TSM.L["Profit Deduction"] = "Profit Deduction"
TSM.L["Profit, Craftable Quantity"] = "Lucro, Quantidade Criável"
--[[Translation missing --]]
TSM.L["Prospect Value"] = "Prospect Value"
--[[Translation missing --]]
TSM.L["PURCHASE DATA"] = "PURCHASE DATA"
--[[Translation missing --]]
TSM.L["Purchased (Min/Avg/Max Price)"] = "Purchased (Min/Avg/Max Price)"
--[[Translation missing --]]
TSM.L["Purchased (Total Price)"] = "Purchased (Total Price)"
--[[Translation missing --]]
TSM.L["Purchases"] = "Purchases"
--[[Translation missing --]]
TSM.L["Qty"] = "Qty"
--[[Translation missing --]]
TSM.L["Quantity Bought:"] = "Quantity Bought:"
--[[Translation missing --]]
TSM.L["Quantity Sold:"] = "Quantity Sold:"
--[[Translation missing --]]
TSM.L["Quantity to move:"] = "Quantity to move:"
TSM.L["Quest Added"] = "Missão Adicionada"
TSM.L["Quest Completed"] = "Missão Concluída."
TSM.L["Quest Objectives Complete"] = "Objetivos da missão completos"
--[[Translation missing --]]
TSM.L["QUEUE"] = "QUEUE"
--[[Translation missing --]]
TSM.L["Queue Sorting Method"] = "Queue Sorting Method"
--[[Translation missing --]]
TSM.L["Quick Sell"] = "Quick Sell"
--[[Translation missing --]]
TSM.L["Quick Sell Options"] = "Quick Sell Options"
--[[Translation missing --]]
TSM.L["Quickly mail all excess disenchantable items to a character"] = "Quickly mail all excess disenchantable items to a character"
--[[Translation missing --]]
TSM.L["Quickly mail all excess gold (limited to a certain amount) to a character"] = "Quickly mail all excess gold (limited to a certain amount) to a character"
TSM.L["Raid Warning"] = "Aviso de Raide"
--[[Translation missing --]]
TSM.L["Read More"] = "Read More"
TSM.L["Ready Check"] = "Checagem Pronta"
--[[Translation missing --]]
TSM.L["Ready to Cancel"] = "Ready to Cancel"
--[[Translation missing --]]
TSM.L["Reagent Bank"] = "Reagent Bank"
--[[Translation missing --]]
TSM.L["Realm Data Tooltips"] = "Realm Data Tooltips"
--[[Translation missing --]]
TSM.L["Recent Scans"] = "Recent Scans"
--[[Translation missing --]]
TSM.L["Recent Searches"] = "Recent Searches"
--[[Translation missing --]]
TSM.L["Recently Mailed"] = "Recently Mailed"
--[[Translation missing --]]
TSM.L["RECIPIENT"] = "RECIPIENT"
--[[Translation missing --]]
TSM.L["Region Avg Daily Sold"] = "Region Avg Daily Sold"
--[[Translation missing --]]
TSM.L["Region Data Tooltips"] = "Region Data Tooltips"
--[[Translation missing --]]
TSM.L["Region Historical Price"] = "Region Historical Price"
--[[Translation missing --]]
TSM.L["Region Market Value Avg"] = "Region Market Value Avg"
--[[Translation missing --]]
TSM.L["Region Min Buyout Avg"] = "Region Min Buyout Avg"
--[[Translation missing --]]
TSM.L["Region Sale Avg"] = "Region Sale Avg"
--[[Translation missing --]]
TSM.L["Region Sale Rate"] = "Region Sale Rate"
--[[Translation missing --]]
TSM.L["Reload"] = "Reload"
--[[Translation missing --]]
TSM.L["REMOVE %d ITEMS"] = "REMOVE %d ITEMS"
--[[Translation missing --]]
TSM.L["Removed a total of %s old records."] = "Removed a total of %s old records."
--[[Translation missing --]]
TSM.L["REPAIR"] = "REPAIR"
--[[Translation missing --]]
TSM.L["Repair Bill"] = "Repair Bill"
TSM.L["Replace"] = "Substituir"
--[[Translation missing --]]
TSM.L["REPLY"] = "REPLY"
--[[Translation missing --]]
TSM.L["REPORT SPAM"] = "REPORT SPAM"
--[[Translation missing --]]
TSM.L["Repost Higher Threshold"] = "Repost Higher Threshold"
--[[Translation missing --]]
TSM.L["Required Level"] = "Required Level"
--[[Translation missing --]]
TSM.L["REQUIRED LEVEL RANGE"] = "REQUIRED LEVEL RANGE"
--[[Translation missing --]]
TSM.L["Requires TSM Desktop Application"] = "Requires TSM Desktop Application"
--[[Translation missing --]]
TSM.L["Resale"] = "Resale"
--[[Translation missing --]]
TSM.L["RESCAN"] = "RESCAN"
--[[Translation missing --]]
TSM.L["RESET"] = "RESET"
--[[Translation missing --]]
TSM.L["Reset All"] = "Reset All"
--[[Translation missing --]]
TSM.L["Reset Filters"] = "Reset Filters"
--[[Translation missing --]]
TSM.L["Reset Profile Confirmation"] = "Reset Profile Confirmation"
--[[Translation missing --]]
TSM.L["RESTART"] = "RESTART"
--[[Translation missing --]]
TSM.L["Restart Delay (minutes)"] = "Restart Delay (minutes)"
--[[Translation missing --]]
TSM.L["RESTOCK BAGS"] = "RESTOCK BAGS"
--[[Translation missing --]]
TSM.L["Restock help for %s:"] = "Restock help for %s:"
--[[Translation missing --]]
TSM.L["Restock Quantity Settings"] = "Restock Quantity Settings"
--[[Translation missing --]]
TSM.L["Restock quantity:"] = "Restock quantity:"
--[[Translation missing --]]
TSM.L["RESTOCK SELECTED GROUPS"] = "RESTOCK SELECTED GROUPS"
--[[Translation missing --]]
TSM.L["Restock Settings"] = "Restock Settings"
--[[Translation missing --]]
TSM.L["Restock target to max quantity?"] = "Restock target to max quantity?"
--[[Translation missing --]]
TSM.L["Restocking to %d."] = "Restocking to %d."
--[[Translation missing --]]
TSM.L["Restocking to a max of %d (min of %d) with a min profit."] = "Restocking to a max of %d (min of %d) with a min profit."
--[[Translation missing --]]
TSM.L["Restocking to a max of %d (min of %d) with no min profit."] = "Restocking to a max of %d (min of %d) with no min profit."
--[[Translation missing --]]
TSM.L["RESTORE BAGS"] = "RESTORE BAGS"
--[[Translation missing --]]
TSM.L["Resume Scan"] = "Resume Scan"
--[[Translation missing --]]
TSM.L["Retrying %d auction(s) which failed."] = "Retrying %d auction(s) which failed."
--[[Translation missing --]]
TSM.L["Revenue"] = "Revenue"
--[[Translation missing --]]
TSM.L["Round normal price"] = "Round normal price"
--[[Translation missing --]]
TSM.L["RUN ADVANCED ITEM SEARCH"] = "RUN ADVANCED ITEM SEARCH"
--[[Translation missing --]]
TSM.L["Run Bid Sniper"] = "Run Bid Sniper"
--[[Translation missing --]]
TSM.L["Run Buyout Sniper"] = "Run Buyout Sniper"
--[[Translation missing --]]
TSM.L["RUN CANCEL SCAN"] = "RUN CANCEL SCAN"
--[[Translation missing --]]
TSM.L["RUN POST SCAN"] = "RUN POST SCAN"
--[[Translation missing --]]
TSM.L["RUN SHOPPING SCAN"] = "RUN SHOPPING SCAN"
--[[Translation missing --]]
TSM.L["Running Sniper Scan"] = "Running Sniper Scan"
--[[Translation missing --]]
TSM.L["Sale"] = "Sale"
--[[Translation missing --]]
TSM.L["SALE DATA"] = "SALE DATA"
--[[Translation missing --]]
TSM.L["Sale Rate"] = "Sale Rate"
--[[Translation missing --]]
TSM.L["Sales"] = "Sales"
--[[Translation missing --]]
TSM.L["SALES"] = "SALES"
--[[Translation missing --]]
TSM.L["Sales Summary"] = "Sales Summary"
--[[Translation missing --]]
TSM.L["SCAN ALL"] = "SCAN ALL"
--[[Translation missing --]]
TSM.L["Scan Complete Sound"] = "Scan Complete Sound"
--[[Translation missing --]]
TSM.L["Scan Paused"] = "Scan Paused"
--[[Translation missing --]]
TSM.L["SCANNING"] = "SCANNING"
--[[Translation missing --]]
TSM.L["Scanning %d / %d (Page %d / %d)"] = "Scanning %d / %d (Page %d / %d)"
--[[Translation missing --]]
TSM.L["Scroll wheel direction:"] = "Scroll wheel direction:"
--[[Translation missing --]]
TSM.L["Search"] = "Search"
--[[Translation missing --]]
TSM.L["Search Bags"] = "Search Bags"
--[[Translation missing --]]
TSM.L["Search for Item"] = "Search for Item"
--[[Translation missing --]]
TSM.L["Search Groups"] = "Search Groups"
--[[Translation missing --]]
TSM.L["Search Inbox"] = "Search Inbox"
--[[Translation missing --]]
TSM.L["Search Operations"] = "Search Operations"
--[[Translation missing --]]
TSM.L["Search Patterns"] = "Search Patterns"
--[[Translation missing --]]
TSM.L["Search Usable Items Only?"] = "Search Usable Items Only?"
--[[Translation missing --]]
TSM.L["Search Vendor"] = "Search Vendor"
--[[Translation missing --]]
TSM.L["Select a Source"] = "Select a Source"
--[[Translation missing --]]
TSM.L["Select Action"] = "Select Action"
TSM.L["Select All Groups"] = "Selecionar todos os grupos"
--[[Translation missing --]]
TSM.L["Select All Items"] = "Select All Items"
--[[Translation missing --]]
TSM.L["Select Auction to Cancel"] = "Select Auction to Cancel"
TSM.L["Select crafter"] = "Selecione o personagem"
--[[Translation missing --]]
TSM.L["Select custom price sources to include in item tooltips"] = "Select custom price sources to include in item tooltips"
--[[Translation missing --]]
TSM.L["Select Duration"] = "Select Duration"
--[[Translation missing --]]
TSM.L["Select Items to Add"] = "Select Items to Add"
--[[Translation missing --]]
TSM.L["Select Items to Remove"] = "Select Items to Remove"
--[[Translation missing --]]
TSM.L["Select Operation"] = "Select Operation"
--[[Translation missing --]]
TSM.L["Select professions"] = "Select professions"
--[[Translation missing --]]
TSM.L["Select which accounting information to display in item tooltips."] = "Select which accounting information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which auctioning information to display in item tooltips."] = "Select which auctioning information to display in item tooltips."
TSM.L["Select which crafting information to display in item tooltips."] = "Escolha quais informações de criação serão exibidas na tooltip do item."
--[[Translation missing --]]
TSM.L["Select which destroying information to display in item tooltips."] = "Select which destroying information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which shopping information to display in item tooltips."] = "Select which shopping information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Selected Groups"] = "Selected Groups"
--[[Translation missing --]]
TSM.L["SELECTED ITEM"] = "SELECTED ITEM"
--[[Translation missing --]]
TSM.L["Selected Operations"] = "Selected Operations"
--[[Translation missing --]]
TSM.L["Sell"] = "Sell"
--[[Translation missing --]]
TSM.L["SELL ALL"] = "SELL ALL"
--[[Translation missing --]]
TSM.L["SELL BOES"] = "SELL BOES"
--[[Translation missing --]]
TSM.L["SELL GROUPS"] = "SELL GROUPS"
--[[Translation missing --]]
TSM.L["Sell Options"] = "Sell Options"
--[[Translation missing --]]
TSM.L["Sell soulbound items?"] = "Sell soulbound items?"
TSM.L["Sell to Vendor"] = "Vender para um npc."
--[[Translation missing --]]
TSM.L["SELL TRASH"] = "SELL TRASH"
--[[Translation missing --]]
TSM.L["Seller"] = "Seller"
--[[Translation missing --]]
TSM.L["Selling soulbound items."] = "Selling soulbound items."
--[[Translation missing --]]
TSM.L["Send"] = "Send"
--[[Translation missing --]]
TSM.L["SEND DISENCHANTABLES"] = "SEND DISENCHANTABLES"
--[[Translation missing --]]
TSM.L["Send Excess Gold to Banker"] = "Send Excess Gold to Banker"
--[[Translation missing --]]
TSM.L["SEND GOLD"] = "SEND GOLD"
--[[Translation missing --]]
TSM.L["Send grouped items individually"] = "Send grouped items individually"
--[[Translation missing --]]
TSM.L["SEND MAIL"] = "SEND MAIL"
--[[Translation missing --]]
TSM.L["Send Money"] = "Send Money"
--[[Translation missing --]]
TSM.L["SENDING"] = "SENDING"
--[[Translation missing --]]
TSM.L["Sending %s individually to %s"] = "Sending %s individually to %s"
--[[Translation missing --]]
TSM.L["Sending %s to %s"] = "Sending %s to %s"
--[[Translation missing --]]
TSM.L["Sending %s to %s with a COD of %s"] = "Sending %s to %s with a COD of %s"
--[[Translation missing --]]
TSM.L["Sending Settings"] = "Sending Settings"
--[[Translation missing --]]
TSM.L["SENDING..."] = "SENDING..."
--[[Translation missing --]]
TSM.L["Set auction duration to:"] = "Set auction duration to:"
--[[Translation missing --]]
TSM.L["Set bid as percentage of buyout:"] = "Set bid as percentage of buyout:"
--[[Translation missing --]]
TSM.L["Set keep in bags quantity?"] = "Set keep in bags quantity?"
--[[Translation missing --]]
TSM.L["Set keep in bank quantity?"] = "Set keep in bank quantity?"
--[[Translation missing --]]
TSM.L["Set Maximum Price:"] = "Set Maximum Price:"
--[[Translation missing --]]
TSM.L["Set maximum quantity?"] = "Set maximum quantity?"
--[[Translation missing --]]
TSM.L["Set Minimum Price:"] = "Set Minimum Price:"
--[[Translation missing --]]
TSM.L["Set minimum profit?"] = "Set minimum profit?"
--[[Translation missing --]]
TSM.L["Set move quantity?"] = "Set move quantity?"
--[[Translation missing --]]
TSM.L["Set Normal Price:"] = "Set Normal Price:"
--[[Translation missing --]]
TSM.L["Set post cap to:"] = "Set post cap to:"
--[[Translation missing --]]
TSM.L["Set posted stack size to:"] = "Set posted stack size to:"
--[[Translation missing --]]
TSM.L["Set stack size for bags?"] = "Set stack size for bags?"
--[[Translation missing --]]
TSM.L["Setup"] = "Setup"
--[[Translation missing --]]
TSM.L["SETUP ACCOUNT SYNC"] = "SETUP ACCOUNT SYNC"
TSM.L["Shards"] = "Estilhaço"
--[[Translation missing --]]
TSM.L["Shopping"] = "Shopping"
--[[Translation missing --]]
TSM.L["Shopping 'BUYOUT' Button"] = "Shopping 'BUYOUT' Button"
--[[Translation missing --]]
TSM.L["Shopping for auctions including those above the max price."] = "Shopping for auctions including those above the max price."
--[[Translation missing --]]
TSM.L["Shopping for auctions with a max price set."] = "Shopping for auctions with a max price set."
--[[Translation missing --]]
TSM.L["Shopping for even stacks including those above the max price"] = "Shopping for even stacks including those above the max price"
--[[Translation missing --]]
TSM.L["Shopping for even stacks with a max price set."] = "Shopping for even stacks with a max price set."
--[[Translation missing --]]
TSM.L["Shopping Tooltips"] = "Shopping Tooltips"
--[[Translation missing --]]
TSM.L["SHORTFALL TO BAGS"] = "SHORTFALL TO BAGS"
--[[Translation missing --]]
TSM.L["Show auctions above max price?"] = "Show auctions above max price?"
--[[Translation missing --]]
TSM.L["Show Description"] = "Show Description"
--[[Translation missing --]]
TSM.L["Show Destroying frame automatically"] = "Show Destroying frame automatically"
--[[Translation missing --]]
TSM.L["Show material cost"] = "Show material cost"
--[[Translation missing --]]
TSM.L["Show on Modifier"] = "Show on Modifier"
--[[Translation missing --]]
TSM.L["Showing %d Mail"] = "Showing %d Mail"
--[[Translation missing --]]
TSM.L["Showing %d of %d Mail"] = "Showing %d of %d Mail"
--[[Translation missing --]]
TSM.L["Showing %d of %d Mails"] = "Showing %d of %d Mails"
--[[Translation missing --]]
TSM.L["Showing all %d Mails"] = "Showing all %d Mails"
TSM.L["Simple"] = "Simples"
--[[Translation missing --]]
TSM.L["SKIP"] = "SKIP"
--[[Translation missing --]]
TSM.L["Skip Import / Export confirmations?"] = "Skip Import / Export confirmations?"
--[[Translation missing --]]
TSM.L["Skipped: No assigned operation"] = "Skipped: No assigned operation"
TSM.L["Slash Commands:"] = "Comandos de linha:"
--[[Translation missing --]]
TSM.L["Sniper 'BUYOUT' Button"] = "Sniper 'BUYOUT' Button"
--[[Translation missing --]]
TSM.L["Sniper Options"] = "Sniper Options"
--[[Translation missing --]]
TSM.L["Sniper Settings"] = "Sniper Settings"
--[[Translation missing --]]
TSM.L["Sniping items below a max price"] = "Sniping items below a max price"
--[[Translation missing --]]
TSM.L["Sold"] = "Sold"
--[[Translation missing --]]
TSM.L["Sold %s worth of items."] = "Sold %s worth of items."
--[[Translation missing --]]
TSM.L["Sold (Min/Avg/Max Price)"] = "Sold (Min/Avg/Max Price)"
--[[Translation missing --]]
TSM.L["Sold (Total Price)"] = "Sold (Total Price)"
--[[Translation missing --]]
TSM.L["Sold [%s]x%d for %s to %s"] = "Sold [%s]x%d for %s to %s"
--[[Translation missing --]]
TSM.L["Sold Auctions %s:"] = "Sold Auctions %s:"
--[[Translation missing --]]
TSM.L["Source"] = "Source"
--[[Translation missing --]]
TSM.L["SOURCE %d"] = "SOURCE %d"
--[[Translation missing --]]
TSM.L["SOURCES"] = "SOURCES"
TSM.L["Sources"] = "Fontes"
--[[Translation missing --]]
TSM.L["Sources to include for restock:"] = "Sources to include for restock:"
--[[Translation missing --]]
TSM.L["Stack"] = "Stack"
--[[Translation missing --]]
TSM.L["Stack / Quantity"] = "Stack / Quantity"
--[[Translation missing --]]
TSM.L["Stack size multiple:"] = "Stack size multiple:"
--[[Translation missing --]]
TSM.L["Start either a 'Buyout' or 'Bid' sniper using the buttons above."] = "Start either a 'Buyout' or 'Bid' sniper using the buttons above."
--[[Translation missing --]]
TSM.L["Starting Scan..."] = "Starting Scan..."
--[[Translation missing --]]
TSM.L["STOP"] = "STOP"
--[[Translation missing --]]
TSM.L["Store operations globally"] = "Store operations globally"
--[[Translation missing --]]
TSM.L["Subject"] = "Subject"
--[[Translation missing --]]
TSM.L["SUBJECT"] = "SUBJECT"
--[[Translation missing --]]
TSM.L["Switch to %s"] = "Switch to %s"
--[[Translation missing --]]
TSM.L["Switch to WoW UI"] = "Switch to WoW UI"
TSM.L["Sync Setup Error: The specified player on the other account is not currently online."] = "Erro de Configuração de Sincronização: o jogador especificado na outra conta não está atualmente online."
TSM.L["Sync Setup Error: This character is already part of a known account."] = "Erro de Configuração de Sincronização: Este personagem já é parte de uma conta conhecida."
TSM.L["Sync Setup Error: You entered the name of the current character and not the character on the other account."] = "Erro de configuração de sincronização: você inseriu o nome do personagem atual e não o personagem da outra conta."
--[[Translation missing --]]
TSM.L["TAKE ALL"] = "TAKE ALL"
--[[Translation missing --]]
TSM.L["Take Attachments"] = "Take Attachments"
--[[Translation missing --]]
TSM.L["Target Character"] = "Target Character"
--[[Translation missing --]]
TSM.L["TARGET SHORTFALL TO BAGS"] = "TARGET SHORTFALL TO BAGS"
--[[Translation missing --]]
TSM.L["Tasks Added to Task List"] = "Tasks Added to Task List"
TSM.L["Text (%s)"] = "Texto (%s)"
--[[Translation missing --]]
TSM.L["The canlearn filter was ignored because the CanIMogIt addon was not found."] = "The canlearn filter was ignored because the CanIMogIt addon was not found."
TSM.L["The 'Craft Value Method' (%s) did not return a value for this item."] = "O 'Método de Valor de Criação' (%s)  não retornou um valor para este item."
TSM.L["The 'disenchant' price source has been replaced by the more general 'destroy' price source. Please update your custom prices."] = "A fonte de preços \"desencanto\" foi substituída pela fonte de preço \"destruir\" mais geral. Atualize seus preços personalizados."
--[[Translation missing --]]
TSM.L["The min profit (%s) did not evalulate to a valid value for this item."] = "The min profit (%s) did not evalulate to a valid value for this item."
TSM.L["The name can ONLY contain letters. No spaces, numbers, or special characters."] = "O nome só pode conter letras. Sem espaços, números ou caracteres especiais."
--[[Translation missing --]]
TSM.L["The number which would be queued (%d) is less than the min restock quantity (%d)."] = "The number which would be queued (%d) is less than the min restock quantity (%d)."
--[[Translation missing --]]
TSM.L["The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."] = "The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."
--[[Translation missing --]]
TSM.L["The player \"%s\" is already on your whitelist."] = "The player \"%s\" is already on your whitelist."
--[[Translation missing --]]
TSM.L["The profit of this item (%s) is below the min profit (%s)."] = "The profit of this item (%s) is below the min profit (%s)."
--[[Translation missing --]]
TSM.L["The seller name of the lowest auction for %s was not given by the server. Skipping this item."] = "The seller name of the lowest auction for %s was not given by the server. Skipping this item."
--[[Translation missing --]]
TSM.L["The TradeSkillMaster_AppHelper addon is not enabled and is required for proper operation of TSM. TSM has enabled it and requires a reload."] = "The TradeSkillMaster_AppHelper addon is not enabled and is required for proper operation of TSM. TSM has enabled it and requires a reload."
--[[Translation missing --]]
TSM.L["The TradeSkillMaster_AppHelper addon is not installed and is required for proper operation of TSM."] = "The TradeSkillMaster_AppHelper addon is not installed and is required for proper operation of TSM."
--[[Translation missing --]]
TSM.L["The unlearned filter was ignored because the CanIMogIt addon was not found."] = "The unlearned filter was ignored because the CanIMogIt addon was not found."
TSM.L["There is a crafting cost and crafted item value, but TSM_Crafting wasn't able to calculate a profit. This shouldn't happen!"] = "Existe um valor de criação e um valor de item criado, mas o TSM_Crafting não foi capaz de calcular o lucro. Isso não deveria acontecer!"
TSM.L["There is no TSM_Crafting operation applied to this item's TSM group (%s)."] = "Não existe uma operação de TSM_Crafting aplicada para o grupo deste item (%s)."
TSM.L["This group already has operations. Would you like to add another one or replace the last one?"] = "Este grupo já tem operações. Gostaria de acrescentar mais um ou substituir o último?"
TSM.L["This group already has the max number of operation. Would you like to replace the last one?"] = "Este grupo já tem o número máximo de operações . Gostaria de substituir o último?"
TSM.L["This is not a valid profile name. Profile names must be at least one character long and may not contain '@' characters."] = "Este não é um nome de perfil válido. Os nomes de perfil devem ter pelo menos um caractere e não podem conter caracteres '@'."
TSM.L["This item does not have a crafting cost. Check that all of its mats have mat prices."] = "Este item não possui um custo de criação. Certifique-se de que todos os materiais possuam valor de material."
--[[Translation missing --]]
TSM.L["This item is not in a TSM group."] = "This item is not in a TSM group."
TSM.L["This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general TSM_Crafting options."] = "Este item será adicionado à fila quando você reestocar este grupo. Se isso não está acontecendo, crie uma postagem nos Forums do TSM com uma captura de tela da tooltip do item, configurações de operação e suas opções gerais de TSM_Crafting."
TSM.L["This looks like an exported operation and not a custom price."] = "Isso parece uma operação exportada e não um preço personalizado."
--[[Translation missing --]]
TSM.L["This will copy the settings from '%s' into your currently-active one."] = "This will copy the settings from '%s' into your currently-active one."
--[[Translation missing --]]
TSM.L["This will permanently delete the '%s' profile."] = "This will permanently delete the '%s' profile."
--[[Translation missing --]]
TSM.L["This will reset all groups and operations (if not stored globally) to be wiped from this profile."] = "This will reset all groups and operations (if not stored globally) to be wiped from this profile."
--[[Translation missing --]]
TSM.L["Time"] = "Time"
--[[Translation missing --]]
TSM.L["Time Format"] = "Time Format"
--[[Translation missing --]]
TSM.L["Time Frame"] = "Time Frame"
--[[Translation missing --]]
TSM.L["TIME FRAME"] = "TIME FRAME"
--[[Translation missing --]]
TSM.L["TINKER"] = "TINKER"
--[[Translation missing --]]
TSM.L["Tooltip Price Format"] = "Tooltip Price Format"
--[[Translation missing --]]
TSM.L["Tooltip Settings"] = "Tooltip Settings"
--[[Translation missing --]]
TSM.L["Top Buyers:"] = "Top Buyers:"
--[[Translation missing --]]
TSM.L["Top Item:"] = "Top Item:"
--[[Translation missing --]]
TSM.L["Top Sellers:"] = "Top Sellers:"
TSM.L["Total"] = "Total"
--[[Translation missing --]]
TSM.L["Total Gold"] = "Total Gold"
--[[Translation missing --]]
TSM.L["Total Gold Earned:"] = "Total Gold Earned:"
--[[Translation missing --]]
TSM.L["Total Gold Spent:"] = "Total Gold Spent:"
--[[Translation missing --]]
TSM.L["Total Price"] = "Total Price"
--[[Translation missing --]]
TSM.L["Total Profit:"] = "Total Profit:"
TSM.L["Total Value"] = "Valor Total"
--[[Translation missing --]]
TSM.L["Total Value of All Items: "] = "Total Value of All Items: "
--[[Translation missing --]]
TSM.L["Track Sales / Purchases via trade"] = "Track Sales / Purchases via trade"
--[[Translation missing --]]
TSM.L["TradeSkillMaster Info"] = "TradeSkillMaster Info"
--[[Translation missing --]]
TSM.L["Transform Value"] = "Transform Value"
--[[Translation missing --]]
TSM.L["TSM Banking"] = "TSM Banking"
--[[Translation missing --]]
TSM.L["TSM can sync data automatically between multiple accounts."] = "TSM can sync data automatically between multiple accounts."
--[[Translation missing --]]
TSM.L["TSM Crafting"] = "TSM Crafting"
--[[Translation missing --]]
TSM.L["TSM Destroying"] = "TSM Destroying"
--[[Translation missing --]]
TSM.L["TSM failed to scan some auctions. Please rerun the scan."] = "TSM failed to scan some auctions. Please rerun the scan."
--[[Translation missing --]]
TSM.L["TSM Groups"] = "TSM Groups"
--[[Translation missing --]]
TSM.L["TSM is missing important information from the TSM Desktop Application. Please ensure the TSM Desktop Application is running and is properly configured."] = "TSM is missing important information from the TSM Desktop Application. Please ensure the TSM Desktop Application is running and is properly configured."
--[[Translation missing --]]
TSM.L["TSM Mailing"] = "TSM Mailing"
--[[Translation missing --]]
TSM.L["TSM TASK LIST"] = "TSM TASK LIST"
--[[Translation missing --]]
TSM.L["TSM Vendoring"] = "TSM Vendoring"
TSM.L["TSM Version Info:"] = "Informações da versão TSM:"
--[[Translation missing --]]
TSM.L["TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"] = "TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"
--[[Translation missing --]]
TSM.L["TSM4"] = "TSM4"
TSM.L["TUJ 3-Day Price"] = "TUJ Preço de 3 Dias"
TSM.L["Twitter Integration"] = "Integração com Twitter"
--[[Translation missing --]]
TSM.L["Twitter Integration Not Enabled"] = "Twitter Integration Not Enabled"
--[[Translation missing --]]
TSM.L["Type"] = "Type"
--[[Translation missing --]]
TSM.L["Type Something"] = "Type Something"
TSM.L["Unbalanced parentheses."] = "Parênteses errados."
--[[Translation missing --]]
TSM.L["Undercut amount:"] = "Undercut amount:"
--[[Translation missing --]]
TSM.L["Undercut by whitelisted player."] = "Undercut by whitelisted player."
--[[Translation missing --]]
TSM.L["Undercutting blacklisted player."] = "Undercutting blacklisted player."
--[[Translation missing --]]
TSM.L["Undercutting competition."] = "Undercutting competition."
--[[Translation missing --]]
TSM.L["Ungrouped Items"] = "Ungrouped Items"
--[[Translation missing --]]
TSM.L["Unknown Item"] = "Unknown Item"
TSM.L["Unwrap Gift"] = "Desembrulhar Presente"
TSM.L["Up"] = "Acima"
--[[Translation missing --]]
TSM.L["UPDATE EXISTING MACRO"] = "UPDATE EXISTING MACRO"
TSM.L["Usage: /tsm price <ItemLink> <Price String>"] = "Uso: /tsm price <Link Item> <Valor de Preço>"
--[[Translation missing --]]
TSM.L["Use smart average for purchase price"] = "Use smart average for purchase price"
--[[Translation missing --]]
TSM.L["Use the field below to search the auction house by filter"] = "Use the field below to search the auction house by filter"
--[[Translation missing --]]
TSM.L["Use the list to the left to select groups, & operations you'd like to create export strings for."] = "Use the list to the left to select groups, & operations you'd like to create export strings for."
--[[Translation missing --]]
TSM.L["VALUE PRICE SOURCE"] = "VALUE PRICE SOURCE"
--[[Translation missing --]]
TSM.L["ValueSources"] = "ValueSources"
--[[Translation missing --]]
TSM.L["Variable Name"] = "Variable Name"
--[[Translation missing --]]
TSM.L["Vendor"] = "Vendor"
--[[Translation missing --]]
TSM.L["Vendor Buy Price"] = "Vendor Buy Price"
--[[Translation missing --]]
TSM.L["Vendor Search"] = "Vendor Search"
--[[Translation missing --]]
TSM.L["VENDOR SEARCH"] = "VENDOR SEARCH"
--[[Translation missing --]]
TSM.L["Vendor Sell"] = "Vendor Sell"
--[[Translation missing --]]
TSM.L["Vendor Sell Price"] = "Vendor Sell Price"
--[[Translation missing --]]
TSM.L["Vendoring 'SELL ALL' Button"] = "Vendoring 'SELL ALL' Button"
--[[Translation missing --]]
TSM.L["View ignored items in the Destroying options."] = "View ignored items in the Destroying options."
--[[Translation missing --]]
TSM.L["Warehousing"] = "Warehousing"
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group."] = "Warehousing will move a max of %d of each item in this group."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group."] = "Warehousing will move all of the items in this group."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."
TSM.L["WARNING: The macro was too long, so was truncated to fit by WoW."] = "AVISO: A macro era muito longa, então foi truncada para ser ajustada pelo WoW."
TSM.L["WARNING: You minimum price for %s is below its vendorsell price (with AH cut taken into account). Consider raising your minimum price, or vendoring the item."] = "AVISO: Seu preço mínimo para %s está abaixo do seu valor de venda ao comerciante (com o corte da CdL levado em consideração). Considere aumentar seu preço mínimo ou vendê-lo ao comerciante."
--[[Translation missing --]]
TSM.L["When above maximum:"] = "When above maximum:"
--[[Translation missing --]]
TSM.L["When below minimum:"] = "When below minimum:"
--[[Translation missing --]]
TSM.L["Whitelist"] = "Whitelist"
--[[Translation missing --]]
TSM.L["Whitelisted Players"] = "Whitelisted Players"
--[[Translation missing --]]
TSM.L["You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"] = "You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"
--[[Translation missing --]]
TSM.L["You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."] = "You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."
TSM.L["You cannot use %s as part of this custom price."] = "Você não pode usar %s como parte desse preço personalizado."
TSM.L["You cannot use %s within convert() as part of this custom price."] = "Você não pode usar %s dentro do convert() como parte deste preço personalizado."
--[[Translation missing --]]
TSM.L["You do not need to add \"%s\", alts are whitelisted automatically."] = "You do not need to add \"%s\", alts are whitelisted automatically."
TSM.L["You don't know how to craft this item."] = "Você não sabe como criar este item."
TSM.L["You must reload your UI for these settings to take effect. Reload now?"] = "Você deve atualizar sua UI para que essas mudanças sejam aplicadas. Atualizar agora?"
TSM.L["You won an auction for %sx%d for %s"] = "Você ganhou um leilão de %sx%d por %s"
--[[Translation missing --]]
TSM.L["Your auction has not been undercut."] = "Your auction has not been undercut."
--[[Translation missing --]]
TSM.L["Your auction of %s expired"] = "Your auction of %s expired"
TSM.L["Your auction of %s has sold for %s!"] = "Seu leilão %s foi vendido por %s!"
--[[Translation missing --]]
TSM.L["Your Buyout"] = "Your Buyout"
TSM.L["Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"] = "Seu método de valor de criação para '%s' era inválido então ele retornou o valor padrão. Detalhes: %s "
TSM.L["Your default craft value method was invalid so it has been returned to the default. Details: %s"] = "Seu método de valor de criação padrão era inválido então ele retornou o padrão. Detalhes: %s "
--[[Translation missing --]]
TSM.L["Your task list is currently empty."] = "Your task list is currently empty."
TSM.L["You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."] = "Você foi faseado, o que fez com que a CdL parasse de funcionar devido à um erro no lado dos servidores Blizzards. Por favor, feche e reabra a janela da CdL e reinicie o Sniper."
--[[Translation missing --]]
TSM.L["You've been undercut."] = "You've been undercut."
--[[Translation missing --]]
TSM.L["YY/MM/DD HH:MM"] = "YY/MM/DD HH:MM"
	elseif locale == "ruRU" then
TSM.L = TSM.L or {}
TSM.L["%d |4Group:Groups; Selected (%d |4Item:Items;)"] = "Выбрано: группы %d, предметы %d"
TSM.L["%d auctions"] = "лоты: %d"
TSM.L["%d Groups"] = "%d Группы"
TSM.L["%d Items"] = "%d Предметы"
TSM.L["%d of %d"] = "%d по %d"
TSM.L["%d Operations"] = "Операции: %d"
TSM.L["%d Posted Auctions"] = "Активные лоты: %d"
TSM.L["%d Sold Auctions"] = "Проданные лоты: %d"
TSM.L["%s (%s bags, %s bank, %s AH, %s mail)"] = "%s (%s сумки, %s банк, %s аукцион, %s почта)"
TSM.L["%s (%s player, %s alts, %s guild, %s AH)"] = "%s (%s игрок, %s альты, %s гильдия, %s аукцион)"
TSM.L["%s (%s profit)"] = "%s (%s прибыль)"
TSM.L["%s ago"] = "%s назад"
TSM.L["%s Crafts"] = "%s Создать"
TSM.L["%s in guild vault"] = "%s в банке гильдии"
TSM.L["%s is a valid custom price but %s is an invalid item."] = "%s корректная индивидуальная цена, но %s некорректный предмет. "
TSM.L["%s is a valid custom price but did not give a value for %s."] = "%s корректная индивидуальная цена, но не дает стоимость для %s."
TSM.L["'%s' is an invalid operation! Min restock of %d is higher than max restock of %d."] = "%s недопустимая команда! Мин. пополнение %d больше, чем макс. %d."
TSM.L["%s is not a valid custom price and gave the following error: %s"] = "%s некорректная индивидуальная цена, ошибка: %s"
TSM.L["%s operation(s)"] = "%s операции(s)"
TSM.L["%s removed."] = "%s удалено."
TSM.L["%s sent you %s"] = "%s отправил вам %s"
TSM.L["%s sent you %s and %s"] = "%s отправил вам %s и %s"
TSM.L["%s sent you a COD of %s for %s"] = "%s отправить наложенным платежом %s для %s"
TSM.L["%s sent you a message: %s"] = "%s отправил вам сообщение: %s"
TSM.L["%s total"] = "всего %s"
TSM.L["%sDrag%s to move this button"] = "%sЗажмите%s чтобы переместить эту кнопку"
TSM.L["%sLeft-Click%s to open the main window"] = "%sЛКМ%s для открытия главного окна"
TSM.L["(%d/500 Characters)"] = "%d / 500 символов"
TSM.L["(max %d)"] = "(макс. %d)"
TSM.L["(max 200)"] = "(макс. 200)"
TSM.L["(max 5000)"] = "(макс. 5000)"
TSM.L["(min %d - max %d)"] = "(мин. %d – макс. %d)"
TSM.L["(min 0 - max 10000)"] = "(мин 0 - макс 10000)"
TSM.L["(minimum 0 - maximum 2)"] = "(минимум 0 - максимум 2)"
TSM.L["(minimum 0 - maximum 20)"] = "(минимум 0 - максимум 20)"
TSM.L["(minimum 0 - maximum 2000)"] = "(минимум 0 - максимум 2000)"
TSM.L["(minimum 0 - maximum 30)"] = "(минимум 0 - максимум 30)"
TSM.L["(minimum 0 - maximum 905)"] = "(минимум 0 - максимум 905)"
TSM.L["(minimum 0% - maximum 50%)"] = "(минимум 0% - максимум 50%)"
TSM.L["(minimum 0.5 - maximum 10)"] = "(минимум 0.5 - максимум 10)"
TSM.L["(minimum 1 - maximum 100)"] = "(минимум 1 - максимум 100)"
TSM.L["(minimum 8 - maximum 25)"] = "(минимум 8 - максимум 25)"
TSM.L["(New group(s) will be created)"] = "(Будут созданы новые группы)"
TSM.L["/tsm help|r - Shows this help listing"] = "/tsm help|r — Команда покажет справку"
TSM.L["/tsm|r - opens the main TSM window."] = "/tsm|r — Команда откроет окно TSM."
TSM.L["_ Hr _ Min ago"] = "_ ч. _ мин. назад"
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."] = "|cffff0000IMPORTANT:|r Когда TSM Accounting сохранял данные для этого сервера, их оказалось слишком много для обработки, поэтому старые данные были стёрты, что бы не повредить переменные. Сохранены последние данные о покупке %s."
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."] = "|cffff0000IMPORTANT:|r Когда TSM Accounting сохранял данные для этого сервера, их оказалось слишком много для обработки, поэтому старые данные были стёрты, что бы не повредить переменные. Сохранены последние данные о продаже %s."
TSM.L["|cffff0000WARNING:|r TSM_AuctionDB doesn't currently have any pricing data for your realm. Either download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update TSM_AuctionDB's data, or run a manual scan in-game."] = "|cffff0000WARNING:|r У TSM AuctionDB сейчас нет данных о ценах на вашем сервере. Скачайте программу TSM по ссылке |cff99ffffhttp://tradeskillmaster.com|r, что бы обновлять данные о ценах автоматически или запустите ручное сканирование аукциона в игре."
TSM.L["|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."] = "|cffffd839ЛКМ|r — игнорировать предмет в этой сессии. |cffffd839Shift+ЛКМ|r — игнорировать всегда. Удалить предмет из списка игнора можно в настройках на вкладке Vendoring."
TSM.L["|cffffd839Left-Click|r to ignore an item this session."] = "|cffffd839ЛКМ|r что бы игнорировать предмет в этой сессии."
TSM.L["|cffffd839Shift-Left-Click|r to ignore it permanently."] = "|cffffd839Shift+ЛКМ|r чтобы игнорировать всегда."
TSM.L["1 Group"] = "1 Группа"
TSM.L["1 Item"] = "1 Предмет"
TSM.L["12 hr"] = "12 ч."
TSM.L["24 hr"] = "24 ч."
TSM.L["48 hr"] = "48 ч."
TSM.L["A custom price of %s for %s evaluates to %s."] = "Индивидуальная цена %s для %s оценивается в %s."
TSM.L["A maximum of 1 convert() function is allowed."] = "Допускается максимум 1 функция convert()."
TSM.L["A scan is already in progress. Please stop that scan before starting another one."] = "Сканирование уже идёт. Остановите его, прежде чем начать новое."
TSM.L["Above max expires."] = "Превышены попытки выставить."
TSM.L["Above max price. Not posting."] = "Выше макс. Не выставляем."
TSM.L["Above max price. Posting at max price."] = "Выше макс. Ставим по макс. цене."
TSM.L["Above max price. Posting at min price."] = "Выше макс. Ставим по мин. цене."
TSM.L["Above max price. Posting at normal price."] = "Выше макс. Ставим по норм. цене."
TSM.L["Accepting these item(s) will cost"] = "Принять эти предметы будет стоить"
TSM.L["Accepting this item will cost"] = "Принять этот предмет будет стоить"
TSM.L["Account sync removed. Please delete the account sync from the other account as well."] = "Синхронизация аккаунта отключена. Отключите синхронизацию и на другом аккаунте."
TSM.L["Account Syncing"] = "Синхронизация аккаунта"
TSM.L["Accounting"] = "Статистика"
TSM.L["Accounting Tooltips"] = "Подсказки с вашей статистикой"
TSM.L["Activity Type"] = "Вид деятельности"
TSM.L["ADD %d ITEMS"] = "Добавить предметы: %d"
TSM.L["Add / Remove Items"] = "Список предметов"
TSM.L["ADD NEW CUSTOM PRICE SOURCE"] = "Добавить индивидуальный источник цен"
TSM.L["ADD OPERATION"] = "Операция"
TSM.L["Add Player"] = "Добавить игрока"
TSM.L["Add Subject / Description"] = "Тема и описание"
TSM.L["Add Subject / Description (Optional)"] = "Добавить тему и описание письма"
TSM.L["ADD TO MAIL"] = "Добавить к письму"
TSM.L["Additional error suppressed"] = "Вывод дополнительных ошибок отключен"
TSM.L["Adjust the settings below to set how groups attached to this operation will be auctioned."] = "Так предметы в группах, связанных с операцией, будут выставлены на аукцион."
TSM.L["Adjust the settings below to set how groups attached to this operation will be cancelled."] = "Условия отмены аукционов для предметов в группах, связанных с операцией."
TSM.L["Adjust the settings below to set how groups attached to this operation will be priced."] = "Установите алгоритмы расчёта цен для предметов в группах, связанных с операцией."
TSM.L["Advanced Item Search"] = "Расширенный поиск"
TSM.L["Advanced Options"] = "Расширенные настройки"
TSM.L["AH"] = "Аукцион"
TSM.L["AH (Crafting)"] = "Аук (Создание)"
TSM.L["AH (Disenchanting)"] = "Аукцион (Распыление)"
TSM.L["AH BUSY"] = "Аук занят"
TSM.L["AH Frame Options"] = "Настройки окна аукциона"
TSM.L["AH Rows Shown (requires reload)"] = "Показано строк аука (требуется перезагрузка)"
TSM.L["Alarm Clock"] = "Бyдильник"
TSM.L["All Auctions"] = "Все лоты на аукционе"
TSM.L["All Characters and Guilds"] = "Персонажи и гильдии"
TSM.L["All Professions"] = "Все профессии"
TSM.L["Allow partial stack?"] = "Выставлять неполные стаки?"
TSM.L["Alt Guild Bank"] = "Банк гильдии альтов"
TSM.L["Alts"] = "Альты"
TSM.L["Alts AH"] = "Аукционы альтов"
TSM.L["Amount"] = "Сумма"
TSM.L["AMOUNT"] = "СУММА"
TSM.L["Amount of Bag Space to Keep Free"] = "Оставлять свободных ячеек в сумках"
TSM.L["Applied %s to %s."] = "%s привязано к %s."
TSM.L["APPLY FILTERS"] = "Применить фильтры"
TSM.L["Apply operation to group:"] = "Применить операцию к группе:"
TSM.L["Are you sure you want to clear old accounting data?"] = "Очистить старые данные вашей статистики?"
TSM.L["Are you sure you want to delete this group?"] = "Удалить эту группу?"
TSM.L["Are you sure you want to delete this operation?"] = "Удалить эту операцию?"
TSM.L["Are you sure you want to reset all operation settings?"] = "Сбросить все настройки операции?"
TSM.L["At above max price and not undercut."] = "При превышении макс. цены и не перебит."
TSM.L["At normal price and not undercut."] = "По нормальной цене и не перебит."
TSM.L["Auction"] = "Аукцион"
TSM.L["AUCTION DETAILS"] = "Детали аукциона"
TSM.L["Auction Duration"] = "Длительность"
TSM.L["Auction has been bid on."] = "Аукцион был объявлен."
TSM.L["Auction Window Close"] = "Закрыть окно аукциона"
TSM.L["Auction Window Open"] = "Открыть окно аукциона"
TSM.L["Auctionator - Auction Value"] = "Auctionator - рыночная стоимость"
TSM.L["Auctioneer - Appraiser"] = "Auctioneer - Apprаiser"
TSM.L["Auctioneer - Market Value"] = "Auctioneer - рыночная стoимость"
TSM.L["Auctioneer - Minimum Buyout"] = "Auctioneer - минимальный выкуп"
TSM.L["Auctioning"] = "Аукцион"
TSM.L["Auctioning Log"] = "Результаты сканирования"
TSM.L["Auctioning Operation"] = "Операции аукциона"
TSM.L["Auctioning 'POST'/'CANCEL' Button"] = "Кнопки «Выставить» и «Отменить» на аукционе"
TSM.L["Auctions"] = "Лоты"
TSM.L["Auto Quest Complete"] = "Автоматически завершающееся задание"
TSM.L["Automatically sell vendor trash?"] = "Автоматически продавать мусор торговцу?"
TSM.L["Average Earned Per Day:"] = "Средний заработок в день:"
TSM.L["Average Prices:"] = "Средняя цена:"
TSM.L["Average Profit Per Day:"] = "Средняя прибыль в день:"
TSM.L["Average Spent Per Day:"] = "Средние расходы в день:"
TSM.L["Avg Buy Price"] = "Ср. цена покупки"
TSM.L["Avg Resale Profit"] = "Ср. доход c перепродажи"
TSM.L["Avg Sell Price"] = "Ср. цена продажи"
TSM.L["BACK TO LIST"] = "Вернуться к списку"
TSM.L["Back to List"] = "Вернуться к списку"
TSM.L["Bag"] = "Сумка"
TSM.L["Bags"] = "Сумки"
TSM.L["Banks"] = "Банки"
TSM.L["BankUI Move Delay"] = "BankUI Задержка перемещения"
TSM.L["Base Group"] = "Базовая группа"
TSM.L["Base Item"] = "Базовый предмет"
TSM.L["Batch size"] = "Размер партии"
TSM.L["Below are your currently available price sources organized by module. The %skey|r is what you would type into a custom price box."] = "Ниже показаны доступные источники цен. %skey|r  - это то, что вы должны ввести в поле индивидуальной цены."
TSM.L["Below custom price:"] = "Ниже индивидуальной цены:"
TSM.L["Below min price. Posting at max price."] = "Ниже мин. Ставим по макс. цене."
TSM.L["Below min price. Posting at min price."] = "Ниже мин. Ставим по мин. цене."
TSM.L["Below min price. Posting at normal price."] = "Ниже мин. Ставим по норм. цене."
TSM.L["Below, you can manage your profiles which allow you to have entirely different sets of groups."] = "Ниже настройки ваших профилей. Они позволят вам иметь разные наборы групп."
TSM.L["Bid %d / %d"] = "Ставка %d / %d"
TSM.L["Bid (item)"] = "Ставка (шт)"
TSM.L["Bid (stack)"] = "Ставка (стак)"
TSM.L["Bid Price"] = "Цена ставки"
TSM.L["Bid Sniper Paused"] = "Ставка «Снайпер» на паузе"
TSM.L["Bid Sniper Running"] = "Запущен «Снайпер» по ставкам"
TSM.L["Blacklisted players:"] = "Игроки в черном списке:"
TSM.L["Bought"] = "Купил"
TSM.L["Bought %sx%d for %s from %s"] = "Купил %sx%d для %s от %s"
TSM.L["Bound Actions"] = "Связанные действия"
TSM.L["BUSY"] = "Занят"
TSM.L["BUY"] = "Купить"
TSM.L["Buy"] = "Купить"
TSM.L["Buy %d / %d"] = "Купить %d / %d"
TSM.L["Buy %d / %d (Confirming %d / %d)"] = "Покупка %d / %d (Подтверждение %d / %d)"
TSM.L["Buy from AH"] = "Купить на аукционе"
TSM.L["Buy from Vendor"] = "Купить у торговца"
TSM.L["BUY GROUPS"] = "Купить группы"
TSM.L["Buy Options"] = "Настройки покупки"
TSM.L["BUYBACK ALL"] = "Выкупить всё"
TSM.L["Buyer/Seller"] = "Покупатель/Продавец"
TSM.L["Buyout (item)"] = "Выкуп (шт)"
TSM.L["Buyout (stack)"] = "Выкуп (стак)"
TSM.L["Buyout Price"] = "Цена выкупа"
TSM.L["Buyout Sniper Paused"] = "Выкуп «Снайпер» на паузе"
TSM.L["Buyout Sniper Running"] = "Запущен «Снайпер» на выкуп"
TSM.L["BUYS"] = "Покупки"
TSM.L["By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."] = "В эту группу по умолчанию входят все предметы, которые вы не добавили в другие группы. Эту группу нельзя изменить или удалить."
TSM.L["Can Craft At Least One, Profit, Craftable Quantity"] = "Может быть создан по крайней мере один, Прибыль, Качество"
TSM.L["Cancel auctions with bids"] = "Отменять аукционы со ставками"
TSM.L["Cancel Scan"] = "Отменить скан."
TSM.L["Cancel to repost higher?"] = "Отменять для повышения цены?"
TSM.L["Cancel undercut auctions?"] = "Отменять перебитые аукционы?"
TSM.L["Canceling"] = "Отмена"
TSM.L["Canceling %d / %d"] = "Отмена %d / %d"
TSM.L["Canceling %d Auctions..."] = "Отмена лотов: %d..."
TSM.L["Canceling all auctions."] = "Отмена всех аукционов."
TSM.L["Canceling auction which you've undercut."] = "Отмена лота, который вы перебили."
TSM.L["Canceling disabled."] = "Отмена отключена."
TSM.L["Canceling Settings"] = "Настройки отмены аукциона"
TSM.L["Canceling to repost at higher price."] = "Отмена для повышения цены."
TSM.L["Canceling to repost at reset price."] = "Отмена для выставления по сниженной цене."
TSM.L["Canceling to repost higher."] = "Отмена для повышения цены."
TSM.L["Canceling undercut auctions and to repost higher."] = "Отмена сбитых лотов и повышение цены."
TSM.L["Canceling undercut auctions."] = "Отмена сбитых лотов."
TSM.L["Cancelled"] = "Отменен"
TSM.L["Cancelled auction of %sx%d"] = "Отмена лота %sx%d"
TSM.L["Cancelled Since Last Sale"] = "Отменено с последней продажи"
TSM.L["CANCELS"] = "Отменённые"
TSM.L["Cannot repair from the guild bank!"] = "Невозможно починиться за счёт гильдии!"
TSM.L["Can't load TSM tooltip while in combat"] = "Нельзя вывести подсказку TSM в бою"
TSM.L["Cash Register"] = "Сумма зарегистрирована"
TSM.L["Character"] = "Персонаж"
TSM.L["CHARACTER"] = "ПЕРСОНАЖ"
TSM.L["Character Bags"] = "Сумки персонажа"
TSM.L["Character Bank"] = "Банк персонажа"
TSM.L["CHARACTERS"] = "Персонажи"
TSM.L["Chat Tab"] = "Вкладка чата"
TSM.L["Cheapest auction below min price."] = "Самый дешевый лот ниже мин. цены."
TSM.L["Clean Automatically"] = "Очищать автоматически"
TSM.L["Clear"] = "Очистить"
TSM.L["Clear All"] = "Очистить все"
TSM.L["CLEAR DATA"] = "Очистить данные"
TSM.L["Clear Filters"] = "Очистить"
TSM.L["Clear Log After 'X' Amount of Days"] = "Очистить лог после 'X' дней"
TSM.L["Clear Old Data"] = "Очистить старые данные"
TSM.L["Clear Old Data Confirmation"] = "Подтверждение очистки старых данных"
TSM.L["Clear Queue"] = "Очистить"
TSM.L["Clear Selection"] = "Очистить выбранное"
TSM.L["COD"] = "наложенный платеж"
TSM.L["Coins (%s)"] = "Монеты (%s)"
TSM.L["Combine Partial Stacks"] = "Объединить неполные стаки"
TSM.L["Combining..."] = "Объединение..."
TSM.L["Configuration Scroll Wheel"] = "Настройка колеса мыши"
TSM.L["Confirm"] = "Подтвердить"
TSM.L["Confirm Complete Sound"] = "Звук окончания подтверждения"
TSM.L["Confirming %d / %d"] = "Подтверждение %d / %d"
TSM.L["Connected to %s"] = "Подключен к %s"
TSM.L["Connecting to %s"] = "Подключение к %s"
TSM.L["CONTACTS"] = "Контакты"
TSM.L["Contacts Menu"] = "Список контактов"
TSM.L["Cooldown"] = "Кулдаун"
TSM.L["Cooldowns"] = "Кулдауны"
TSM.L["Cost"] = "Цена"
TSM.L["Could not apply %s operation %s to %s - it has too many operations already."] = "Нельзя применить %s операцию %s для %s - уже слишком много операций."
TSM.L["Could not apply %s operation to group %s because the group does not exist"] = "Операция %s не привязана к группе %s. Такой группы не существует."
TSM.L["Could not create macro as you already have too many. Delete one of your existing macros and try again."] = "Макрос не создан, потому что их уже слишком много. Удалите один из них и попробуйте снова."
TSM.L["Could not deserialize input"] = "Не могу десериализовать ввод"
TSM.L["Could not find enchanted item from"] = "Не могу найти зачарованный предмет"
TSM.L["Could not find pet"] = "Питомец не найден"
TSM.L["Could not find profile '%s'. Possible profiles: '%s'"] = "Профиль '%s' не найден. Доступные профили: '%s'"
TSM.L["Could not sell items due to not having free bag space available to split a stack of items."] = "Не могу продать товары из-за отсутствия места в сумках для разделения стака."
TSM.L["Craft"] = "Создать"
TSM.L["CRAFT"] = "Создать"
TSM.L["Craft (Unprofitable)"] = "Создать (Невыгодный)"
TSM.L["Craft (When Profitable)"] = "Создать (Когда выгодно)"
TSM.L["Craft All"] = "Создать всё"
TSM.L["CRAFT ALL"] = "Создать всё"
TSM.L["Craft Name"] = "Название рецепта"
TSM.L["CRAFT NEXT"] = "Создать след."
TSM.L["Craft value method:"] = "Метод расчета стоимости крафта:"
TSM.L["Craftable Quantity, Profit"] = "Создаваемое количество, Прибыль"
TSM.L["CRAFTER"] = "СОЗДАТЕЛЬ"
TSM.L["CRAFTING"] = "КРАФТ"
TSM.L["Crafting"] = "Крафт"
TSM.L["Crafting Cost"] = "Стоимость создания"
TSM.L["Crafting 'CRAFT NEXT' Button"] = "Кнопка «Создать след.»"
TSM.L["Crafting Queue"] = "Очередь производства"
TSM.L["Crafting Tooltips"] = "Подсказки об изготовлении предметов"
TSM.L["Crafts"] = "Рецепты"
TSM.L["Crafts %d"] = "Создать %d за раз"
TSM.L["CREATE MACRO"] = "Создать макрос"
TSM.L["Create New Operation"] = "Создать новую операцию"
TSM.L["CREATE NEW PROFILE"] = "Создать новый профиль"
TSM.L["Crystals"] = "Кристаллы"
TSM.L["Current Profiles"] = "Ваши профили"
TSM.L["CURRENT SEARCH"] = "ТЕКУЩИЙ ПОИСК"
TSM.L["CUSTOM POST"] = "Пользовательское сообщение"
TSM.L["Custom Price"] = "Индивидуальная цена"
TSM.L["Custom Price Source"] = "Индивидуальный источник цен"
TSM.L["Custom Sources"] = "Индивидуальный источник"
TSM.L["Database Sources"] = "Показ источников данных в подсказке"
TSM.L["DD/MM/YY HH:MM"] = "ДД/ММ/ГГ ЧЧ:ММ"
TSM.L["Default Craft Value Method:"] = "Метод расчёта стоимости крафта по умолчанию:"
TSM.L["Default Material Cost Method:"] = "Метод расчёта стоимости материалов по умолчанию:"
TSM.L["Default Price"] = "Стандартная цена"
TSM.L["Default Price Configuration"] = "Конфигурация цены по умолчанию"
TSM.L["Default vendoring page"] = "Вкладка по умолчанию в окне торговли"
TSM.L["Define whet priority Gathering gives certain sources."] = "Приоритет источников для сбора материалов."
TSM.L["Delete Profile Confirmation"] = "Подтвердите удаление профиля"
TSM.L["DEPOSIT REAGENTS"] = "Сложить реагенты"
TSM.L["Deselect All Groups"] = "Снять выделение"
TSM.L["Deselect All Items"] = "Снять выделение"
TSM.L["Destroy Next"] = "Уничтожить следующее"
TSM.L["Destroy Value"] = "Стоимость уничтожения"
TSM.L["Destroy Value Source"] = "Источник стоимости уничтожения"
TSM.L["Destroying"] = "Уничтожение"
TSM.L["Destroying 'DESTROY NEXT' Button"] = "Кнопка «Уничтожить следующее»"
TSM.L["Destroying Tooltips"] = "Подсказки уничтожения"
TSM.L["Destroying..."] = "Уничтожение..."
TSM.L["Details"] = "Детали"
TSM.L["Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."] = "Лот %s не отменен. Потому что ваш порог для отмены аукциона (%s) не корректен. Проверьте настройки."
TSM.L["Did not cancel %s because your maximum price (%s) is invalid. Check your settings."] = "Лот %s не отменен. Ваша максимальная цена (%s) не верна. Проверьте настройки."
TSM.L["Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Лот %s не отменен. Ваша максимальная цена (%s) ниже минимальной цены (%s). Проверьте настройки."
TSM.L["Did not cancel %s because your minimum price (%s) is invalid. Check your settings."] = "Лот %s не отменен. Ваша минимальная цена (%s) не верна. Проверьте настройки."
TSM.L["Did not cancel %s because your normal price (%s) is invalid. Check your settings."] = "Лот %s не отменен. Ваша нормальная цена (%s) не верна. Проверьте настройки."
TSM.L["Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Лот %s не отменен. Ваша нормальная цена (%s) ниже минимальной цены (%s). Проверьте настройки."
TSM.L["Did not cancel %s because your undercut (%s) is invalid. Check your settings."] = "Лот %s не отменен. Ваша цена сбивания (%s) не верна. Проверьте настройки."
TSM.L["Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."] = "Лот %s не выставлен. Blizzard не предоставила для этого нужную информацию. Попробуйте позже."
TSM.L["Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."] = "Лот %s не выставлен. Владелец лота (%s) с самой низкой ценой находится в вашем черном и белом списке одновременно, так быть не должно. Измените настройки, чтобы исправить эту проблему."
TSM.L["Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."] = "Лот %s не выставлен. Вы или ваш альт (%s) находитесь в черном списке, так быть не должно. Удалите персонажа из черного списка."
TSM.L["Did not post %s because your maximum price (%s) is invalid. Check your settings."] = "Лот %s не выставлен. Ваша максимальная цена (%s) не верна. Проверьте настройки."
TSM.L["Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Лот %s не выставлен. Ваша максимальная цена (%s) ниже, вашей минимальной цены (%s). Проверьте настройки."
TSM.L["Did not post %s because your minimum price (%s) is invalid. Check your settings."] = "Лот %s не выставлен. Ваша минимальная цена (%s) не верна. Проверьте настройки."
TSM.L["Did not post %s because your normal price (%s) is invalid. Check your settings."] = "Лот %s не выставлен. Ваша нормальная цена (%s) не верна. Проверьте настройки."
TSM.L["Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Лот %s не выставлен. Ваша нормальная цена (%s) ниже, вашей минимальной цены (%s). Проверьте настройки."
TSM.L["Did not post %s because your stack size (%d) is higher than the max stack size of the item (%d)."] = "Лот %s не выставлен. Ваш размер стака (%d) больше, чем максимальный размер стака для предмета (%d)."
TSM.L["Did not post %s because your undercut (%s) is invalid. Check your settings."] = "Лот %s не выставлен. Ваша цена сбития (%s) не верна. Проверьте настройки."
TSM.L["Disable invalid price warnings"] = "Отключить предупреждения о неверной цене"
TSM.L["Disenchant Search"] = "Поиск для распыления"
TSM.L["DISENCHANT SEARCH"] = "Поиск для распыления"
TSM.L["Disenchant Search Options"] = "Настройки поиска предметов для распыления"
TSM.L["Disenchant Value"] = "Стоимость распыления"
TSM.L["Disenchanting Options"] = "Настройки распыления"
TSM.L["Display auctioning values"] = "Показать цены на аукционе"
TSM.L["Display cancelled since last sale"] = "Показать сколько раз отменено после последней продажи"
TSM.L["Display crafting cost"] = "Показать стоимость создания"
TSM.L["Display detailed destroy info"] = "Показать подробности уничтожения"
TSM.L["Display disenchant value"] = "Показать стоимость распыления"
TSM.L["Display global historical price"] = "Показать историческую цену по миру"
TSM.L["Display global market value avg"] = "Показать ср. рыночную стоимость по миру"
TSM.L["Display global min buyout avg"] = "Показать ср. минимальную цену по миру"
TSM.L["Display global sale avg"] = "Показать ср. цену продажи по миру"
TSM.L["Display group name"] = "Показать имя группы"
TSM.L["Display historical price"] = "Показать историческую цену"
TSM.L["Display market value"] = "Показать рыночную стоимость"
TSM.L["Display mill value"] = "Показать стоимость измельчения"
TSM.L["Display min buyout"] = "Показать минимальную цену"
TSM.L["Display Operation Names"] = "Показать имена операций"
TSM.L["Display prospect value"] = "Показать стоимость просеивания"
TSM.L["Display purchase info"] = "Показать информацию о покупках"
TSM.L["Display region historical price"] = "Показать историческую цену по региону"
TSM.L["Display region market value avg"] = "Показать ср. рыночную стоимость по региону"
TSM.L["Display region min buyout avg"] = "Показать ср. минимальную цену по региону"
TSM.L["Display region sale avg"] = "Показать ср. цену продажи по региону"
TSM.L["Display region sale rate"] = "Показать шанс продажи по региону"
TSM.L["Display region sold per day"] = "Показать статистику ежедневных продаж по региону"
TSM.L["Display sale info"] = "Показать информацию о продажах"
TSM.L["Display sale rate"] = "Показать шанс продажи"
TSM.L["Display shopping max price"] = "Показать максимальную цену покупки"
TSM.L["Display total money recieved in chat?"] = "Показывать общую сумму полученных денег в чат?"
TSM.L["Display transform value"] = "Показать стоимость трансформации (например разделки рыбы)"
TSM.L["Display vendor buy price"] = "Показать цену покупки у торговца"
TSM.L["Display vendor sell price"] = "Показать цену продажи торговцу"
TSM.L["Doing so will also remove any sub-groups attached to this group."] = "Вместе с группой вы удалите все её подгруппы."
TSM.L["Done Canceling"] = "Лоты сняты с аукциона"
TSM.L["Done Posting"] = "Лоты выставлены"
TSM.L["Done Scanning"] = "Сканирование закончено"
TSM.L["Don't post after this many expires:"] = "Количество попыток выставить лот:"
TSM.L["Don't Post Items"] = "Не выставлять"
TSM.L["Don't prompt to record trades"] = "Не предлагать записывать сделки"
TSM.L["DOWN"] = "Вниз"
TSM.L["Drag in Additional Items (%d/%d Items)"] = "Предметы: %d / %d"
TSM.L["Drag Item(s) Into Box"] = "Перетащите предметы сюда"
TSM.L["Duplicate"] = "Скопировать"
TSM.L["Duplicate Profile Confirmation"] = "Подтвердите копирование данных"
TSM.L["Dust"] = "Пыль"
TSM.L["Elevate your gold-making!"] = "Прокачай свои доходы!"
TSM.L["Embed TSM tooltips"] = "Встроить TSM в стандартную подсказку"
TSM.L["EMPTY BAGS"] = "ПУСТЫЕ СУМКИ"
TSM.L["Empty parentheses are not allowed"] = "Не допускаются пустые скобки"
TSM.L["Empty price string."] = "Пустая строка цены"
TSM.L["Enable automatic stack combination"] = "Включить автоматическое создание стака"
TSM.L["Enable buying?"] = "Включить покупки?"
TSM.L["Enable inbox chat messages"] = "Уведомлять о входящих в чате"
TSM.L["Enable restock?"] = "Включить пополнение запасов?"
TSM.L["Enable selling?"] = "Включить продажи?"
TSM.L["Enable sending chat messages"] = "Включить сообщения в чат об исходящих"
TSM.L["Enable smart crafting for quests"] = "Включить умный крафт для заданий"
TSM.L["Enable TSM Tooltips"] = "Показывать подсказки TSM"
TSM.L["Enable tweet enhancement"] = "Включить поддержку твитов"
TSM.L["Enchant Vellum"] = "Материал для свитка наложения чар"
TSM.L["Enter a name for the new profile"] = "Введите имя нового профиля"
TSM.L["Enter Filter"] = "Строка поиска"
TSM.L["Enter Keyword"] = "Поиск"
TSM.L["Enter name of logged-in character from other account"] = "Введите имя персонажа от другого аккаунта"
TSM.L["Enter player name"] = "Введите имя игрока"
TSM.L["Essences"] = "Эссенции"
TSM.L["Establishing connection to %s. Make sure that you've entered this character's name on the other account."] = "Установка соединения с %s. Убедитесь, что вы ввели имя этого персонажа на другой учётной записи."
TSM.L["Estimated Cost:"] = "Примерная стоимость:"
TSM.L["Estimated Profit:"] = "Планируемая прибыль:"
TSM.L["Exact Match Only?"] = "Только точное соответствие?"
TSM.L["Exclude crafts with cooldowns"] = "Исключить крафты с кулдауном"
TSM.L["Expenses"] = "Расходы"
TSM.L["EXPENSES"] = "РАСХОДЫ"
TSM.L["Expired"] = "Истёк"
TSM.L["Expired Since Last Sale"] = "Истёкший с момента последней продажи"
TSM.L["Expires"] = "Истёкшие"
TSM.L["EXPIRES"] = "Истёкшие"
TSM.L["Exploration"] = "Исследование"
TSM.L["Export"] = "Экспорт"
TSM.L["Export List"] = "Экспорт"
TSM.L["Failed Auctions"] = "Неудавшиеся"
TSM.L["Failed Since Last Sale (Expired/Cancelled)"] = "Последние неудачные продажи (Истёкшие/Отмененные)"
TSM.L["Failed to bid on auction of %s."] = "Не удалось сделать ставку на %s."
TSM.L["Failed to buy auction of %s."] = "Не удалось купить лот %s."
TSM.L["Failed to find auction for %s, so removing it from the results."] = "Не удалось найти лот %s, поэтому он исключен из результатов."
TSM.L["Favorite Scans"] = "Избранные сканирования"
TSM.L["Favorite Searches"] = "Избранные запросы"
TSM.L["Filter Auctions by Duration"] = "Фильтр по длительности"
TSM.L["Filter Auctions by Keyword"] = "Фильтр по ключевым словам"
TSM.L["FILTER BY KEYWORD"] = "Поиск по ключевым словам"
TSM.L["Filter by Keyword"] = "Поиск по ключевым словам"
TSM.L["Filter group item lists based on the following price source"] = "Фильтровать списки групп предметов на основе следующего источника цен"
TSM.L["Filter Items"] = "Поиск по предметам"
TSM.L["Filter Shopping"] = "Поиск на аукционе"
TSM.L["Finding Selected Auction"] = "Поиск выбранного лота"
TSM.L["Fishing Reel In"] = "Звук рыболовной катушки"
TSM.L["Forget Character"] = "Забыть персонажа"
TSM.L["Found auction sound"] = "Звук найденного лота"
TSM.L["Friends"] = "Друзья"
TSM.L["From"] = "От"
TSM.L["Full"] = "Полный"
TSM.L["Garrison"] = "Гарнизон"
TSM.L["Gathering"] = "Сбор"
TSM.L["Gathering Search"] = "Поиск"
TSM.L["General Options"] = "Основные настройки"
TSM.L["Get from Bank"] = "Забрать из банка"
TSM.L["Get from Guild Bank"] = "Забрать из банка гильдии"
TSM.L["Global Data Tooltips"] = "Мировые данные"
TSM.L["Global Historical Price"] = "Историческая цена по миру"
TSM.L["Global Market Value Avg"] = "Ср. рыночная стоимость по миру"
TSM.L["Global Min Buyout Avg"] = "Ср. минимальная цена по миру"
TSM.L["Global Operation Confirmation"] = "Сделать операции глобальными?"
TSM.L["Global Sale Avg"] = "Ср. цена продажи по миру"
TSM.L["Gold"] = "Золото"
TSM.L["Gold Earned:"] = "Золота получено:"
TSM.L["GOLD ON HAND"] = "ЗОЛОТО ПЕРСОНАЖА"
TSM.L["Gold Spent:"] = "Золота потрачено:"
TSM.L["GREAT DEALS SEARCH"] = "Поиск выгодных предложений"
TSM.L["Group already exists."] = "Группа уже существует."
TSM.L["Group Management"] = "Менеджер групп"
TSM.L["Group Operations"] = "Операции группы"
TSM.L["Group Settings"] = "Настройки группы"
TSM.L["Grouped Items"] = "Предметы в группе"
TSM.L["Groups"] = "Группы"
TSM.L["Guild"] = "Гильдия"
TSM.L["Guild Bank"] = "Банк гильдии"
TSM.L["GUILDS"] = "ГИЛЬДИИ"
TSM.L["GVault"] = "Гильдбанк"
TSM.L["Have"] = "Есть"
TSM.L["Have Materials"] = "Есть материалы"
TSM.L["Have Skill Up"] = "Повышают уровень"
TSM.L["Help & Info"] = "Помощь"
TSM.L["Hide auctions with bids"] = "Скрыть лоты со ставками"
TSM.L["Hide Description"] = "Скрыть описание"
TSM.L["Hide minimap icon"] = "Скрыть значок на миникарте"
TSM.L["Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."] = "Скрыть TSM Banking UI. Напишите /tsm bankui в чат, чтобы открыть снова."
TSM.L["Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."] = "Скрыть TSM Task List UI. Напишите /tsm tasklist в чат, чтобы открыть снова."
TSM.L["High Bidder"] = "Покупатель"
TSM.L["Historical Price"] = "Историческая цена"
TSM.L["Hold ALT to repair from the guild bank."] = "Удерживайте ALT для починки за счёт гильдии"
TSM.L["Hr"] = "Час"
TSM.L["Hrs"] = "Часов"
TSM.L["I just bought [%s]x%d for %s! %s #TSM4 #warcraft"] = "Я только что купил [%s]x%d за %s! %s #TSM4 #warcraft"
TSM.L["I just sold [%s] for %s! %s #TSM4 #warcraft"] = "Я только что продал [%s] за %s! %s #TSM4 #warcraft"
TSM.L["If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."] = "Не хотите сбивать цены других игроков? Вы можете добавить их в белый список и TSM не будет сбивать их цены. Помните: если кто-то из списка выставит лот с вашей ценой выкупа, но меньшей ставкой, TSM всё равно будет сбивать цену такого лота."
TSM.L["If you have multiple profile set up with operations, enabling this will cause all but the current profile's operations to be irreversibly lost. Are you sure you want to continue?"] = "Включив эту функцию, вы удалите операции всех своих профилей кроме текущего. С этого момента операции будут одинаковы для всех профилей. Уверены что хотите продолжить?"
TSM.L["If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."] = "Если у вас установлена интеграция WoW с Twitter, TSM добавит к публикации дополнение в сообщения о продаже / покупке, а также заменит URL-адреса ссылкой TSM."
TSM.L["Ignore Auctions Below Min"] = "Игнорировать аукционы ниже минимума"
TSM.L["Ignore auctions by duration?"] = "Игнорировать по длительности?"
TSM.L["Ignore Characters"] = "Игнорировать персонажей"
TSM.L["Ignore duplicate operations?"] = "Игнорировать дубли операций?"
TSM.L["Ignore Guilds"] = "Игнорировать гильдии"
TSM.L["Ignore operation on characters:"] = "Игнор. операцию на персонажах:"
TSM.L["Ignore operation on faction-realms:"] = "Игнор. для фракции/сервера:"
TSM.L["Ignore random enchants?"] = "Игнор. случайных чар"
TSM.L["Ignored Cooldowns"] = "Игнорировать кулдауны"
TSM.L["Ignored Items"] = "Игнорируемые предметы"
TSM.L["ilvl"] = "ilvl"
TSM.L["Import"] = "Импорт"
TSM.L["IMPORT"] = "Импорт"
TSM.L["Import %d Items and %s Operations?"] = "Импортировать предметы: %d, операции: %s."
TSM.L["Import Groups & Operations"] = "Импорт групп и операций"
TSM.L["Imported Items"] = "Импортированные предметы"
TSM.L["Imported Operations"] = "Импортированные операции"
TSM.L["Inbox Settings"] = "Настройки входящих"
TSM.L["Include Attached Operations"] = "Экспорт вместе со связанными операциями"
TSM.L["Include operations?"] = "Включить операции?"
TSM.L["Include soulbound items"] = "Включить связанные предметы"
TSM.L["Information"] = "Информация"
TSM.L["Invalid custom price entered."] = "Введена неверная индивидуальная цена."
TSM.L["Invalid custom price source for %s. %s"] = "Неверный источник индивидуальной цены для %s. %s"
TSM.L["Invalid custom price."] = "Недопустимая индивидуальная цена."
TSM.L["Invalid function."] = "Недопустимая функция."
TSM.L["Invalid group name."] = "Неверное название группы."
TSM.L["Invalid item link."] = "Недопустимая ссылка на предмет."
TSM.L["Invalid operation name."] = "Неверное название операции."
TSM.L["Invalid operator at end of custom price."] = "Некорректный оператор в конце индивидуальной цены."
TSM.L["Invalid parameter to price source."] = "Некорректный параметр в источнике цены."
TSM.L["Invalid player name."] = "Неверное имя игрока."
TSM.L["Invalid price source in convert."] = "Недопустимая цена источника при преобразовании."
TSM.L["Invalid price source."] = "Неверный источник цены."
TSM.L["Invalid seller data returned by server."] = "Сервер вернул неверные данные о продавце."
TSM.L["Invalid word: '%s'"] = "Недопустимое слово: '%s'"
TSM.L["Inventory"] = "Инвентарь"
TSM.L["Inventory / Mailing"] = "Инвентарь/Почта"
TSM.L["Inventory Options"] = "Настройки инвентаря"
TSM.L["Inventory Tooltip Format"] = "Формат инвентаря в подсказке"
TSM.L["It appears that you've manually copied your saved variables between accounts which will cause TSM's automatic sync'ing to not work. You'll need to undo this, and/or delete the TradeSkillMaster and TSM_Crafting saved variables files on both accounts (with WoW closed) in order to fix this."] = "Это сообщение появляется в случае, если вы вручную скопировали свои данные между аккаунтами, что привело к сбою автоматической синхронизации TSM. Откатите изменения и/или удалите сохранённые данные TradeSkillMaster и TSM_Crafting на обоих аккаунтах (выполнять при выключенной игре)."
TSM.L["Item"] = "Предмет"
TSM.L["ITEM CLASS"] = "Категория предметов"
TSM.L["Item Level"] = "Уровень предмета"
TSM.L["ITEM LEVEL RANGE"] = "Диапазон уровней предметов"
TSM.L["Item links may only be used as parameters to price sources."] = "Ссылка на предмет может быть использована только как параметр для цены источника."
TSM.L["Item Name"] = "Название предмета"
TSM.L["Item Quality"] = "Качество предмета"
TSM.L["ITEM SEARCH"] = "Поиск предмета"
TSM.L["ITEM SUBCLASS"] = "Подкатегория предметов"
TSM.L["Item Value"] = "Цена предмета"
TSM.L["Item/Group is invalid (see chat)."] = "Предмет/Группа не верна (см. чат)."
TSM.L["ITEMS"] = "Предметы"
TSM.L["Items"] = "Предметы"
TSM.L["Items in Bags"] = "Предметы в сумках"
TSM.L["Keep in bags quantity:"] = "Оставлять в сумках:"
TSM.L["Keep in bank quantity:"] = "Оставлять в банке:"
TSM.L["Keep posted:"] = "Оставить выставленным:"
TSM.L["Keep quantity:"] = "Сколько оставлять:"
TSM.L["Keep this amount in bags:"] = "Оставить в сумках:"
TSM.L["Keep this amount:"] = "Сколько оставлять:"
TSM.L["Keeping %d."] = "Оставляем %d."
TSM.L["Keeping undercut auctions posted."] = "Оставляем перебитые лоты."
TSM.L["Last 14 Days"] = "Последние 14 дней"
TSM.L["Last 3 Days"] = "Последние 3 дня"
TSM.L["Last 30 Days"] = "Последние 30 дней"
TSM.L["LAST 30 DAYS"] = "ПОСЛЕДНИЕ 30 ДНЕЙ"
TSM.L["Last 60 Days"] = "Последние 60 дней"
TSM.L["Last 7 Days"] = "Последние 7 дней"
TSM.L["LAST 7 DAYS"] = "ПОСЛЕДНИЕ 7 ДНЕЙ"
TSM.L["Last Data Update:"] = "Обновление данных:"
TSM.L["Last Purchased"] = "Последняя покупка"
TSM.L["Last Sold"] = "Последняя продажа"
TSM.L["Level Up"] = "Новый уровень"
TSM.L["LIMIT"] = "ЛИМИТ"
TSM.L["Link to Another Operation"] = "Ссылка на другую операцию"
TSM.L["List"] = "Список"
TSM.L["List materials in tooltip"] = "Показать список материалов"
TSM.L["Loading Mails..."] = "Загрузка почты..."
TSM.L["Loading..."] = "Загрузка..."
TSM.L["Looks like TradeSkillMaster has encountered an error. Please help the author fix this error by following the instructions shown."] = "Кажется, в TradeSkillMaster произошла ошибка. Пожалуйста, помогите автору проекта её исправить. Следуйте инструкциям ниже."
TSM.L["Loop detected in the following custom price:"] = "В индивидуальной цене обнаружен цикл:"
TSM.L["Lowest auction by whitelisted player."] = "Наименьший лот у игрока из белого списка."
TSM.L["Macro created and scroll wheel bound!"] = "Макрос создан и привязан к колесу мыши!"
TSM.L["Macro Setup"] = "Настройки макросов"
TSM.L["Mail"] = "Почта"
TSM.L["Mail Disenchantables"] = "Отправка распыляемых предметов"
TSM.L["Mail Disenchantables Max Quality"] = "Макс. качество распыляемых предметов для отправки"
TSM.L["MAIL SELECTED GROUPS"] = "Отправить выбранные группы"
TSM.L["Mail to %s"] = "Письмо %s"
TSM.L["Mailing"] = "Отправка"
TSM.L["Mailing all to %s."] = "Отправка всего %s."
TSM.L["Mailing Options"] = "Настройки почты"
TSM.L["Mailing up to %d to %s."] = "Отправка от %d до %s."
TSM.L["Main Settings"] = "Настройки"
TSM.L["Make Cash On Delivery?"] = "Наложенный платёж"
TSM.L["Management Options"] = "Дополнительные настройки"
TSM.L["Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."] = "Многие часто используемые действия в TSM можно привязать к прокрутке колеса мыши с помощью макросов. Используйте настройки ниже, чтобы экономить время."
TSM.L["Map Ping"] = "Звук пингования по карте"
TSM.L["Market Value"] = "Рыночная стоимость "
TSM.L["Market Value Price Source"] = "Источник «рыночной стоимости»"
TSM.L["Market Value Source"] = "Источник «рыночной стоимости»"
TSM.L["Mat Cost"] = "Цена мат."
TSM.L["Mat Price"] = "Цена мат."
TSM.L["Match stack size?"] = "Точное совпадение размера стака"
TSM.L["Match whitelisted players"] = "Использовать белый список игроков"
TSM.L["Material Name"] = "Название материала"
TSM.L["Materials"] = "Материалы"
TSM.L["Materials to Gather"] = "Материалы для сбора"
TSM.L["Max Destroy Value"] = "Макс. стоимость уничтожения"
TSM.L["MAX EXPIRES TO BANK"] = "Макс. истёкшие в банк"
TSM.L["Max Market Value"] = "Макс. рыночная стоимость"
TSM.L["Max Shopping Price"] = "Макс. закупочная цена"
TSM.L["Maximum amount already posted."] = "Макс. количество уже выставлено."
TSM.L["Maximum Auction Price (Per Item)"] = "Максимальная цена лота (за шт)"
TSM.L["Maximum Destroy Value (Enter '0c' to disable)"] = "Макс. стоимость уничтожения (введите \"0c\" для отключения)"
TSM.L["Maximum disenchant level:"] = "Макс. уровень для распыления:"
TSM.L["Maximum Disenchant Quality"] = "Макс. качество для распыления"
TSM.L["Maximum disenchant search percentage:"] = "Макс. процент поиска для распыления:"
TSM.L["Maximum Market Value (Enter '0c' to disable)"] = "Макс. рыночная стоимость (Впишите '0с' что бы отключить)"
TSM.L["MAXIMUM QUANTITY TO BUY:"] = "Максимальное количество для покупки:"
TSM.L["Maximum quantity:"] = "Максимальное количество:"
TSM.L["Maximum restock quantity:"] = "Макс. пополнение запасов:"
TSM.L["Mill Value"] = "Стоимость измельчения"
TSM.L["Min"] = "Мин"
TSM.L["Min Buyout"] = "Минимальная цена"
TSM.L["Min/Normal/Max Prices"] = "Мин./Норм./Макс. цена"
TSM.L["Minimum Days Old"] = "Минимум дней"
TSM.L["Minimum disenchant level:"] = "Мин. уровень для распыления:"
TSM.L["Minimum expires:"] = "Минимальный срок действия:"
TSM.L["Minimum profit:"] = "Минимальная прибыль:"
TSM.L["MINIMUM RARITY"] = "Минимальное качество"
TSM.L["Minimum restock quantity:"] = "Мин. пополнение запасов:"
TSM.L["Misplaced comma"] = "Запятая не в том месте"
TSM.L["Missing Materials"] = "Не хватает материалов"
TSM.L["MM/DD/YY HH:MM"] = "ММ/ДД/ГГ ЧЧ:ММ"
TSM.L["Modifiers:"] = "Модификаторы:"
TSM.L["Money Frame Open"] = "Открытие фрейма с монетами"
TSM.L["Money Transfer"] = [=[Перевод денег
]=]
TSM.L["Most Profitable Item:"] = "Самый выгодный предмет:"
TSM.L["MOVE"] = "Переместить"
TSM.L["Move already grouped items?"] = "Переместить уже сгруппированное?"
TSM.L["Move Quantity Settings"] = "Настройки перемещения"
TSM.L["MOVE TO BAGS"] = "Положить в сумки"
TSM.L["MOVE TO BANK"] = "Положить в банк"
TSM.L["MOVING"] = "Перемещение"
TSM.L["Moving"] = "Перемещение"
TSM.L["Multiple Items"] = "Разные предметы"
TSM.L["My Auctions"] = "Мои лоты"
TSM.L["My Auctions 'CANCEL' Button"] = "Кнопка «Отмена» моих лотов"
TSM.L["Neat Stacks only?"] = "Только полные стаки?"
TSM.L["NEED MATS"] = "Нужны мат."
TSM.L["New Group"] = "Новая группа"
TSM.L["New Operation"] = "Новая операция"
TSM.L["NEWS AND INFORMATION"] = "Новости и информация"
TSM.L["No Attachments"] = "Нет вложений"
TSM.L["No Data"] = "Нет данных"
TSM.L["No group selected"] = "Выберите группу"
TSM.L["No item specified. Usage: /tsm restock_help [ITEM_LINK]"] = "Не указан предмет. Введите: /tsm restock_help [ITEM_LINK]"
TSM.L["NO ITEMS"] = "Нет предметов"
TSM.L["No Materials to Gather"] = "Список сбора материалов пуст"
TSM.L["No Operation Selected"] = "Выберите операцию"
TSM.L["No posting."] = "Нет лотов на аукционе"
TSM.L["No Profession Opened"] = "Профессия не открыта"
TSM.L["No Profession Selected"] = "Выберите профессию"
TSM.L["No profile specified. Possible profiles: '%s'"] = "Не выбран профиль. Возможные профили: '%s'"
TSM.L["No recent AuctionDB scan data found."] = "Нет последних данных сканирования AuctionDB."
TSM.L["No Sound"] = "Без звука"
TSM.L["None"] = "Нет"
TSM.L["None (Always Show)"] = "Нет (всегда отображать)"
TSM.L["None Selected"] = "Ничего не выбрано"
TSM.L["NONGROUP TO BANK"] = "Без группы в банк"
TSM.L["Normal"] = "Обычный"
TSM.L["Not canceling auction at reset price."] = "Не отменять лот для сброса цены."
TSM.L["Not canceling auction below min price."] = "Не отменять лот ниже минимальной цены."
TSM.L["Not canceling."] = "Не отменяется."
TSM.L["Not enough items in bags."] = "Не хватает предметов в сумках."
TSM.L["NOT OPEN"] = "Не открыто"
TSM.L["Not Scanned"] = "Не сканировано"
TSM.L["NPC"] = "НПС"
TSM.L["Number Owned"] = "Имеется"
TSM.L["of"] = "по"
TSM.L["Offline"] = "Оффлайн"
TSM.L["Old TSM addons detected. TSM has disabled them and requires a reload."] = "TSM нашёл и отключил свои старые аддоны. Требуется перезагрузка."
TSM.L["On Cooldown"] = "Восстанавливается"
TSM.L["Only show craftable"] = "Есть материалы"
TSM.L["Only show items with disenchant value above custom price"] = "Показывать предметы только где стоимость распыления выше индивидуальной цены"
TSM.L["OPEN"] = "Открыть"
TSM.L["Open all bags when auctioning"] = "Открывать все сумки при торговле на аукционе"
TSM.L["OPEN ALL MAIL"] = "Открыть все письма"
TSM.L["Open Mail"] = "Открыть письмо"
TSM.L["Open Mail Complete Sound"] = "Звук после открытия всех писем"
TSM.L["Open Task List"] = "Открыть список задач"
TSM.L["Operation"] = "Операция"
TSM.L["Operations"] = "Операции"
TSM.L["Other Character"] = "Другой персонаж"
TSM.L["Other Settings"] = "Другие настройки"
TSM.L["Other Shopping Searches"] = "Другие варианты поиска"
TSM.L["Override default craft value method?"] = "Свой метод расчёта стоимости:"
TSM.L["Override parent operations"] = "Отменить родительские операции"
TSM.L["Parent Items"] = "Предметы родительской группы"
TSM.L["Past 7 Days"] = "За последние 7 дней"
TSM.L["Past Day"] = "За последний день"
TSM.L["Past Month"] = "За последний месяц"
TSM.L["Past Year"] = "За последний год"
TSM.L["Paste string here"] = "Вставьте «строку импорта» сюда"
TSM.L["Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."] = "Вставьте «строку импорта» в поле и нажмите «Импорт». Предметы в строке разделяются запятой. Вы можете импортировать целые структуры групп и операций."
TSM.L["Per Item"] = "За шт"
TSM.L["Per Stack"] = "За стак"
TSM.L["Per Unit"] = "За единицу"
TSM.L["Player Gold"] = "Золото игрока"
TSM.L["Player Invite Accept"] = "Игрок принял приглашение"
TSM.L["Please select a group to export"] = "Выберите группу для экспорта"
TSM.L["POST"] = "Выставить"
TSM.L["Post at Maximum Price"] = "Выставить по максимальной цене"
TSM.L["Post at Minimum Price"] = "Выставить по минимальной цене"
TSM.L["Post at Normal Price"] = "Выставить по норм. цене"
TSM.L["POST CAP TO BAGS"] = "Заполнить сумки"
TSM.L["Post Scan"] = "Скан. для продажи"
TSM.L["POST SELECTED"] = "Выставить выбранное"
TSM.L["POSTAGE"] = "Почтовый сбор"
TSM.L["Postage"] = "Почтовый сбор"
TSM.L["Posted at whitelisted player's price."] = "Выставить по цене игрока из белого списка."
TSM.L["Posted Auctions %s:"] = "Активные лоты %s:"
TSM.L["Posting"] = "Продажа"
TSM.L["Posting %d / %d"] = "Выставить %d / %d"
TSM.L["Posting %d stack(s) of %d for %d hours."] = "Выставить стаки: %d по %d на %d ч."
TSM.L["Posting at normal price."] = "Выставить по нормальной цене."
TSM.L["Posting at whitelisted player's price."] = "Выставить по цене игрока из белого списка."
TSM.L["Posting at your current price."] = "Выставить по текущей цене."
TSM.L["Posting disabled."] = "Выставление отключено."
TSM.L["Posting Settings"] = "Параметры продажи"
TSM.L["Potential"] = "Потенциал"
TSM.L["Price Settings"] = "Настройки цены"
TSM.L["PRICE SOURCE"] = "ИСТОЧНИК ЦЕН"
TSM.L["Price source with name '%s' already exists."] = "Источник цены с названием \"%s\" уже существует."
TSM.L["Price Variables"] = "Переменная цены"
TSM.L["Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."] = "Переменные позволяют создавать продвинутые индивидуальные цены. Вы сможете использовать эти переменные так же, как и встроенные источники цен, такие как «vendorsell» и «vendorbuy»."
TSM.L["PROFESSION"] = "ПРОФЕССИЯ"
TSM.L["Profession Filters"] = "Фильтр рецептов"
TSM.L["Profession loading..."] = "Профессия загружается..."
TSM.L["Professions Used In"] = "Используется в профессиях"
TSM.L["Profile changed to '%s'."] = "Профиль изменён на '%s'."
TSM.L["Profiles"] = "Профили"
TSM.L["Profit"] = "Прибыль"
TSM.L["PROFIT"] = "ПРИБЫЛЬ"
TSM.L["Profit Deduction"] = "Вычет прибыли"
TSM.L["Profit, Craftable Quantity"] = "Прибыль, Количество крафта"
TSM.L["Prospect Value"] = "Стоимость просеивания"
TSM.L["PURCHASE DATA"] = "Данные о покупке"
TSM.L["Purchased (Min/Avg/Max Price)"] = "Куплено (Мин./Ср./Макс. цена)"
TSM.L["Purchased (Total Price)"] = "Куплено (Общая цена)"
TSM.L["Purchases"] = "Покупки"
TSM.L["Qty"] = "Кол."
TSM.L["Quantity Bought:"] = "Сколько куплено:"
TSM.L["Quantity Sold:"] = "Сколько продано:"
TSM.L["Quantity to move:"] = "Кол-во перемещаемого:"
TSM.L["Quest Added"] = "Добавлено задание"
TSM.L["Quest Completed"] = "Задание выполнено"
TSM.L["Quest Objectives Complete"] = "Цели задания выполнены"
TSM.L["QUEUE"] = "В очередь"
TSM.L["Queue Sorting Method"] = "Метод сортировки очереди"
TSM.L["Quick Sell"] = "Быстрая продажа"
TSM.L["Quick Sell Options"] = "Настройки быстрой продажи"
TSM.L["Quickly mail all excess disenchantable items to a character"] = "Быстрая отправка лишних предметов, которые можно распылить"
TSM.L["Quickly mail all excess gold (limited to a certain amount) to a character"] = "Быстрая отправка лишнего золота сверх указанного в поле лимита"
TSM.L["Raid Warning"] = "Предупреждение рейда"
TSM.L["Read More"] = "Подробнее"
TSM.L["Ready Check"] = "Проверка готовности"
TSM.L["Ready to Cancel"] = "Готово для отмены"
TSM.L["Reagent Bank"] = "Банк материалов"
TSM.L["Realm Data Tooltips"] = "Данные сервера"
TSM.L["Recent Scans"] = "Недавние сканирования"
TSM.L["Recent Searches"] = "Последние поисковые запросы"
TSM.L["Recently Mailed"] = "Последние получ."
TSM.L["RECIPIENT"] = "ПОЛУЧАТЕЛЬ"
TSM.L["Region Avg Daily Sold"] = "Ежедневно покупают по региону"
TSM.L["Region Data Tooltips"] = "Данные региона"
TSM.L["Region Historical Price"] = "Историческая цена по региону"
TSM.L["Region Market Value Avg"] = "Ср. рыночная стоимость по региону"
TSM.L["Region Min Buyout Avg"] = "Ср. минимальная цена по региону"
TSM.L["Region Sale Avg"] = "Ср. цена продажи по региону"
TSM.L["Region Sale Rate"] = "Шанс продажи по региону"
TSM.L["Reload"] = "Перезагрузить"
TSM.L["REMOVE %d ITEMS"] = "Удалить предметы: %d"
TSM.L["Removed a total of %s old records."] = "Удалено старых записей: %s "
TSM.L["REPAIR"] = "Ремонт"
TSM.L["Repair Bill"] = "Счёт за ремонт"
TSM.L["Replace"] = "Заменить"
TSM.L["REPLY"] = "Повтор"
TSM.L["REPORT SPAM"] = "Жалоба на спам"
TSM.L["Repost Higher Threshold"] = "Порог для выставления дороже:"
TSM.L["Required Level"] = "Требуемый уровень"
TSM.L["REQUIRED LEVEL RANGE"] = "Диапазон требуемых уровней"
TSM.L["Requires TSM Desktop Application"] = "Требуется TSM Desktop Application"
TSM.L["Resale"] = "Перепродажа"
TSM.L["RESCAN"] = "Пересканировать"
TSM.L["RESET"] = "Сброс"
TSM.L["Reset All"] = "Сбросить всё"
TSM.L["Reset Filters"] = "Сбросить"
TSM.L["Reset Profile Confirmation"] = "Сбросить подтверждение профиля"
TSM.L["RESTART"] = "Перезапуск"
TSM.L["Restart Delay (minutes)"] = "Время перезагрузки (в минутах)"
TSM.L["RESTOCK BAGS"] = "Пополнить сумки"
TSM.L["Restock help for %s:"] = "Помощь в пополнении запасов %s:"
TSM.L["Restock Quantity Settings"] = "Настройки пополнения запасов"
TSM.L["Restock quantity:"] = "Пополнение запасов:"
TSM.L["RESTOCK SELECTED GROUPS"] = "Пополнить запасы предметов из выбранных групп"
TSM.L["Restock Settings"] = "Настройки пополнения запасов"
TSM.L["Restock target to max quantity?"] = "Пополнить до макс. количества?"
TSM.L["Restocking to %d."] = "Пополнить до %d."
TSM.L["Restocking to a max of %d (min of %d) with a min profit."] = "Пополнить до макс. из %d (мин. %d) с мин. прибылью."
TSM.L["Restocking to a max of %d (min of %d) with no min profit."] = "Пополнить до макс. из %d (мин. %d) без мин. прибыли."
TSM.L["RESTORE BAGS"] = "Заполнить сумки"
TSM.L["Resume Scan"] = "Продолжить скан."
TSM.L["Retrying %d auction(s) which failed."] = "Снова пробуем выставить лот %d."
TSM.L["Revenue"] = "Доходы"
TSM.L["Round normal price"] = "Округление нормальной цены"
TSM.L["RUN ADVANCED ITEM SEARCH"] = "Запустить расширенный поиск"
TSM.L["Run Bid Sniper"] = "«Снайпер» по ставкам"
TSM.L["Run Buyout Sniper"] = "«Снайпер» на выкуп"
TSM.L["RUN CANCEL SCAN"] = "Сканировать на отмену"
TSM.L["RUN POST SCAN"] = "Сканировать для продажи"
TSM.L["RUN SHOPPING SCAN"] = "Сканировать для покупки"
TSM.L["Running Sniper Scan"] = "Запущено сканирование «Снайпер»"
TSM.L["Sale"] = "Продажа"
TSM.L["SALE DATA"] = "Данные о продаже"
TSM.L["Sale Rate"] = "Шанс продажи"
TSM.L["Sales"] = "Продажи"
TSM.L["SALES"] = "Продажи"
TSM.L["Sales Summary"] = "Сводка продаж"
TSM.L["SCAN ALL"] = "Сканировать все"
TSM.L["Scan Complete Sound"] = "Звук окончания сканирования"
TSM.L["Scan Paused"] = "Сканирование на паузе"
TSM.L["SCANNING"] = "Сканирование"
TSM.L["Scanning %d / %d (Page %d / %d)"] = "Сканирование %d / %d (Страница %d / %d)"
TSM.L["Scroll wheel direction:"] = "Направление колеса мыши:"
TSM.L["Search"] = "Поиск"
TSM.L["Search Bags"] = "Искать в сумках"
TSM.L["Search for Item"] = "Поиск предмета"
TSM.L["Search Groups"] = "Поиск группы"
TSM.L["Search Inbox"] = "Поиск в почте"
TSM.L["Search Operations"] = "Поиск операции"
TSM.L["Search Patterns"] = "Поиск по рецептам"
TSM.L["Search Usable Items Only?"] = "Искать только используемые предметы?"
TSM.L["Search Vendor"] = "Поиск у торговца"
TSM.L["Select a Source"] = "Выберите источник"
TSM.L["Select Action"] = "Выберите действие"
TSM.L["Select All Groups"] = "Выбрать все группы"
TSM.L["Select All Items"] = "Выбрать всё"
TSM.L["Select Auction to Cancel"] = "Выберите лот для отмены"
TSM.L["Select crafter"] = "Выберите крафтера"
TSM.L["Select custom price sources to include in item tooltips"] = "Выберите источник пользовательской цены для показа в подсказке"
TSM.L["Select Duration"] = "Выбрать длительность"
TSM.L["Select Items to Add"] = "Выберите предметы для добавления"
TSM.L["Select Items to Remove"] = "Выберите предметы для удаления"
TSM.L["Select Operation"] = "Выбрать операцию"
TSM.L["Select professions"] = "Выбрать профессии"
TSM.L["Select which accounting information to display in item tooltips."] = "Выберите, какую информацию показывать в подсказке предмета."
TSM.L["Select which auctioning information to display in item tooltips."] = "Выберите, какую информацию показывать в подсказке предмета."
TSM.L["Select which crafting information to display in item tooltips."] = "Выберите, какую информацию об изготовлении показывать в подсказке предмета."
TSM.L["Select which destroying information to display in item tooltips."] = "Выберите, какую информацию показывать в подсказке предмета."
TSM.L["Select which shopping information to display in item tooltips."] = "Выберите, какую информацию показывать в подсказке предмета."
TSM.L["Selected Groups"] = "Выбранные группы"
TSM.L["SELECTED ITEM"] = "Выбранный предмет"
TSM.L["Selected Operations"] = "Выбранные операции"
TSM.L["Sell"] = "Продать"
TSM.L["SELL ALL"] = "Продать всё"
TSM.L["SELL BOES"] = "Продать BoE"
TSM.L["SELL GROUPS"] = "Продать группы"
TSM.L["Sell Options"] = "Настройки продажи"
TSM.L["Sell soulbound items?"] = "Продавать персональные предметы"
TSM.L["Sell to Vendor"] = "Продать торговцу"
TSM.L["SELL TRASH"] = "Продать хлам"
TSM.L["Seller"] = "Продавец"
TSM.L["Selling soulbound items."] = "Продажа персональных предметов."
TSM.L["Send"] = "Отправка"
TSM.L["SEND DISENCHANTABLES"] = "Отправить распыляемое"
TSM.L["Send Excess Gold to Banker"] = "Отправка лишнего золота"
TSM.L["SEND GOLD"] = "Отправить золото"
TSM.L["Send grouped items individually"] = "Отправлять сгруппированные предметы поштучно"
TSM.L["SEND MAIL"] = "Отправить"
TSM.L["Send Money"] = "Отправить деньги"
TSM.L["SENDING"] = "Отправка"
TSM.L["Sending %s individually to %s"] = "Отправка %s поштучно для %s"
TSM.L["Sending %s to %s"] = "Отправка %s для %s"
TSM.L["Sending %s to %s with a COD of %s"] = "Отправка %s для %s с наложенным платежом %s"
TSM.L["Sending Settings"] = "Настройки отправки"
TSM.L["SENDING..."] = "Отправка..."
TSM.L["Set auction duration to:"] = "Длительность аукциона:"
TSM.L["Set bid as percentage of buyout:"] = "Ставка в процентах от цены выкупа:"
TSM.L["Set keep in bags quantity?"] = "Сколько оставить в сумках?"
TSM.L["Set keep in bank quantity?"] = "Сколько оставить в банке?"
TSM.L["Set Maximum Price:"] = "Максимальная цена:"
TSM.L["Set maximum quantity?"] = "Установить макс. количество?"
TSM.L["Set Minimum Price:"] = "Минимальная цена:"
TSM.L["Set minimum profit?"] = "Установить мин. прибыль?"
TSM.L["Set move quantity?"] = "Установить сколько перемещать?"
TSM.L["Set Normal Price:"] = "Укажите нормальную цену:"
TSM.L["Set post cap to:"] = "Сколько лотов выставлять:"
TSM.L["Set posted stack size to:"] = "Установить размер стака:"
TSM.L["Set stack size for bags?"] = "Установить размер стака в сумках?"
TSM.L["Setup"] = "Настройка"
TSM.L["SETUP ACCOUNT SYNC"] = "Синхронизировать аккаунт"
TSM.L["Shards"] = "Осколки"
TSM.L["Shopping"] = "Покупка"
TSM.L["Shopping 'BUYOUT' Button"] = "Кнопка «Выкупить» при покупке"
TSM.L["Shopping for auctions including those above the max price."] = "Покупка лотов с ценой, выше максимальной."
TSM.L["Shopping for auctions with a max price set."] = "Покупка лотов с максимальной ценой."
TSM.L["Shopping for even stacks including those above the max price"] = "Покупка полных стаков с ценой, выше максимальной"
TSM.L["Shopping for even stacks with a max price set."] = "Покупка полных стаков с максимальной ценой."
TSM.L["Shopping Tooltips"] = "Подсказки о покупке"
TSM.L["SHORTFALL TO BAGS"] = "Недостаточно в сумках"
TSM.L["Show auctions above max price?"] = "Показать лоты выше макс. цены?"
TSM.L["Show Description"] = "Показать описание"
TSM.L["Show Destroying frame automatically"] = "Показывать окно уничтожения автоматически"
TSM.L["Show material cost"] = "Показать стоимость материалов"
TSM.L["Show on Modifier"] = "Модификатор для показа подсказки"
TSM.L["Showing %d Mail"] = "Показано писем: %d"
TSM.L["Showing %d of %d Mail"] = "Показано писем: %d из %d"
TSM.L["Showing %d of %d Mails"] = "Показано писем: %d из %d"
TSM.L["Showing all %d Mails"] = "Показаны все письма: %d"
TSM.L["Simple"] = "Простой"
TSM.L["SKIP"] = "Пропуск"
TSM.L["Skip Import / Export confirmations?"] = "Пропустить окно подтверждения?"
TSM.L["Skipped: No assigned operation"] = "Пропущено: Нет связанной операции"
TSM.L["Slash Commands:"] = "Команды:"
TSM.L["Sniper 'BUYOUT' Button"] = "Кнопка «Выкупить» в режиме «Снайпер»"
TSM.L["Sniper Options"] = "Настройки режима «Снайпер»"
TSM.L["Sniper Settings"] = "Настройки режима «Снайпер»"
TSM.L["Sniping items below a max price"] = "Предметы «Снайпера» ниже макс. цены"
TSM.L["Sold"] = "Продан"
TSM.L["Sold %s worth of items."] = "Продано %s предметов."
TSM.L["Sold (Min/Avg/Max Price)"] = "Продано (Мин./Ср./Макс. цена)"
TSM.L["Sold (Total Price)"] = "Продано (Общая цена)"
TSM.L["Sold [%s]x%d for %s to %s"] = "Продано [%s]x%d для %s %s"
TSM.L["Sold Auctions %s:"] = "Проданные лоты %s:"
TSM.L["Source"] = "Источник"
TSM.L["SOURCE %d"] = "Источник %d"
TSM.L["SOURCES"] = "ИСТОЧНИКИ"
TSM.L["Sources"] = "Источники"
TSM.L["Sources to include for restock:"] = "Учитывать при пополнении:"
TSM.L["Stack"] = "Стак"
TSM.L["Stack / Quantity"] = "Стаков / шт. в стаке"
TSM.L["Stack size multiple:"] = "Размер стака:"
TSM.L["Start either a 'Buyout' or 'Bid' sniper using the buttons above."] = "Запустите режим «Снайпер», используя кнопки «Ставка» или «Выкуп»."
TSM.L["Starting Scan..."] = "Запуск сканирования..."
TSM.L["STOP"] = "Стоп"
TSM.L["Store operations globally"] = "Глобальные операции, общие для всех профилей"
TSM.L["Subject"] = "Тема"
TSM.L["SUBJECT"] = "ТЕМА"
TSM.L["Switch to %s"] = "Переключиться на %s"
TSM.L["Switch to WoW UI"] = "К интерфейсу WoW"
TSM.L["Sync Setup Error: The specified player on the other account is not currently online."] = "Ошибка синхронизации: Выбранный игрок на другой учетной записи в настоящий момент не в сети."
TSM.L["Sync Setup Error: This character is already part of a known account."] = "Ошибка синхронизации: Этот персонаж уже является частью известной учетной записи."
TSM.L["Sync Setup Error: You entered the name of the current character and not the character on the other account."] = "Ошибка синхронизации: Вы ввели имя текущего персонажа, а не персонажа другой учётной записи."
TSM.L["TAKE ALL"] = "Взять всё"
TSM.L["Take Attachments"] = "Прикрепить вложения"
TSM.L["Target Character"] = "Имя персонажа"
TSM.L["TARGET SHORTFALL TO BAGS"] = "Этого в сумках недостаточно"
TSM.L["Tasks Added to Task List"] = "Задача добавлена в ваш список"
TSM.L["Text (%s)"] = "Текст (%s)"
TSM.L["The canlearn filter was ignored because the CanIMogIt addon was not found."] = "Фильтр canlearn игнорировался, поскольку аддон CanIMogIt не был найден."
TSM.L["The 'Craft Value Method' (%s) did not return a value for this item."] = "Метод расчета стоимости крафта (%s) не вернул значение для этого предмета."
TSM.L["The 'disenchant' price source has been replaced by the more general 'destroy' price source. Please update your custom prices."] = "Цена 'disenchant' была заменена общим источником цен 'destroy'. Обновите свои индивидуальные цены. "
TSM.L["The min profit (%s) did not evalulate to a valid value for this item."] = "Минимальная прибыль (%s) не определена для этого предмета."
TSM.L["The name can ONLY contain letters. No spaces, numbers, or special characters."] = "Название может содержать ТОЛЬКО буквы. Без пробелов, чисел или символов."
TSM.L["The number which would be queued (%d) is less than the min restock quantity (%d)."] = "В очередь поставлено (%d) меньше мин. значения пополнения (%d)."
TSM.L["The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."] = "Операция для этого предмета не верна. Мин. запас %d больше макс. запаса %d."
TSM.L["The player \"%s\" is already on your whitelist."] = "Игрок \"%s\" уже в белом списке."
TSM.L["The profit of this item (%s) is below the min profit (%s)."] = "Прибыль от предмета (%s) это ниже мин. прибыли (%s)"
TSM.L["The seller name of the lowest auction for %s was not given by the server. Skipping this item."] = "Сервер не вернул имя продавца с самым дешёвым лотом %s. Предмет пропущен."
TSM.L["The TradeSkillMaster_AppHelper addon is not enabled and is required for proper operation of TSM. TSM has enabled it and requires a reload."] = "Аддон TSM_AppHelper выключен, но он необходим для правильной работы. TSM включил его. Требуется перезагрузка."
TSM.L["The TradeSkillMaster_AppHelper addon is not installed and is required for proper operation of TSM."] = "Аддон TSM_AppHelper не установлен, но он необходим для правильной работы TSM."
TSM.L["The unlearned filter was ignored because the CanIMogIt addon was not found."] = "Неизвестный фильтр был проигнорирован, т.к. аддон CanIMogIt не найден."
TSM.L["There is a crafting cost and crafted item value, but TSM_Crafting wasn't able to calculate a profit. This shouldn't happen!"] = "TSM Crafting не смог рассчитать прибыль из стоимости создания и цены продажи предмета. Этого не должно было случиться!"
TSM.L["There is no TSM_Crafting operation applied to this item's TSM group (%s)."] = "Операция TSM_Crafting не применима для этого предмета из группы TSM (%s)."
TSM.L["This group already has operations. Would you like to add another one or replace the last one?"] = "Эта группа уже содержит операции. Вы действительно хотите добавить новую или заменить старую?"
TSM.L["This group already has the max number of operation. Would you like to replace the last one?"] = "Эта группа содержит максимально количество операций. Вы действительно хотите заменить последнюю?"
TSM.L["This is not a valid profile name. Profile names must be at least one character long and may not contain '@' characters."] = "Некорректное имя профиля. Имя должно содержать хотя бы один символ и не содержать специальные символы."
TSM.L["This item does not have a crafting cost. Check that all of its mats have mat prices."] = "У предмета нет цены создания. Проверьте чтобы все материалы имели цену."
TSM.L["This item is not in a TSM group."] = "Этот предмет не в группе TSM."
TSM.L["This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general TSM_Crafting options."] = "Предмет должен добавляться в очередь. Если этого не происходит, создайте сообщение на форуме TSM. Приложите скриншоты: всплывающей подсказки, настроек операции и общих параметров TSM_Crafting."
TSM.L["This looks like an exported operation and not a custom price."] = "Это выглядит как экспортированная операция, а не как индивидуальная цена."
TSM.L["This will copy the settings from '%s' into your currently-active one."] = "Хотите скопировать все настройки из «%s» в текущий активный профиль?"
TSM.L["This will permanently delete the '%s' profile."] = "Хотите навсегда удалить профиль «%s»?"
TSM.L["This will reset all groups and operations (if not stored globally) to be wiped from this profile."] = "Это удалит все группы и операции (не сохраняющиеся глобально) из этого профиля."
TSM.L["Time"] = "Время"
TSM.L["Time Format"] = "Формат времени"
TSM.L["Time Frame"] = "Когда"
TSM.L["TIME FRAME"] = "КОГДА"
TSM.L["TINKER"] = "Быстрый ремонт"
TSM.L["Tooltip Price Format"] = "Формат цен в подсказке"
TSM.L["Tooltip Settings"] = "Подсказки"
TSM.L["Top Buyers:"] = "Лучший покупатель:"
TSM.L["Top Item:"] = "Лучший предмет: "
TSM.L["Top Sellers:"] = "Лучший продавец:"
TSM.L["Total"] = "Итого"
TSM.L["Total Gold"] = "Всего золота"
TSM.L["Total Gold Earned:"] = "Всего золота получено:"
TSM.L["Total Gold Spent:"] = "Всего золота потрачено:"
TSM.L["Total Price"] = "Общая цена"
TSM.L["Total Profit:"] = "Общая прибыль:"
TSM.L["Total Value"] = "Общая стоимость"
TSM.L["Total Value of All Items: "] = "Общая стоимость всех предметов:"
TSM.L["Track Sales / Purchases via trade"] = "Отслеживать продажи / покупки через торговлю"
TSM.L["TradeSkillMaster Info"] = "Информация TSM"
TSM.L["Transform Value"] = "Стоимость трансформации"
TSM.L["TSM Banking"] = "TSM Banking"
TSM.L["TSM can sync data automatically between multiple accounts."] = "TSM может автоматически синхронизировать данные между разными учётными записями."
TSM.L["TSM Crafting"] = "TSM Crafting"
TSM.L["TSM Destroying"] = "TSM Destroying"
TSM.L["TSM failed to scan some auctions. Please rerun the scan."] = "TSM не смог просканировать некоторые лоты. Запустите новое сканирование."
TSM.L["TSM Groups"] = "TSM Группы"
TSM.L["TSM is missing important information from the TSM Desktop Application. Please ensure the TSM Desktop Application is running and is properly configured."] = "В TSM отсутствует важная информация из TSM Desktop Application. Убедитесь, что эта программа запущена и правильно настроена."
TSM.L["TSM Mailing"] = "TSM Почта"
TSM.L["TSM TASK LIST"] = "TSM Список задач"
TSM.L["TSM Vendoring"] = "TSM Торговля"
TSM.L["TSM Version Info:"] = "Информация о версии TSM:"
TSM.L["TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"] = "TSM_Accounting обнаружил, что вы поменяли %s %s на %s. Хотите, чтобы Accounting сделал запись об этом обмене?"
TSM.L["TSM4"] = "TSM4"
TSM.L["TUJ 3-Day Price"] = "3-х дневная цена из TUJ"
TSM.L["Twitter Integration"] = "Интеграция с Twitter"
TSM.L["Twitter Integration Not Enabled"] = "Интеграция с Twitter не включена"
TSM.L["Type"] = "Тип"
TSM.L["Type Something"] = "Ищите по названию предметов"
TSM.L["Unbalanced parentheses."] = "Незакрытые скобки."
TSM.L["Undercut amount:"] = "Снижать цену на:"
TSM.L["Undercut by whitelisted player."] = "Перебито игроком из белого списка."
TSM.L["Undercutting blacklisted player."] = "Сбивать цену игроков из черного списка."
TSM.L["Undercutting competition."] = "Сбиваем цену конкурентов."
TSM.L["Ungrouped Items"] = "Предметы без группы"
TSM.L["Unknown Item"] = "Неизвестный предмет"
TSM.L["Unwrap Gift"] = "Развернуть подарок"
TSM.L["Up"] = "Вверх"
TSM.L["UPDATE EXISTING MACRO"] = "Обновить внешний макрос"
TSM.L["Usage: /tsm price <ItemLink> <Price String>"] = "Использование: /tsm price <Предмет> <Цена>"
TSM.L["Use smart average for purchase price"] = "Использовать умную усредненную цену для покупки"
TSM.L["Use the field below to search the auction house by filter"] = "Для поиска на аукционе используйте поле ниже"
TSM.L["Use the list to the left to select groups, & operations you'd like to create export strings for."] = "Выберите группы в списке слева и настройте экспорт операций, связанных с ними. При импорте структура групп сохранится. "
TSM.L["VALUE PRICE SOURCE"] = "Источник цены"
TSM.L["ValueSources"] = "Источники цен"
TSM.L["Variable Name"] = "Имя переменной"
TSM.L["Vendor"] = "Торговец"
TSM.L["Vendor Buy Price"] = "Покупка у торговца"
TSM.L["Vendor Search"] = "Поиск для продажи торговцу"
TSM.L["VENDOR SEARCH"] = "Поиск для продажи торговцу"
TSM.L["Vendor Sell"] = "Продажа торговцу"
TSM.L["Vendor Sell Price"] = "Продажа торговцу"
TSM.L["Vendoring 'SELL ALL' Button"] = "Кнопка «Продать всё» торговцу"
TSM.L["View ignored items in the Destroying options."] = "Показать игнорируемые предметы в настройках уничтожения."
TSM.L["Warehousing"] = "Хранение"
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Склад переместит макс. %d предметов из группы, возвращая %d предметов назад когда в сумках > банка/гбанка, %d когда в банке/гбанке > сумок."
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Склад переместит макс. %d предметов из группы, возвращая %d предметов назад когда в сумках > банка/гбанка, %d когда в банке/гбанке > сумок. Пополнение запасов оставит %d предметов в сумках."
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."] = "Склад переместит макс. %d предметов из группы, возвращая %d предметов назад когда в сумках > банка/гбанка."
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Склад переместит макс. %d предметов из группы, возвращая %d предметов назад когда в сумках > банка/гбанка. Пополнение запасов оставит %d предметов в сумках."
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."] = "Склад переместит макс. %d предметов из группы, возвращая %d предметов назад когда в банке/гбанке > сумок."
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Склад переместит макс. %d предметов из группы, возвращая %d предметов назад когда в банке/гбанке > сумок. Пополнение запасов оставит %d предметов в сумках."
TSM.L["Warehousing will move a max of %d of each item in this group."] = "Склад переместит макс. %d предметов из группы."
TSM.L["Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."] = "Склад переместит макс. %d предметов из группы. Пополнение запасов оставит %d предметов в сумках."
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Склад переместит все предметы из группы, возвращая %d предметов назад когда в сумках > банка/гбанка, %d когда в банке/гбанке > сумок."
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Склад переместит все предметы из группы, возвращая %d предметов назад когда в сумках > банка/гбанка, %d когда в банке/гбанке > сумок. Пополнение запасов оставит %d предметов в сумках."
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."] = "Склад переместит все предметы из группы, возвращая %d предметов назад когда в сумках > банка/гбанка."
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Склад переместит все предметы из группы, возвращая %d предметов назад когда в сумках > банка/гбанка. Пополнение запасов оставит %d предметов в сумках."
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."] = "Склад переместит все предметы из группы, возвращая %d предметов назад когда в банке/гбанке > сумок."
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Склад переместит все предметы из группы, возвращая %d предметов назад когда в банке/гбанке > сумок. Пополнение запасов оставит %d предметов в сумках."
TSM.L["Warehousing will move all of the items in this group."] = "Склад будет перемещать все предметы из группы."
TSM.L["Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."] = "Склад будет перемещать все предметы из группы. Пополнение запасов оставит %d в сумках."
TSM.L["WARNING: The macro was too long, so was truncated to fit by WoW."] = "ВНИМАНИЕ: Макрос был слишком длинным, поэтому он обрезан игрой."
TSM.L["WARNING: You minimum price for %s is below its vendorsell price (with AH cut taken into account). Consider raising your minimum price, or vendoring the item."] = "ВНИМАНИЕ: Ваша минимальная цена для %s ниже, чем продажа предмета торговцу (с учётом сбивания цены на аукционе). Советуем увеличить минимальную цену или продать предмет торговцу."
TSM.L["When above maximum:"] = "Когда выше максимума:"
TSM.L["When below minimum:"] = "Когда ниже минимума:"
TSM.L["Whitelist"] = "Белый список"
TSM.L["Whitelisted Players"] = "Добавление игроков в белый список"
TSM.L["You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"] = "У вас уже достаточно этих предметов. У вас есть %d, а максимально вам нужно %d"
TSM.L["You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."] = "Используйте настройки ниже для очистки старых данных. Мы рекомендуем периодически чистить данные, чтобы модуль статистики работал исправно. Выберите минимальное количество дней, которое нужно удалить, затем нажмите '%s'."
TSM.L["You cannot use %s as part of this custom price."] = "Вы не можете использовать %s как часть индивидуальной цены."
TSM.L["You cannot use %s within convert() as part of this custom price."] = "Вы не можете использовать %s без convert() как часть этой индивидуальной цены."
TSM.L["You do not need to add \"%s\", alts are whitelisted automatically."] = "Вам не нужно добавлять «%s», альты попадают в белый список автоматически."
TSM.L["You don't know how to craft this item."] = "Вы не умеете создавать этот предмет."
TSM.L["You must reload your UI for these settings to take effect. Reload now?"] = "Вы должны перезагрузить свой интерфейс, чтобы эти настройки вступили в силу. Перезагрузить сейчас?"
TSM.L["You won an auction for %sx%d for %s"] = "Вы выиграли лот %sx%d за %s"
TSM.L["Your auction has not been undercut."] = "Ваш лот не перебит."
TSM.L["Your auction of %s expired"] = "Время вашего лота %s истекло"
TSM.L["Your auction of %s has sold for %s!"] = "Ваш лот %s был продан за %s!"
TSM.L["Your Buyout"] = "Выкуп"
TSM.L["Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"] = "Ваш метод расчета стоимости крафта для '%s' не верен, поэтому был использован метод по умолчанию. Подробности: %s"
TSM.L["Your default craft value method was invalid so it has been returned to the default. Details: %s"] = "Ваш метод расчета стоимости крафта для '%s' не верен, поэтому был использован метод по умолчанию. Подробности: %s"
TSM.L["Your task list is currently empty."] = "Ваш список задач пуст."
TSM.L["You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."] = "Из-за ошибки на стороне Blizzard аукцион перестал работать. Закройте и снова откройте аукцион и перезапустите «Снайпер»."
TSM.L["You've been undercut."] = "Вашу цену сбили."
TSM.L["YY/MM/DD HH:MM"] = "ГГ/ММ/ДД ЧЧ:ММ"
	elseif locale == "zhCN" then
TSM.L = TSM.L or {}
TSM.L["%d |4Group:Groups; Selected (%d |4Item:Items;)"] = "％d | 4Group：群组; 已选择（％d | 4项目：项目;）"
TSM.L["%d auctions"] = "%d拍卖"
TSM.L["%d Groups"] = "%d分组"
TSM.L["%d Items"] = "%d物品"
TSM.L["%d of %d"] = "发布%d堆  每堆%d个"
TSM.L["%d Operations"] = "%d操作"
TSM.L["%d Posted Auctions"] = "已发布%d个拍卖"
TSM.L["%d Sold Auctions"] = "%d已卖出的拍卖"
TSM.L["%s (%s bags, %s bank, %s AH, %s mail)"] = "%s (%s 背包, %s 银行, %s 拍卖行, %s 邮件)"
TSM.L["%s (%s player, %s alts, %s guild, %s AH)"] = "%s (%s 玩家, %s 小号, %s 公会, %s 拍卖行)"
TSM.L["%s (%s profit)"] = "%s (%s 利润)"
TSM.L["%s ago"] = "%s之前"
TSM.L["%s Crafts"] = "%s制造"
TSM.L["%s in guild vault"] = "公会仓库中 %s"
TSM.L["%s is a valid custom price but %s is an invalid item."] = "%s 是一个有效的自定义价格但 %s 是一个无效的物品。"
TSM.L["%s is a valid custom price but did not give a value for %s."] = "%s 是一个有效的自定义价格但没有为 %s 给出一个值。"
TSM.L["'%s' is an invalid operation! Min restock of %d is higher than max restock of %d."] = "'%s'是一个无效的操作! 因为最小补货数量%d超过最高补货数量%d。"
TSM.L["%s is not a valid custom price and gave the following error: %s"] = "%s 不是一个有效的自定义价格,错误信息: %s"
TSM.L["%s operation(s)"] = "%s操作"
TSM.L["%s removed."] = "移除 %s 。"
TSM.L["%s sent you %s"] = "%s邮寄给你%s"
TSM.L["%s sent you %s and %s"] = "%s邮寄给你%s和%s"
TSM.L["%s sent you a COD of %s for %s"] = "%s给你发送付费邮件%s以%s的价格"
TSM.L["%s sent you a message: %s"] = "%s发送给你一条消息：%s"
TSM.L["%s total"] = "共计 %s "
TSM.L["%sDrag%s to move this button"] = [=[%s按住%s以拖动此按钮
]=]
TSM.L["%sLeft-Click%s to open the main window"] = "%s左键单击%s打开主窗口"
TSM.L["(%d/500 Characters)"] = "(%d/500个角色)"
TSM.L["(max %d)"] = "(最高 %d)"
TSM.L["(max 200)"] = "(最多200)"
TSM.L["(max 5000)"] = "(最多5000)"
TSM.L["(min %d - max %d)"] = "(最低%d - 最高%d)"
TSM.L["(min 0 - max 10000)"] = "(最低 0 - 最高 10000)"
TSM.L["(minimum 0 - maximum 2)"] = "(最少 0 - 最多 2)"
TSM.L["(minimum 0 - maximum 20)"] = "(0 - 20)"
TSM.L["(minimum 0 - maximum 2000)"] = "(0 - 2000)"
TSM.L["(minimum 0 - maximum 30)"] = "(0 - 30)"
TSM.L["(minimum 0 - maximum 905)"] = "(0 - 905)"
TSM.L["(minimum 0% - maximum 50%)"] = "(0% - 50%)"
TSM.L["(minimum 0.5 - maximum 10)"] = "(0.5 - 10)"
TSM.L["(minimum 1 - maximum 100)"] = "(1 - 100)"
TSM.L["(minimum 8 - maximum 25)"] = "(8 - 25)"
TSM.L["(New group(s) will be created)"] = "(将创建新分组)"
TSM.L["/tsm help|r - Shows this help listing"] = "/tsm help - 显示帮助列表"
TSM.L["/tsm|r - opens the main TSM window."] = "/tsm - 打开TSM主窗口。"
TSM.L["_ Hr _ Min ago"] = "_ 小时 _ 分钟前"
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."] = "|cffff0000重要通知:|r 当TSM_Accounting在本国度最后的存储数据对WOW来说太大难以处理，旧的数据将被削减以避免损坏已保存的参数。最后的 %s 购买数据已保存。"
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."] = "|cffff0000重要通知:|r 当TSM_Accounting在本国度最后的存储数据对WOW来说太大难以处理，旧的数据将被削减以避免损坏已保存的参数。最后的 %s 出售数据已保存。"
TSM.L["|cffff0000WARNING:|r TSM_AuctionDB doesn't currently have any pricing data for your realm. Either download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update TSM_AuctionDB's data, or run a manual scan in-game."] = "|cffff0000警告:|r  TSM_AuctionDB目前没有任何你所在国度的价格。请从 |cff99ffffhttp://tradeskillmaster.com|r 下载TSM桌面软件自动更新数据，或者在游戏内手动扫描。（国服不支持TSM桌面插件，请进入游戏，选择“全面扫描”。）（4.0以后游戏内扫描也取消了，国服允悲！）"
TSM.L["|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."] = [=[|cffffd839左键点击|r 临时忽略物品。
按住|cffffd839Shift|r 左键点击永久忽略物品。你可以在Vendoring设置中从永久忽略列表中移除物品。]=]
TSM.L["|cffffd839Left-Click|r to ignore an item this session."] = "|cffffd839左键点击|r临时忽略物品。"
TSM.L["|cffffd839Shift-Left-Click|r to ignore it permanently."] = "|cffffd839Shift+左键|r永久忽略物品。"
TSM.L["1 Group"] = "1 组"
TSM.L["1 Item"] = "1 项物品"
TSM.L["12 hr"] = "12 小时"
TSM.L["24 hr"] = "24 小时"
TSM.L["48 hr"] = "48 小时"
TSM.L["A custom price of %s for %s evaluates to %s."] = "%s的自定义价格为%s到%s。"
TSM.L["A maximum of 1 convert() function is allowed."] = "最多允许1兑换函数。"
TSM.L["A scan is already in progress. Please stop that scan before starting another one."] = "一项扫描正在进行中。在开始新的扫描之前请停止前一项扫描。"
TSM.L["Above max expires."] = "超过最大流拍次数。"
TSM.L["Above max price. Not posting."] = "超出最高价。不发布。"
TSM.L["Above max price. Posting at max price."] = "超出最高价。以最高价发布。"
TSM.L["Above max price. Posting at min price."] = "超出最高价。以最低价发布。"
TSM.L["Above max price. Posting at normal price."] = "超出最高价。以正常价发布。"
TSM.L["Accepting these item(s) will cost"] = "接受这些物品将花费"
TSM.L["Accepting this item will cost"] = "接受此物品将花费"
TSM.L["Account sync removed. Please delete the account sync from the other account as well."] = "帐户同步已删除, 请同时从其他帐户中删除帐户同步."
TSM.L["Account Syncing"] = "账务同步"
TSM.L["Accounting"] = "账务"
TSM.L["Accounting Tooltips"] = "账务鼠标提示"
TSM.L["Activity Type"] = "活动类型"
TSM.L["ADD %d ITEMS"] = "添加%d物品"
TSM.L["Add / Remove Items"] = "增加/移除 物品"
TSM.L["ADD NEW CUSTOM PRICE SOURCE"] = "添加新的自定义价格"
TSM.L["ADD OPERATION"] = "添加操作"
TSM.L["Add Player"] = "添加玩家"
TSM.L["Add Subject / Description"] = "添加主题/描述"
TSM.L["Add Subject / Description (Optional)"] = "添加主题/描述（可选）"
TSM.L["ADD TO MAIL"] = "添加至邮件"
TSM.L["Additional error suppressed"] = "已阻止的其他错误"
TSM.L["Adjust the settings below to set how groups attached to this operation will be auctioned."] = "调整下面的设置以应用到该操作的拍卖分组"
TSM.L["Adjust the settings below to set how groups attached to this operation will be cancelled."] = "调整下面的设置以应用到该操作的取消分组"
TSM.L["Adjust the settings below to set how groups attached to this operation will be priced."] = "调整以下设置以设置添加到此操作分组组的定价方式。"
TSM.L["Advanced Item Search"] = "高级物品搜索"
TSM.L["Advanced Options"] = "高级设置"
TSM.L["AH"] = "拍卖行"
TSM.L["AH (Crafting)"] = "拍卖行（制造业）"
TSM.L["AH (Disenchanting)"] = "拍卖行（分解）"
TSM.L["AH BUSY"] = "拍卖行繁忙"
TSM.L["AH Frame Options"] = "拍卖行框体选项"
TSM.L["AH Rows Shown (requires reload)"] = "AH 行显示(需要重载))"
TSM.L["Alarm Clock"] = "闹钟"
TSM.L["All Auctions"] = "所有拍卖"
TSM.L["All Characters and Guilds"] = "所有角色和专精"
TSM.L["All Professions"] = "所有专业"
TSM.L["Allow partial stack?"] = "允许部分堆叠"
TSM.L["Alt Guild Bank"] = "小号工会银行"
TSM.L["Alts"] = "小号"
TSM.L["Alts AH"] = "小号AH"
TSM.L["Amount"] = "数量"
TSM.L["AMOUNT"] = "数量"
TSM.L["Amount of Bag Space to Keep Free"] = "背包剩余空间"
TSM.L["Applied %s to %s."] = "应用 %s 到 %s。"
TSM.L["APPLY FILTERS"] = "应用筛选"
TSM.L["Apply operation to group:"] = "应用操作到分组："
TSM.L["Are you sure you want to clear old accounting data?"] = "确定清除旧的账务数据吗？"
TSM.L["Are you sure you want to delete this group?"] = "你确定要删除这个分组吗？"
TSM.L["Are you sure you want to delete this operation?"] = "你确定要删除这个操作吗？"
TSM.L["Are you sure you want to reset all operation settings?"] = "确定要重置操作设置吗？"
TSM.L["At above max price and not undercut."] = "高于最高价格且未被压价。"
TSM.L["At normal price and not undercut."] = "处于正常价格且未被压价。"
TSM.L["Auction"] = "拍卖"
TSM.L["AUCTION DETAILS"] = "拍卖细节"
TSM.L["Auction Duration"] = "拍卖时效"
TSM.L["Auction has been bid on."] = "已被竞标。"
TSM.L["Auction Window Close"] = "拍卖窗口关闭"
TSM.L["Auction Window Open"] = "拍卖窗口打开"
TSM.L["Auctionator - Auction Value"] = "Auctionator - 拍卖价格"
TSM.L["Auctioneer - Appraiser"] = "Auctioneer - 估价"
TSM.L["Auctioneer - Market Value"] = "Auctioneer - 市场价"
TSM.L["Auctioneer - Minimum Buyout"] = "Auctioneer - 最低一口价"
TSM.L["Auctioning"] = "拍卖"
TSM.L["Auctioning Log"] = "拍卖日志"
TSM.L["Auctioning Operation"] = "拍卖操作"
TSM.L["Auctioning 'POST'/'CANCEL' Button"] = "拍卖 '发布'/'取消' 按钮"
TSM.L["Auctions"] = "拍卖"
TSM.L["Auto Quest Complete"] = "自动完成任务"
TSM.L["Automatically sell vendor trash?"] = "自动出售垃圾"
TSM.L["Average Earned Per Day:"] = "每日平均收入："
TSM.L["Average Prices:"] = "平均价："
TSM.L["Average Profit Per Day:"] = "每日平均利润："
TSM.L["Average Spent Per Day:"] = "每日平均花费："
TSM.L["Avg Buy Price"] = "平均买入价"
TSM.L["Avg Resale Profit"] = "平均转卖利润"
TSM.L["Avg Sell Price"] = "平均卖出价"
TSM.L["BACK TO LIST"] = "返回列表"
TSM.L["Back to List"] = "返回列表"
TSM.L["Bag"] = "背包"
TSM.L["Bags"] = "背包"
TSM.L["Banks"] = "银行"
TSM.L["BankUI Move Delay"] = "银行UI移动延迟"
TSM.L["Base Group"] = "基础分组"
TSM.L["Base Item"] = "基础物品"
TSM.L["Batch size"] = "匹配大小"
TSM.L["Below are your currently available price sources organized by module. The %skey|r is what you would type into a custom price box."] = "以下是你当前通过模块获得的可购入价格。点击%s来输入你的自定义价格。"
TSM.L["Below custom price:"] = "低于自定义价格："
TSM.L["Below min price. Posting at max price."] = "低于最低价。按最高价发布。"
TSM.L["Below min price. Posting at min price."] = "低于最低价。按最低价发布。"
TSM.L["Below min price. Posting at normal price."] = "低于最低价。按正常价发布。"
TSM.L["Below, you can manage your profiles which allow you to have entirely different sets of groups."] = "以下，您可以管理您的配置文件，这些配置文件允许您拥有完全不同的分组。"
TSM.L["Bid %d / %d"] = "竞拍%d / %d"
TSM.L["Bid (item)"] = "竞拍（物品）"
TSM.L["Bid (stack)"] = "出价（堆叠）"
TSM.L["Bid Price"] = "竞拍价格"
TSM.L["Bid Sniper Paused"] = "狙击竞价暂停"
TSM.L["Bid Sniper Running"] = "运行狙击竞标"
TSM.L["Blacklisted players:"] = "黑名单玩家:"
TSM.L["Bought"] = "买入"
TSM.L["Bought %sx%d for %s from %s"] = "买入 %sx%d 为 %s 从 %s"
TSM.L["Bound Actions"] = "限制操作"
TSM.L["BUSY"] = "繁忙"
TSM.L["BUY"] = "购买"
TSM.L["Buy"] = "购买"
TSM.L["Buy %d / %d"] = "购买%d / %d"
TSM.L["Buy %d / %d (Confirming %d / %d)"] = "购买 %d / %d (确认 %d / %d)"
TSM.L["Buy from AH"] = "从拍卖行购买"
TSM.L["Buy from Vendor"] = "从NPC购买"
TSM.L["BUY GROUPS"] = "购买分组"
TSM.L["Buy Options"] = "购买选项"
TSM.L["BUYBACK ALL"] = "全部回购"
TSM.L["Buyer/Seller"] = "购买者/出售者"
TSM.L["Buyout (item)"] = "一口价（物品）"
TSM.L["Buyout (stack)"] = "一口价（堆叠）"
TSM.L["Buyout Price"] = "一口价"
TSM.L["Buyout Sniper Paused"] = "狙击购买已暂停"
TSM.L["Buyout Sniper Running"] = "狙击购买中"
TSM.L["BUYS"] = "购买"
TSM.L["By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."] = "默认情况下，此分组中的所有物品不能分配到分组中。此分组无法删除。"
TSM.L["Can Craft At Least One, Profit, Craftable Quantity"] = "至少能制作一个，利润，可制作数量"
TSM.L["Cancel auctions with bids"] = "取消已被竞标的拍卖"
TSM.L["Cancel Scan"] = "取消扫描"
TSM.L["Cancel to repost higher?"] = "取消并以更高价发布？"
TSM.L["Cancel undercut auctions?"] = "取消被压价的拍卖？"
TSM.L["Canceling"] = "取消"
TSM.L["Canceling %d / %d"] = "取消%d / %d"
TSM.L["Canceling %d Auctions..."] = "取消%d拍卖..."
TSM.L["Canceling all auctions."] = "取消全部拍卖。"
TSM.L["Canceling auction which you've undercut."] = "取消被压价的拍卖。"
TSM.L["Canceling disabled."] = "取消禁用"
TSM.L["Canceling Settings"] = "取消设置"
TSM.L["Canceling to repost at higher price."] = "取消并以更高价格发布。"
TSM.L["Canceling to repost at reset price."] = "取消并以转卖价发布。"
TSM.L["Canceling to repost higher."] = "取消并以更高价发布。"
TSM.L["Canceling undercut auctions and to repost higher."] = "取消被压价拍卖并以更高价发布。"
TSM.L["Canceling undercut auctions."] = "取消被压价拍卖。"
TSM.L["Cancelled"] = "已取消"
TSM.L["Cancelled auction of %sx%d"] = "取消%sx%d的拍卖"
TSM.L["Cancelled Since Last Sale"] = "自上次售出之后取消拍卖"
TSM.L["CANCELS"] = "取消"
TSM.L["Cannot repair from the guild bank!"] = "无法从公会银行修理"
TSM.L["Can't load TSM tooltip while in combat"] = "战斗中不能载入TSM鼠标提示"
TSM.L["Cash Register"] = "收银台"
TSM.L["Character"] = "角色"
TSM.L["CHARACTER"] = "角色"
TSM.L["Character Bags"] = "角色背包"
TSM.L["Character Bank"] = "角色银行"
TSM.L["CHARACTERS"] = "角色"
TSM.L["Chat Tab"] = "聊天标签"
TSM.L["Cheapest auction below min price."] = "低于最低价的拍卖。"
TSM.L["Clean Automatically"] = "自动清除"
TSM.L["Clear"] = "清除"
TSM.L["Clear All"] = "清除所有"
TSM.L["CLEAR DATA"] = "清除数据"
TSM.L["Clear Filters"] = "清除筛选"
TSM.L["Clear Log After 'X' Amount of Days"] = "清除 X 天的LOG"
TSM.L["Clear Old Data"] = "清除旧数据"
TSM.L["Clear Old Data Confirmation"] = "清除旧数据确认"
TSM.L["Clear Queue"] = "清除队列"
TSM.L["Clear Selection"] = "取消选择"
TSM.L["COD"] = "付费邮件"
TSM.L["Coins (%s)"] = "(%s) 金币"
TSM.L["Combine Partial Stacks"] = "合并堆叠"
TSM.L["Combining..."] = "合并中..."
TSM.L["Configuration Scroll Wheel"] = "配置滚轮"
TSM.L["Confirm"] = "确认"
TSM.L["Confirm Complete Sound"] = "确认完成音效"
TSM.L["Confirming %d / %d"] = "确认%d / %d"
TSM.L["Connected to %s"] = "已连接 %s..."
TSM.L["Connecting to %s"] = "正在连接到%s"
TSM.L["CONTACTS"] = "联络"
TSM.L["Contacts Menu"] = "联络菜单"
TSM.L["Cooldown"] = "冷却"
TSM.L["Cooldowns"] = "冷却"
TSM.L["Cost"] = "成本"
TSM.L["Could not apply %s operation %s to %s - it has too many operations already."] = "无法激活%s操作%s至%s-已存在过多操作。"
TSM.L["Could not apply %s operation to group %s because the group does not exist"] = "无法激活%s操作至%s分组，因为此分组不存在。"
TSM.L["Could not create macro as you already have too many. Delete one of your existing macros and try again."] = "无法创建宏，因为你的宏已经满了。删除一些宏后重试。"
TSM.L["Could not deserialize input"] = "不能并行输入"
TSM.L["Could not find enchanted item from"] = "无法找到附魔物品"
TSM.L["Could not find pet"] = "找不到宠物"
TSM.L["Could not find profile '%s'. Possible profiles: '%s'"] = "找不到配置文件 '%s' 。可能是配置文件 '%s' 。"
TSM.L["Could not sell items due to not having free bag space available to split a stack of items."] = "由于没有可用于分割一组堆叠物品的空余背包空间，因此无法出售物品"
TSM.L["Craft"] = "制造"
TSM.L["CRAFT"] = "制造"
TSM.L["Craft (Unprofitable)"] = "制造（无利润的）"
TSM.L["Craft (When Profitable)"] = "制造（有利润时）"
TSM.L["Craft All"] = "制造所有"
TSM.L["CRAFT ALL"] = "制造所有"
TSM.L["Craft Name"] = "制造品名称"
TSM.L["CRAFT NEXT"] = "制作下一个"
TSM.L["Craft value method:"] = "计算制造成本的方法："
TSM.L["Craftable Quantity, Profit"] = "制造数量，利润"
TSM.L["CRAFTER"] = "制造者"
TSM.L["CRAFTING"] = "制造"
TSM.L["Crafting"] = "制造"
TSM.L["Crafting Cost"] = "制造成本"
TSM.L["Crafting 'CRAFT NEXT' Button"] = "制造\"制造下一个\"按钮"
TSM.L["Crafting Queue"] = "制造队列"
TSM.L["Crafting Tooltips"] = "制造鼠标提示"
TSM.L["Crafts"] = "制造"
TSM.L["Crafts %d"] = "制造%d"
TSM.L["CREATE MACRO"] = "创建宏"
TSM.L["Create New Operation"] = "创建新的操作"
TSM.L["CREATE NEW PROFILE"] = "创建新的配置"
TSM.L["Crystals"] = "水晶"
TSM.L["Current Profiles"] = "当前配置档"
TSM.L["CURRENT SEARCH"] = "当前搜索"
TSM.L["CUSTOM POST"] = "自定义发布"
TSM.L["Custom Price"] = "自定义价格"
TSM.L["Custom Price Source"] = "自定义价格来源"
TSM.L["Custom Sources"] = "自定义源"
TSM.L["Database Sources"] = "数据库源"
TSM.L["DD/MM/YY HH:MM"] = "日/月/年 小时：分钟"
TSM.L["Default Craft Value Method:"] = "默认制造价函数："
TSM.L["Default Material Cost Method:"] = "默认材料价函数："
TSM.L["Default Price"] = "默认价格"
TSM.L["Default Price Configuration"] = "默认价格配置"
TSM.L["Default vendoring page"] = "默认NPC页面"
TSM.L["Define whet priority Gathering gives certain sources."] = "定义优先级收集提供某些来源"
TSM.L["Delete Profile Confirmation"] = "删除配置档确认"
TSM.L["DEPOSIT REAGENTS"] = "存储虚空物品"
TSM.L["Deselect All Groups"] = "取消选择所有分组"
TSM.L["Deselect All Items"] = "取消所有物品"
TSM.L["Destroy Next"] = "分解下一个"
TSM.L["Destroy Value"] = "分解价值"
TSM.L["Destroy Value Source"] = "分解价来源"
TSM.L["Destroying"] = "分解"
TSM.L["Destroying 'DESTROY NEXT' Button"] = "分解\"分解下一个\"按钮"
TSM.L["Destroying Tooltips"] = "分解鼠标提示"
TSM.L["Destroying..."] = "分解中"
TSM.L["Details"] = "细节"
TSM.L["Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."] = "未取消％s，因为取消重新发布门槛(%s)无效。 检查您的设置."
TSM.L["Did not cancel %s because your maximum price (%s) is invalid. Check your settings."] = "未取消％s，因为最高价(%s)无效。 检查您的设置。"
TSM.L["Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "未取消％s，因为最高价(%s)低于最低价。 检查您的设置."
TSM.L["Did not cancel %s because your minimum price (%s) is invalid. Check your settings."] = "未取消％s，因为最低价(%s)无效。 检查您的设置。"
TSM.L["Did not cancel %s because your normal price (%s) is invalid. Check your settings."] = "未取消％s，因为正常价(%s)无效。 检查您的设置。"
TSM.L["Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "未取消％s，因为正常价(%s)低于最低价。 检查您的设置."
TSM.L["Did not cancel %s because your undercut (%s) is invalid. Check your settings."] = "未取消%s因为你的底价 (%s) 无效。请检查你的设置。"
TSM.L["Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."] = "未发布％s，因为暴雪未提供必要的信息,请重试"
TSM.L["Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."] = "未发布％s，因为最低拍卖的拥有者(%s)同时出现在黑名单和白名单上，这是不允许的。 调整您的设置以更正此问题。"
TSM.L["Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."] = "未发布％s，不允许您或您的角色(%s)在黑名单。 请从黑名单中删除。"
TSM.L["Did not post %s because your maximum price (%s) is invalid. Check your settings."] = "未发布%s,因为最高价(%s) 无效,请检查您的设置."
TSM.L["Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "未发布%s,因为最高价(%s) 低于最低价,请检查您的设置."
TSM.L["Did not post %s because your minimum price (%s) is invalid. Check your settings."] = "未发布%s,因为最低价(%s) 无效,请检查您的设置."
TSM.L["Did not post %s because your normal price (%s) is invalid. Check your settings."] = "未发布%s,因为正常价(%s) 无效,请检查您的设置."
TSM.L["Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "未发布%s,因为正常价(%s) 低于最低价(%s),请检查您的设置."
TSM.L["Did not post %s because your stack size (%d) is higher than the max stack size of the item (%d)."] = "未发布%s,因为对叠数(%d)高于最大对叠数(%d)."
TSM.L["Did not post %s because your undercut (%s) is invalid. Check your settings."] = "未发布%s因为你的压价(%s) 无效。请检查你的设置。"
TSM.L["Disable invalid price warnings"] = "禁用无效价格提醒"
TSM.L["Disenchant Search"] = "分解搜索"
TSM.L["DISENCHANT SEARCH"] = "分解搜索"
TSM.L["Disenchant Search Options"] = "分解搜索选项"
TSM.L["Disenchant Value"] = "分解值"
TSM.L["Disenchanting Options"] = "分解选项"
TSM.L["Display auctioning values"] = "显示拍卖价值"
TSM.L["Display cancelled since last sale"] = "显示被取消的"
TSM.L["Display crafting cost"] = "显示制造成本"
TSM.L["Display detailed destroy info"] = "显示详细的分解信息"
TSM.L["Display disenchant value"] = "显示分解价值"
TSM.L["Display global historical price"] = "显示全局历史价格"
TSM.L["Display global market value avg"] = "显示全局市场平均价格"
TSM.L["Display global min buyout avg"] = "显示全局最低平均一口价"
TSM.L["Display global sale avg"] = "显示全局出售平均价"
TSM.L["Display group name"] = "显示分组名称"
TSM.L["Display historical price"] = "显示历史价"
TSM.L["Display market value"] = "显示市场价"
TSM.L["Display mill value"] = "显示研磨价"
TSM.L["Display min buyout"] = "显示最低一口价"
TSM.L["Display Operation Names"] = "显示操作名称"
TSM.L["Display prospect value"] = "显示预期价格"
TSM.L["Display purchase info"] = "显示购买信息"
TSM.L["Display region historical price"] = "显示区域历史价格"
TSM.L["Display region market value avg"] = "显示区域市场平均价格"
TSM.L["Display region min buyout avg"] = "显示区域最低平均一口价"
TSM.L["Display region sale avg"] = "显示区域出售平均"
TSM.L["Display region sale rate"] = "显示区域出售比例"
TSM.L["Display region sold per day"] = "显示区域每天出售"
TSM.L["Display sale info"] = "显示出售信息"
TSM.L["Display sale rate"] = "显示出售比例"
TSM.L["Display shopping max price"] = "显示购买最高价"
TSM.L["Display total money recieved in chat?"] = "曲线图显示收到的所有金币"
TSM.L["Display transform value"] = "显示转化价值"
TSM.L["Display vendor buy price"] = "显示NPC购买价"
TSM.L["Display vendor sell price"] = "显示NPC出售价"
TSM.L["Doing so will also remove any sub-groups attached to this group."] = "此操作还会删除附加到该组的所有子组"
TSM.L["Done Canceling"] = "取消完成"
TSM.L["Done Posting"] = "发布完成"
TSM.L["Done Scanning"] = "扫描完成"
TSM.L["Don't post after this many expires:"] = "在过期后不要发布："
TSM.L["Don't Post Items"] = " 不发布物品"
TSM.L["Don't prompt to record trades"] = "请勿立即记录交易"
TSM.L["DOWN"] = "向下"
TSM.L["Drag in Additional Items (%d/%d Items)"] = "拖拽添加物品(%d/%d 物品)"
TSM.L["Drag Item(s) Into Box"] = "把要准备发送的物品拖到此框内"
TSM.L["Duplicate"] = "重复"
TSM.L["Duplicate Profile Confirmation"] = "重复的配置文件确认"
TSM.L["Dust"] = "尘"
TSM.L["Elevate your gold-making!"] = "提升你的gold-making!"
TSM.L["Embed TSM tooltips"] = " 嵌入TSM鼠标提示"
TSM.L["EMPTY BAGS"] = "清空背包"
TSM.L["Empty parentheses are not allowed"] = "不允许清空括号"
TSM.L["Empty price string."] = "清空价格字符串。"
TSM.L["Enable automatic stack combination"] = "启用自动堆叠整理"
TSM.L["Enable buying?"] = "启用购买?"
TSM.L["Enable inbox chat messages"] = "开启对话框收件信息"
TSM.L["Enable restock?"] = "启用补货?"
TSM.L["Enable selling?"] = "启用出售?"
TSM.L["Enable sending chat messages"] = "开启对话框发件信息"
TSM.L["Enable smart crafting for quests"] = "启用智能制造队列"
TSM.L["Enable TSM Tooltips"] = "启用TSM工具提示"
TSM.L["Enable tweet enhancement"] = "启用Tweet增强"
TSM.L["Enchant Vellum"] = "附魔羊皮纸"
TSM.L["Enter a name for the new profile"] = "输入新配置文件的名称"
TSM.L["Enter Filter"] = "输入过滤名"
TSM.L["Enter Keyword"] = "输入关键字"
TSM.L["Enter name of logged-in character from other account"] = "输入已经登录的角色名"
TSM.L["Enter player name"] = "输入玩家姓名"
TSM.L["Essences"] = "精华"
TSM.L["Establishing connection to %s. Make sure that you've entered this character's name on the other account."] = "正在建立到 %s 的连接。确定你登陆过这个角色。"
TSM.L["Estimated Cost:"] = "预计成本:"
TSM.L["Estimated Profit:"] = "预计利润："
TSM.L["Exact Match Only?"] = "完全匹配?"
TSM.L["Exclude crafts with cooldowns"] = "忽略CD中的制造"
TSM.L["Expenses"] = "支出"
TSM.L["EXPENSES"] = "支出"
TSM.L["Expired"] = "到期的"
TSM.L["Expired Since Last Sale"] = "上次出售到期的"
TSM.L["Expires"] = "到期"
TSM.L["EXPIRES"] = "到期"
TSM.L["Exploration"] = "探测"
TSM.L["Export"] = "导出"
TSM.L["Export List"] = "导出列表"
TSM.L["Failed Auctions"] = "拍卖失败"
TSM.L["Failed Since Last Sale (Expired/Cancelled)"] = "上次出售失败的(到期/取消)"
TSM.L["Failed to bid on auction of %s."] = "竞标%s失败"
TSM.L["Failed to buy auction of %s."] = "购买%s失败"
TSM.L["Failed to find auction for %s, so removing it from the results."] = "查找%s失败,已经从结果移除"
TSM.L["Favorite Scans"] = "收藏的扫描"
TSM.L["Favorite Searches"] = "收藏的搜索"
TSM.L["Filter Auctions by Duration"] = "按持续时间过滤拍卖"
TSM.L["Filter Auctions by Keyword"] = "按关键字过滤拍卖"
TSM.L["FILTER BY KEYWORD"] = "按关键字过滤."
TSM.L["Filter by Keyword"] = "按关键字过滤"
TSM.L["Filter group item lists based on the following price source"] = [=[根据以下价格源过滤分组物品
]=]
TSM.L["Filter Items"] = "过滤物品"
TSM.L["Filter Shopping"] = "过滤shopping"
TSM.L["Finding Selected Auction"] = "查找选定的拍卖"
TSM.L["Fishing Reel In"] = "钓鱼卷轴"
TSM.L["Forget Character"] = "遗忘角色"
TSM.L["Found auction sound"] = "找到拍卖音效"
TSM.L["Friends"] = "好友"
TSM.L["From"] = "从"
TSM.L["Full"] = "满了"
TSM.L["Garrison"] = "要塞"
TSM.L["Gathering"] = "收集"
TSM.L["Gathering Search"] = "采集搜索"
TSM.L["General Options"] = "常规选项"
TSM.L["Get from Bank"] = "从银行获得"
TSM.L["Get from Guild Bank"] = "从公会银行获得"
TSM.L["Global Data Tooltips"] = "全局数据工具提示"
TSM.L["Global Historical Price"] = "全局历史价格"
TSM.L["Global Market Value Avg"] = "全局市场平均价"
TSM.L["Global Min Buyout Avg"] = "全局最低一口价"
TSM.L["Global Operation Confirmation"] = "全局操作确认"
TSM.L["Global Sale Avg"] = "全局出售平均价"
TSM.L["Gold"] = "金"
TSM.L["Gold Earned:"] = "赚取金币："
TSM.L["GOLD ON HAND"] = "背包中的金币"
TSM.L["Gold Spent:"] = "花费的金币："
TSM.L["GREAT DEALS SEARCH"] = "搜索有利润的物品"
TSM.L["Group already exists."] = "已存在的组"
TSM.L["Group Management"] = "分组管理"
TSM.L["Group Operations"] = "分组操作"
TSM.L["Group Settings"] = "分组设置"
TSM.L["Grouped Items"] = "已分组的物品"
TSM.L["Groups"] = "分组"
TSM.L["Guild"] = "公会"
TSM.L["Guild Bank"] = "公会银行"
TSM.L["GUILDS"] = "公会"
TSM.L["GVault"] = "公会银行"
TSM.L["Have"] = "拥有"
TSM.L["Have Materials"] = "拥有的材料"
TSM.L["Have Skill Up"] = "技能提升"
TSM.L["Help & Info"] = "帮助&信息"
TSM.L["Hide auctions with bids"] = "隐藏已竞标的"
TSM.L["Hide Description"] = "隐藏描述"
TSM.L["Hide minimap icon"] = "隐藏小地图图标"
TSM.L["Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."] = "隐藏TSM银行界面,输入/tsm bankui 可重新打开"
TSM.L["Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."] = "隐藏TSM 任务列表UI,输入/tsm tasklist 可重新打开"
TSM.L["High Bidder"] = "高出价者"
TSM.L["Historical Price"] = "历史价格"
TSM.L["Hold ALT to repair from the guild bank."] = "按住 ALT 键进行公会修理"
TSM.L["Hr"] = "小时"
TSM.L["Hrs"] = "小时"
TSM.L["I just bought [%s]x%d for %s! %s #TSM4 #warcraft"] = "我刚买了％s的[％s] x％d！ ％s＃TSM4 #warcraft"
TSM.L["I just sold [%s] for %s! %s #TSM4 #warcraft"] = "我只卖了％s的[％s]！ ％s＃TSM4 #warcraft"
TSM.L["If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."] = "如果您不想压价一个玩家，可以将它添加到白名单中，TSM将不会压价它。 请注意，如果您的白名单中的某人与您的买断匹配但列出较低的出价，TSM仍会对它们进行压价。"
TSM.L["If you have multiple profile set up with operations, enabling this will cause all but the current profile's operations to be irreversibly lost. Are you sure you want to continue?"] = "如果您有多个配置文件建立了'操作'， 授权这个会导致除当前配置文件以外的所有的'操作'永久丢失，您确定要继续吗？"
TSM.L["If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."] = "如果您拥有WoW的Twitter集成设置，TSM将为其增强的拍卖销售/购买消息添加共享链接，以及用TSM链接替换URL。"
TSM.L["Ignore Auctions Below Min"] = "忽略最低价以下的拍卖"
TSM.L["Ignore auctions by duration?"] = "按持续时间忽略拍卖？"
TSM.L["Ignore Characters"] = "忽略角色"
TSM.L["Ignore duplicate operations?"] = "忽略重复的操作?"
TSM.L["Ignore Guilds"] = "忽略公会"
TSM.L["Ignore operation on characters:"] = "忽略对角色的操作:"
TSM.L["Ignore operation on faction-realms:"] = "在阵营-服务器忽略操作："
TSM.L["Ignore random enchants?"] = "忽略随机附魔"
TSM.L["Ignored Cooldowns"] = "忽略冷却"
TSM.L["Ignored Items"] = "忽略物品"
TSM.L["ilvl"] = "物品等级"
TSM.L["Import"] = "导入"
TSM.L["IMPORT"] = "导入"
TSM.L["Import %d Items and %s Operations?"] = "导入%d物品和%s操作?"
TSM.L["Import Groups & Operations"] = "导入分组&操作"
TSM.L["Imported Items"] = "已导入物品"
TSM.L["Imported Operations"] = "已导入操作"
TSM.L["Inbox Settings"] = "收件设置"
TSM.L["Include Attached Operations"] = "包括附件操作"
TSM.L["Include operations?"] = "包括操作?"
TSM.L["Include soulbound items"] = "包括灵魂绑定物品"
TSM.L["Information"] = "信息"
TSM.L["Invalid custom price entered."] = "输入的自定义价格无效"
TSM.L["Invalid custom price source for %s. %s"] = "无效的自定义价格源%s. %s"
TSM.L["Invalid custom price."] = "无效的自定义价格。"
TSM.L["Invalid function."] = "无效功能。"
TSM.L["Invalid group name."] = "无效分组名"
TSM.L["Invalid item link."] = "无效的物品链接。"
TSM.L["Invalid operation name."] = "无效操作名"
TSM.L["Invalid operator at end of custom price."] = "无效的操作者自定义价格。"
TSM.L["Invalid parameter to price source."] = "无效的价格来源参数。"
TSM.L["Invalid player name."] = "无效玩家名"
TSM.L["Invalid price source in convert."] = "转换价格来源无效。"
TSM.L["Invalid price source."] = "无效价格来源"
TSM.L["Invalid seller data returned by server."] = "服务器返回无效的出售数据"
TSM.L["Invalid word: '%s'"] = "无效的单词：'%s'"
TSM.L["Inventory"] = "仓库"
TSM.L["Inventory / Mailing"] = "库存/邮寄"
TSM.L["Inventory Options"] = "库存设置"
TSM.L["Inventory Tooltip Format"] = "库存工具提示格式"
TSM.L["It appears that you've manually copied your saved variables between accounts which will cause TSM's automatic sync'ing to not work. You'll need to undo this, and/or delete the TradeSkillMaster and TSM_Crafting saved variables files on both accounts (with WoW closed) in order to fix this."] = "你曾在不同账号之间手动复制过保存的变量文件，这将会导致TSM的自动同步功能失效。你不需要做这些。删除这些账号下TradeSkillMaster和TSM_Crafting 保存的变量文件（关闭WOW的情况下）将会修复此问题。"
TSM.L["Item"] = "物品"
TSM.L["ITEM CLASS"] = "物品种类"
TSM.L["Item Level"] = "物品等级"
TSM.L["ITEM LEVEL RANGE"] = "物品等级区间"
TSM.L["Item links may only be used as parameters to price sources."] = "物品链接仅可用来参考价格来源。"
TSM.L["Item Name"] = "物品名称"
TSM.L["Item Quality"] = "物品品质"
TSM.L["ITEM SEARCH"] = "物品搜索"
TSM.L["ITEM SUBCLASS"] = "物品子类"
TSM.L["Item Value"] = "物品价格"
TSM.L["Item/Group is invalid (see chat)."] = "物品/分组无效(查看聊天框)"
TSM.L["ITEMS"] = "物品"
TSM.L["Items"] = "物品"
TSM.L["Items in Bags"] = "背包中的物品"
TSM.L["Keep in bags quantity:"] = "保持背包数量"
TSM.L["Keep in bank quantity:"] = "保持银行数量:"
TSM.L["Keep posted:"] = "保持已发布的:"
TSM.L["Keep quantity:"] = "保持数量:"
TSM.L["Keep this amount in bags:"] = "将此数量保存在背包"
TSM.L["Keep this amount:"] = "持有数量"
TSM.L["Keeping %d."] = "持有%d."
TSM.L["Keeping undercut auctions posted."] = "保留被压数量"
TSM.L["Last 14 Days"] = "14日内"
TSM.L["Last 3 Days"] = "3日内"
TSM.L["Last 30 Days"] = "30日内"
TSM.L["LAST 30 DAYS"] = "30日内"
TSM.L["Last 60 Days"] = "60日内"
TSM.L["Last 7 Days"] = "7日内"
TSM.L["LAST 7 DAYS"] = "7日内"
TSM.L["Last Data Update:"] = "上次数据更新："
TSM.L["Last Purchased"] = "上次购买"
TSM.L["Last Sold"] = "上次售出"
TSM.L["Level Up"] = "等级上升"
TSM.L["LIMIT"] = "限制"
TSM.L["Link to Another Operation"] = "关联到另一个操作"
TSM.L["List"] = "列表"
TSM.L["List materials in tooltip"] = "鼠标提示显示材料"
TSM.L["Loading Mails..."] = "正在读取邮件……"
TSM.L["Loading..."] = "读取中……"
TSM.L["Looks like TradeSkillMaster has encountered an error. Please help the author fix this error by following the instructions shown."] = "TradeSkillMaster似乎发生了一个错误。请按以下所示说明来帮助作者修正这个错误。"
TSM.L["Loop detected in the following custom price:"] = "以下自定义价格循环检测："
TSM.L["Lowest auction by whitelisted player."] = "最低价的拍卖为白名单玩家"
TSM.L["Macro created and scroll wheel bound!"] = "已建立宏并且绑定鼠标滚轮！"
TSM.L["Macro Setup"] = "宏设置"
TSM.L["Mail"] = "邮件"
TSM.L["Mail Disenchantables"] = "邮寄可分解物品"
TSM.L["Mail Disenchantables Max Quality"] = "邮寄最大数量可分解物品"
TSM.L["MAIL SELECTED GROUPS"] = "邮递所选分组"
TSM.L["Mail to %s"] = "邮寄给%s"
TSM.L["Mailing"] = "邮寄"
TSM.L["Mailing all to %s."] = "全部邮寄至 %s"
TSM.L["Mailing Options"] = "邮递选项"
TSM.L["Mailing up to %d to %s."] = "邮寄%d给%s"
TSM.L["Main Settings"] = "主设定"
TSM.L["Make Cash On Delivery?"] = "货到对方付款"
TSM.L["Management Options"] = "管理选项"
TSM.L["Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."] = "TSM中的许多常用操作可以添加到宏并绑定到滚轮。 使用下面的选项设置宏和滚轮绑定。"
TSM.L["Map Ping"] = "地图Ping"
TSM.L["Market Value"] = "市场价格"
TSM.L["Market Value Price Source"] = "市场价来源"
TSM.L["Market Value Source"] = "市场价格来源"
TSM.L["Mat Cost"] = "原料花费"
TSM.L["Mat Price"] = "原料价格"
TSM.L["Match stack size?"] = "匹配堆叠数?"
TSM.L["Match whitelisted players"] = "匹配白名单玩家"
TSM.L["Material Name"] = "材料名称"
TSM.L["Materials"] = "材料"
TSM.L["Materials to Gather"] = "要收集的材料"
TSM.L["Max Destroy Value"] = "最大分解价值"
--[[Translation missing --]]
TSM.L["MAX EXPIRES TO BANK"] = "MAX EXPIRES TO BANK"
TSM.L["Max Market Value"] = " 最高市场价"
TSM.L["Max Shopping Price"] = "最高购买价"
TSM.L["Maximum amount already posted."] = "已发布最大数量"
TSM.L["Maximum Auction Price (Per Item)"] = "最高发布价(每件价格,不是每组)"
TSM.L["Maximum Destroy Value (Enter '0c' to disable)"] = "最高分解价值(输入 0c 禁用)"
TSM.L["Maximum disenchant level:"] = "最高分解等级:"
TSM.L["Maximum Disenchant Quality"] = "最高分解品质"
TSM.L["Maximum disenchant search percentage:"] = "最高分解比例"
TSM.L["Maximum Market Value (Enter '0c' to disable)"] = "最高市场价(输入 0c 禁用)"
TSM.L["MAXIMUM QUANTITY TO BUY:"] = "最大购买数量"
TSM.L["Maximum quantity:"] = "最大数量"
TSM.L["Maximum restock quantity:"] = "最大补货数量"
TSM.L["Mill Value"] = "邮递价格"
TSM.L["Min"] = "最小"
TSM.L["Min Buyout"] = "最低一口价"
TSM.L["Min/Normal/Max Prices"] = "最低/正常/最高 价格"
TSM.L["Minimum Days Old"] = "最小天数"
TSM.L["Minimum disenchant level:"] = "最低分解等级:"
TSM.L["Minimum expires:"] = "最低到期"
TSM.L["Minimum profit:"] = "最低利润"
TSM.L["MINIMUM RARITY"] = "最低品质"
TSM.L["Minimum restock quantity:"] = "最小补货数量"
TSM.L["Misplaced comma"] = "错误的分隔逗号"
TSM.L["Missing Materials"] = "缺少的材料"
TSM.L["MM/DD/YY HH:MM"] = "月/日/年 小时/分钟"
TSM.L["Modifiers:"] = "编辑器："
TSM.L["Money Frame Open"] = "金钱框架打开"
TSM.L["Money Transfer"] = "金币交易量"
TSM.L["Most Profitable Item:"] = "有利润的物品"
TSM.L["MOVE"] = "移动"
TSM.L["Move already grouped items?"] = "移动在分组中的物品?"
TSM.L["Move Quantity Settings"] = "移动数量设置"
TSM.L["MOVE TO BAGS"] = "转移到背包"
TSM.L["MOVE TO BANK"] = "转移到银行"
TSM.L["MOVING"] = "移动中"
TSM.L["Moving"] = "移动中"
TSM.L["Multiple Items"] = "多个物品"
TSM.L["My Auctions"] = "我的拍卖"
TSM.L["My Auctions 'CANCEL' Button"] = "我的拍卖\"取消\"按钮"
TSM.L["Neat Stacks only?"] = "只移动整组"
TSM.L["NEED MATS"] = "需要材料"
TSM.L["New Group"] = "新的分组"
TSM.L["New Operation"] = "新操作"
TSM.L["NEWS AND INFORMATION"] = "新闻和信息"
TSM.L["No Attachments"] = "没有附件"
TSM.L["No Data"] = "没有数据"
TSM.L["No group selected"] = "未选择分组"
TSM.L["No item specified. Usage: /tsm restock_help [ITEM_LINK]"] = "未物品指定。 用法：/tsm restock help [物品链接]"
TSM.L["NO ITEMS"] = "没有物品"
TSM.L["No Materials to Gather"] = "没有材料来采集"
TSM.L["No Operation Selected"] = "未选择操作"
TSM.L["No posting."] = "未发布"
TSM.L["No Profession Opened"] = "未打开专业"
TSM.L["No Profession Selected"] = "未选择专业"
TSM.L["No profile specified. Possible profiles: '%s'"] = "无指定配置。可能配置：'%s'"
TSM.L["No recent AuctionDB scan data found."] = "未找到AuctionDB扫描数据。"
TSM.L["No Sound"] = "无声"
TSM.L["None"] = "无"
TSM.L["None (Always Show)"] = "无（总是显示）"
TSM.L["None Selected"] = "未选择"
TSM.L["NONGROUP TO BANK"] = "未分组到银行"
TSM.L["Normal"] = "常规"
TSM.L["Not canceling auction at reset price."] = "不取消位于转卖价格的拍卖"
TSM.L["Not canceling auction below min price."] = "低于最低价格时不取消拍卖"
TSM.L["Not canceling."] = "未取消"
TSM.L["Not enough items in bags."] = "背包物品不足"
TSM.L["NOT OPEN"] = "未打开"
TSM.L["Not Scanned"] = "未扫描的"
TSM.L["NPC"] = "NPC"
TSM.L["Number Owned"] = "拥有的数量"
TSM.L["of"] = "的"
TSM.L["Offline"] = "离线"
TSM.L["Old TSM addons detected. TSM has disabled them and requires a reload."] = "检测到旧版本TSM插件. TSM已禁用它们并需要重新加载"
TSM.L["On Cooldown"] = "冷却中"
TSM.L["Only show craftable"] = "只显示可制作的"
TSM.L["Only show items with disenchant value above custom price"] = "只显示具有高于自定义价格的分解价值的商品"
TSM.L["OPEN"] = "打开"
TSM.L["Open all bags when auctioning"] = "拍卖时打开所有背包"
TSM.L["OPEN ALL MAIL"] = "打开所有邮件"
TSM.L["Open Mail"] = "打开邮件"
TSM.L["Open Mail Complete Sound"] = "打开邮箱声音"
TSM.L["Open Task List"] = "打开任务列表"
TSM.L["Operation"] = "操作"
TSM.L["Operations"] = "操作"
TSM.L["Other Character"] = "其他角色"
TSM.L["Other Settings"] = "其他设置"
TSM.L["Other Shopping Searches"] = "其他Shopping 搜索"
TSM.L["Override default craft value method?"] = "覆盖默认制造价值参数"
TSM.L["Override parent operations"] = "覆盖父操作"
TSM.L["Parent Items"] = "父项目"
TSM.L["Past 7 Days"] = "过去七天"
TSM.L["Past Day"] = "昨天的"
TSM.L["Past Month"] = "过去一个月的"
TSM.L["Past Year"] = "过去一年的"
TSM.L["Paste string here"] = "在此粘贴字符串"
TSM.L["Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."] = "将导入字符串粘贴到下面的字段中，然后点“导入”。 您可以导入任务物品到所有分组&操作结构到整个组和操作结构的所有内容（请逗号分隔）。"
TSM.L["Per Item"] = "每个物品"
TSM.L["Per Stack"] = "每组"
TSM.L["Per Unit"] = "每个"
TSM.L["Player Gold"] = "玩家金币"
TSM.L["Player Invite Accept"] = "接受玩家邀请"
TSM.L["Please select a group to export"] = "请选择一个分组来导出"
TSM.L["POST"] = "发布"
TSM.L["Post at Maximum Price"] = "以最高价发布"
TSM.L["Post at Minimum Price"] = "以最低价发布"
TSM.L["Post at Normal Price"] = "以正常价格发布"
TSM.L["POST CAP TO BAGS"] = "发布上限到背包"
TSM.L["Post Scan"] = "发布扫描"
TSM.L["POST SELECTED"] = "发布选择的"
TSM.L["POSTAGE"] = "邮费"
TSM.L["Postage"] = "邮费"
TSM.L["Posted at whitelisted player's price."] = "以白名单玩家价格发布"
TSM.L["Posted Auctions %s:"] = "发布的拍卖%s:"
TSM.L["Posting"] = "发布中"
TSM.L["Posting %d / %d"] = "发布中 %d / %d"
TSM.L["Posting %d stack(s) of %d for %d hours."] = "发布%d个堆叠的%d，持续时间为%d小时"
TSM.L["Posting at normal price."] = "以正常价发布"
TSM.L["Posting at whitelisted player's price."] = "正在以白名单玩家价格发布"
TSM.L["Posting at your current price."] = "正在以当前价格发布"
TSM.L["Posting disabled."] = "发布禁用"
TSM.L["Posting Settings"] = "发布设置"
TSM.L["Potential"] = "潜在"
TSM.L["Price Settings"] = "价格设置"
TSM.L["PRICE SOURCE"] = "价格来源"
TSM.L["Price source with name '%s' already exists."] = "价格来源名称 '%s' 已经存在"
TSM.L["Price Variables"] = "价格变量"
TSM.L["Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."] = "价格变量允许您创建更高级的自定义价格，以便在整个插件中使用。 您将能够以与使用内置价格来源相同的方式使用这些新变量，例如'vendorsell'和'vendorbuy'"
TSM.L["PROFESSION"] = "专业"
TSM.L["Profession Filters"] = "专业过滤"
TSM.L["Profession loading..."] = "专业加载中..."
TSM.L["Professions Used In"] = "涉及专业"
TSM.L["Profile changed to '%s'."] = "变更成'%s'配置。"
TSM.L["Profiles"] = "配置档"
TSM.L["Profit"] = "利润"
TSM.L["PROFIT"] = "利润"
TSM.L["Profit Deduction"] = "利润扣除"
TSM.L["Profit, Craftable Quantity"] = "利润，可制造数量"
TSM.L["Prospect Value"] = "预期价格"
TSM.L["PURCHASE DATA"] = "购买数据"
TSM.L["Purchased (Min/Avg/Max Price)"] = "购买（最小/平均/最高价)"
TSM.L["Purchased (Total Price)"] = "购买(总价)"
TSM.L["Purchases"] = "购买数量"
TSM.L["Qty"] = "数量"
TSM.L["Quantity Bought:"] = "买入数量"
TSM.L["Quantity Sold:"] = "售出数量"
TSM.L["Quantity to move:"] = "移动数量"
TSM.L["Quest Added"] = "任务已添加"
TSM.L["Quest Completed"] = "任务已完成"
TSM.L["Quest Objectives Complete"] = "任务目标完成"
TSM.L["QUEUE"] = "队列"
TSM.L["Queue Sorting Method"] = "队列排序方法"
TSM.L["Quick Sell"] = "快速出售"
TSM.L["Quick Sell Options"] = "快速出售选项"
TSM.L["Quickly mail all excess disenchantable items to a character"] = "快速将所有多余的可分解物品邮寄给角色"
TSM.L["Quickly mail all excess gold (limited to a certain amount) to a character"] = "快速将所有多余的金币（限制在一定数量）邮寄给角色"
TSM.L["Raid Warning"] = "副本警告"
TSM.L["Read More"] = "Read More"
TSM.L["Ready Check"] = "准备好检查"
TSM.L["Ready to Cancel"] = "准备取消"
TSM.L["Reagent Bank"] = "材料银行"
TSM.L["Realm Data Tooltips"] = "鼠标提示阵营数据"
TSM.L["Recent Scans"] = "最近的扫描"
TSM.L["Recent Searches"] = "最近的搜索"
TSM.L["Recently Mailed"] = "最近的邮递"
TSM.L["RECIPIENT"] = "接受者"
TSM.L["Region Avg Daily Sold"] = "服务器平均每日出售"
TSM.L["Region Data Tooltips"] = "鼠标提示服务器数据"
TSM.L["Region Historical Price"] = "服务器历史价格"
TSM.L["Region Market Value Avg"] = "服务器市场平均价"
TSM.L["Region Min Buyout Avg"] = "区域最低平均一口价"
TSM.L["Region Sale Avg"] = "服务器平均出售"
TSM.L["Region Sale Rate"] = "服务器成交率"
TSM.L["Reload"] = "重载"
TSM.L["REMOVE %d ITEMS"] = "移除物品 %d "
TSM.L["Removed a total of %s old records."] = "总共删除了％s 旧记录"
TSM.L["REPAIR"] = "修复"
TSM.L["Repair Bill"] = "修复账单"
TSM.L["Replace"] = "替换"
TSM.L["REPLY"] = "回复"
TSM.L["REPORT SPAM"] = "举报垃圾信息"
TSM.L["Repost Higher Threshold"] = "重新以更高价发布"
TSM.L["Required Level"] = "请求的等级"
TSM.L["REQUIRED LEVEL RANGE"] = "要求的等级范围"
TSM.L["Requires TSM Desktop Application"] = "要求TSM 桌面App"
TSM.L["Resale"] = "转卖"
TSM.L["RESCAN"] = "重新扫描"
TSM.L["RESET"] = "重置"
TSM.L["Reset All"] = "重置所有"
TSM.L["Reset Filters"] = "重置过滤"
TSM.L["Reset Profile Confirmation"] = "重置配置确认"
TSM.L["RESTART"] = "重新开始"
TSM.L["Restart Delay (minutes)"] = "自动邮件重启延迟（分钟）"
TSM.L["RESTOCK BAGS"] = "补货背包"
TSM.L["Restock help for %s:"] = "补货帮助%s:"
TSM.L["Restock Quantity Settings"] = "补货数量设置"
TSM.L["Restock quantity:"] = "补货数量"
TSM.L["RESTOCK SELECTED GROUPS"] = "补货选择的分组"
TSM.L["Restock Settings"] = "补货设置"
TSM.L["Restock target to max quantity?"] = "对目标进行最大补货?"
TSM.L["Restocking to %d."] = "补货到%d"
TSM.L["Restocking to a max of %d (min of %d) with a min profit."] = "以最低利润对 %d 进行最大(最小)补货"
TSM.L["Restocking to a max of %d (min of %d) with no min profit."] = "以最高利润对 %d 进行最大(最小)补货"
TSM.L["RESTORE BAGS"] = "恢复背包"
TSM.L["Resume Scan"] = "恢复扫描"
TSM.L["Retrying %d auction(s) which failed."] = "重试失败的％d拍卖"
TSM.L["Revenue"] = "收益"
TSM.L["Round normal price"] = "正常价格附近"
TSM.L["RUN ADVANCED ITEM SEARCH"] = "运行高级物品搜索"
TSM.L["Run Bid Sniper"] = "运行狙击竞价"
TSM.L["Run Buyout Sniper"] = "运行狙击一口价"
TSM.L["RUN CANCEL SCAN"] = "取消扫描"
TSM.L["RUN POST SCAN"] = "发布扫描"
TSM.L["RUN SHOPPING SCAN"] = "购买扫描"
TSM.L["Running Sniper Scan"] = "运行狙击扫描"
TSM.L["Sale"] = "出售"
TSM.L["SALE DATA"] = "出售数据"
TSM.L["Sale Rate"] = "成交率"
TSM.L["Sales"] = "出售"
TSM.L["SALES"] = "出售"
TSM.L["Sales Summary"] = "出售总览"
TSM.L["SCAN ALL"] = "取消所有"
TSM.L["Scan Complete Sound"] = "扫描完成声音"
TSM.L["Scan Paused"] = "扫描被暂停"
TSM.L["SCANNING"] = "正在扫描"
TSM.L["Scanning %d / %d (Page %d / %d)"] = "正在扫描第%d项/共%d项(第%d页/共%d页)"
TSM.L["Scroll wheel direction:"] = "滚轮方向"
TSM.L["Search"] = "搜索"
TSM.L["Search Bags"] = "搜索背包"
TSM.L["Search for Item"] = "搜索物品"
TSM.L["Search Groups"] = "搜索分组"
TSM.L["Search Inbox"] = "搜索收件箱"
TSM.L["Search Operations"] = "搜索操作"
TSM.L["Search Patterns"] = "搜索模式"
TSM.L["Search Usable Items Only?"] = "仅搜索可用物品"
TSM.L["Search Vendor"] = "搜索NPC"
TSM.L["Select a Source"] = "选择一个源"
TSM.L["Select Action"] = "选择操作"
TSM.L["Select All Groups"] = "选择所有分组"
TSM.L["Select All Items"] = "选择所有物品"
TSM.L["Select Auction to Cancel"] = "选择拍卖取消"
TSM.L["Select crafter"] = "选择制造者"
TSM.L["Select custom price sources to include in item tooltips"] = "选择要包含在提示中的自定义价格来源"
TSM.L["Select Duration"] = "选择持续时间"
TSM.L["Select Items to Add"] = "选择要添加的物品"
TSM.L["Select Items to Remove"] = "选择要移除的物品"
TSM.L["Select Operation"] = "选择操作"
TSM.L["Select professions"] = "选择专业"
TSM.L["Select which accounting information to display in item tooltips."] = "选择要显示物品提示的accounting信息"
TSM.L["Select which auctioning information to display in item tooltips."] = "选择要显示物品提示的拍卖信息"
TSM.L["Select which crafting information to display in item tooltips."] = "选择要显示物品提示的制造信息"
TSM.L["Select which destroying information to display in item tooltips."] = "选择要显示物品提示的分解信息"
TSM.L["Select which shopping information to display in item tooltips."] = "选择要显示物品提示的购买信息"
TSM.L["Selected Groups"] = "选择的分组"
TSM.L["SELECTED ITEM"] = "选择的物品"
TSM.L["Selected Operations"] = "选择的操作"
TSM.L["Sell"] = "出售"
TSM.L["SELL ALL"] = "出售所有"
TSM.L["SELL BOES"] = "出售BOE物品"
TSM.L["SELL GROUPS"] = "出售分组"
TSM.L["Sell Options"] = "出售选择"
TSM.L["Sell soulbound items?"] = "出售灵魂绑定的物品?"
TSM.L["Sell to Vendor"] = "卖给NPC"
TSM.L["SELL TRASH"] = "出售垃圾"
TSM.L["Seller"] = "出售者"
TSM.L["Selling soulbound items."] = "出售灵魂绑定物品"
TSM.L["Send"] = "发送"
TSM.L["SEND DISENCHANTABLES"] = "发送待拆解的装备"
TSM.L["Send Excess Gold to Banker"] = "发送超额金币给银行角色"
TSM.L["SEND GOLD"] = "发送金币"
TSM.L["Send grouped items individually"] = "单独发送分组物品"
TSM.L["SEND MAIL"] = "发送邮件"
TSM.L["Send Money"] = "发送金币"
TSM.L["SENDING"] = "发送中"
TSM.L["Sending %s individually to %s"] = "将％s单独发送到％s"
TSM.L["Sending %s to %s"] = "发送%s到%s"
TSM.L["Sending %s to %s with a COD of %s"] = "发送付费邮寄 从 %s 到 %s"
TSM.L["Sending Settings"] = "发送设置"
TSM.L["SENDING..."] = "发送中..."
TSM.L["Set auction duration to:"] = "设置拍卖持续时间:"
TSM.L["Set bid as percentage of buyout:"] = "将出价设置为一口价的百分比"
TSM.L["Set keep in bags quantity?"] = "设置背包持有数量"
TSM.L["Set keep in bank quantity?"] = "设置银行持有数量"
TSM.L["Set Maximum Price:"] = "设置最高价:"
TSM.L["Set maximum quantity?"] = "设置最大数量"
TSM.L["Set Minimum Price:"] = "设置最低价:"
TSM.L["Set minimum profit?"] = "设置最低利润?"
TSM.L["Set move quantity?"] = "设置移动数量?"
TSM.L["Set Normal Price:"] = "设置正常价:"
TSM.L["Set post cap to:"] = "设置发布上限到:"
TSM.L["Set posted stack size to:"] = "设置发布堆叠数:"
TSM.L["Set stack size for bags?"] = "设置背包堆叠数?"
TSM.L["Setup"] = "建立"
TSM.L["SETUP ACCOUNT SYNC"] = "设置账户同步"
TSM.L["Shards"] = "碎片"
TSM.L["Shopping"] = "购买"
TSM.L["Shopping 'BUYOUT' Button"] = "Shopping \"一口价\" 按钮"
TSM.L["Shopping for auctions including those above the max price."] = "购买拍卖品(包括那些高于最高价格的)"
TSM.L["Shopping for auctions with a max price set."] = "购买拍卖品(在最高价格限定下)"
TSM.L["Shopping for even stacks including those above the max price"] = "购买整组,忽视最高价格选定"
TSM.L["Shopping for even stacks with a max price set."] = "购买整组,在最高价格限定下"
TSM.L["Shopping Tooltips"] = "购买提示"
TSM.L["SHORTFALL TO BAGS"] = "背包里的物品不够"
TSM.L["Show auctions above max price?"] = "显示高于最高价格的拍卖品"
TSM.L["Show Description"] = "显示描述"
TSM.L["Show Destroying frame automatically"] = "自动显示分解窗口"
TSM.L["Show material cost"] = "显示材料成本"
TSM.L["Show on Modifier"] = "在调节器中显示"
TSM.L["Showing %d Mail"] = "显示 %d 邮件"
TSM.L["Showing %d of %d Mail"] = "显示 %d / %d 封邮件"
TSM.L["Showing %d of %d Mails"] = "显示 %d / %d 封邮件"
TSM.L["Showing all %d Mails"] = "显示所有 %d 邮件"
TSM.L["Simple"] = "简单"
TSM.L["SKIP"] = "跳过"
TSM.L["Skip Import / Export confirmations?"] = "跳过 导入 / 导出 确认?"
TSM.L["Skipped: No assigned operation"] = "已跳过:无指定操作"
TSM.L["Slash Commands:"] = "指令列表："
TSM.L["Sniper 'BUYOUT' Button"] = "狙击\"一口价\"按钮"
TSM.L["Sniper Options"] = "狙击选项"
TSM.L["Sniper Settings"] = "狙击设置"
TSM.L["Sniping items below a max price"] = "狙击物品低于最高价"
TSM.L["Sold"] = "卖出"
TSM.L["Sold %s worth of items."] = "售出％s物品"
TSM.L["Sold (Min/Avg/Max Price)"] = "出售(最小/平均/最高价)"
TSM.L["Sold (Total Price)"] = "售出(总价):"
TSM.L["Sold [%s]x%d for %s to %s"] = "卖出 [%s]x%d 为 %s 到 %s"
TSM.L["Sold Auctions %s:"] = "已售出拍卖％s："
TSM.L["Source"] = "来源"
TSM.L["SOURCE %d"] = "来源%d"
TSM.L["SOURCES"] = "来源"
TSM.L["Sources"] = "来源"
TSM.L["Sources to include for restock:"] = "包括补货来源"
TSM.L["Stack"] = "堆叠"
TSM.L["Stack / Quantity"] = "堆叠/数量"
TSM.L["Stack size multiple:"] = "堆叠大小数量"
TSM.L["Start either a 'Buyout' or 'Bid' sniper using the buttons above."] = "使用上面的按钮启动“一口价”或“竞标”狙击搜索"
TSM.L["Starting Scan..."] = "开始扫描..."
TSM.L["STOP"] = "停止"
TSM.L["Store operations globally"] = "全局保存操作"
TSM.L["Subject"] = "邮件主题"
TSM.L["SUBJECT"] = "主题"
TSM.L["Switch to %s"] = "切换到%s"
TSM.L["Switch to WoW UI"] = "切换到WOW界面"
TSM.L["Sync Setup Error: The specified player on the other account is not currently online."] = "同步设置错误：另一个账号中的指定角色不在线。"
TSM.L["Sync Setup Error: This character is already part of a known account."] = "同步设置错误：该角色已经在一个已知账号中。"
TSM.L["Sync Setup Error: You entered the name of the current character and not the character on the other account."] = "同步设置错误：您输入了当前角色名而非其他账号下的角色名。"
TSM.L["TAKE ALL"] = "提取所有"
TSM.L["Take Attachments"] = "提取附件"
TSM.L["Target Character"] = "目标角色"
TSM.L["TARGET SHORTFALL TO BAGS"] = "补货到背包"
TSM.L["Tasks Added to Task List"] = "添加到任务列表"
TSM.L["Text (%s)"] = "文本 (%s)"
TSM.L["The canlearn filter was ignored because the CanIMogIt addon was not found."] = "canlearn过滤被忽略，因为找不到CanIMogIt插件。"
--[[Translation missing --]]
TSM.L["The 'Craft Value Method' (%s) did not return a value for this item."] = "The 'Craft Value Method' (%s) did not return a value for this item."
TSM.L["The 'disenchant' price source has been replaced by the more general 'destroy' price source. Please update your custom prices."] = "“分解”价格来源已经被通用“摧毁”价格来源重置。请更新自定义价格。"
TSM.L["The min profit (%s) did not evalulate to a valid value for this item."] = "最低利润（％s）未评估此物品的有效值"
TSM.L["The name can ONLY contain letters. No spaces, numbers, or special characters."] = "该名称只能包含字母。不能有空格，数字或特殊字符。"
TSM.L["The number which would be queued (%d) is less than the min restock quantity (%d)."] = "请求数量 (%d)小于最低重新补货数量 (%d)"
TSM.L["The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."] = "应用于此物品的操作无效！ ％d最小补货高于％d的最大补货。"
TSM.L["The player \"%s\" is already on your whitelist."] = "玩家\"%s\"已经在白名单中"
TSM.L["The profit of this item (%s) is below the min profit (%s)."] = "此物品的利润 (%s)低于最低利润(%s)"
TSM.L["The seller name of the lowest auction for %s was not given by the server. Skipping this item."] = "%s最低价卖家名未提交到服务器。忽略此物品"
TSM.L["The TradeSkillMaster_AppHelper addon is not enabled and is required for proper operation of TSM. TSM has enabled it and requires a reload."] = "TSM正常运行所需的TradeSkillMaster_AppHelper插件未启用, TSM已启用它,请重载界面"
TSM.L["The TradeSkillMaster_AppHelper addon is not installed and is required for proper operation of TSM."] = "TSM正常运行所需的TradeSkillMaster_AppHelper插件未启用"
TSM.L["The unlearned filter was ignored because the CanIMogIt addon was not found."] = "unlearned过滤被忽略，因为找不到CanIMogIt插件"
TSM.L["There is a crafting cost and crafted item value, but TSM_Crafting wasn't able to calculate a profit. This shouldn't happen!"] = "存在制造成本和制造价值，但TSM_Crafting无法计算利润。 这不应该发生！"
TSM.L["There is no TSM_Crafting operation applied to this item's TSM group (%s)."] = "没有TSM_Crafting操作应用于该物品的TSM分组（％s）"
TSM.L["This group already has operations. Would you like to add another one or replace the last one?"] = "该分组已经拥有操作，您希望新增一个操作还是取代之前的操作？"
TSM.L["This group already has the max number of operation. Would you like to replace the last one?"] = "该分组已经拥有最大数量的操作了，您希望取代之前的操作吗？"
TSM.L["This is not a valid profile name. Profile names must be at least one character long and may not contain '@' characters."] = "这是一个非法的配置文件名。配置文件名必须至少有一个字符长度并且不包含@字符。"
TSM.L["This item does not have a crafting cost. Check that all of its mats have mat prices."] = "此物品没有制造成本。 检查所有材料是否有材料价格"
TSM.L["This item is not in a TSM group."] = "此物品不在TSM分组"
TSM.L["This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general TSM_Crafting options."] = "当您补货该分组时，此物品将添加到队列中。 如果没有发生这种情况，请在TSM论坛上发布帖子，其中包含物品鼠标提示，操作设置和常规TSM_Crafting选项的屏幕截图"
TSM.L["This looks like an exported operation and not a custom price."] = "这看起来想一个导出操作而不是一个自定义价格。"
TSM.L["This will copy the settings from '%s' into your currently-active one."] = "将'％s'中的设置复制到当前活动的设置中。"
TSM.L["This will permanently delete the '%s' profile."] = "此操作将永久删除'％s'配置档"
TSM.L["This will reset all groups and operations (if not stored globally) to be wiped from this profile."] = "此操作将重置所有分组和操作（如果未全局保存）。"
TSM.L["Time"] = "时间"
TSM.L["Time Format"] = "时间格式"
TSM.L["Time Frame"] = "时限"
TSM.L["TIME FRAME"] = "时限"
TSM.L["TINKER"] = "修理"
TSM.L["Tooltip Price Format"] = "鼠标提示价格格式"
TSM.L["Tooltip Settings"] = "鼠标提示设置"
TSM.L["Top Buyers:"] = "TOP 买家:"
TSM.L["Top Item:"] = "TOP 物品:"
TSM.L["Top Sellers:"] = "TOP 卖家:"
TSM.L["Total"] = "总计"
TSM.L["Total Gold"] = "总金币"
TSM.L["Total Gold Earned:"] = "获得的总金额"
TSM.L["Total Gold Spent:"] = "花费总金币"
TSM.L["Total Price"] = "总价格"
TSM.L["Total Profit:"] = "总利润："
TSM.L["Total Value"] = "总价值"
TSM.L["Total Value of All Items: "] = "所有物品的总价值："
--[[Translation missing --]]
TSM.L["Track Sales / Purchases via trade"] = "Track Sales / Purchases via trade"
TSM.L["TradeSkillMaster Info"] = "TradeSkillMaster Info"
TSM.L["Transform Value"] = "转化价格"
TSM.L["TSM Banking"] = "TSM 银行"
TSM.L["TSM can sync data automatically between multiple accounts."] = "TSM 可以自动同步多个账号"
TSM.L["TSM Crafting"] = "TSM 制造"
TSM.L["TSM Destroying"] = "TSM 分解"
TSM.L["TSM failed to scan some auctions. Please rerun the scan."] = "TSM未能扫描拍卖。 请重新运行扫描。"
TSM.L["TSM Groups"] = "TSM 分组"
TSM.L["TSM is missing important information from the TSM Desktop Application. Please ensure the TSM Desktop Application is running and is properly configured."] = "TSM缺少TSM桌面应用程序的重要信息。 请确保TSM桌面应用程序正在运行且配置正确。"
TSM.L["TSM Mailing"] = "TSM Mailing"
TSM.L["TSM TASK LIST"] = "TSM 任务列表"
TSM.L["TSM Vendoring"] = "TSM Vendoring"
TSM.L["TSM Version Info:"] = "TSM版本信息："
TSM.L["TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"] = "TSM_Accounting检测到您刚刚交易％s％s以赚取％s。 您希望Accounting模块存储此交易的记录吗？"
TSM.L["TSM4"] = "TSM4"
TSM.L["TUJ 3-Day Price"] = "TUJ中近3日价格"
TSM.L["Twitter Integration"] = "整合推特"
TSM.L["Twitter Integration Not Enabled"] = "Twitter整合未启用"
TSM.L["Type"] = "类型"
TSM.L["Type Something"] = "输入一些东西"
TSM.L["Unbalanced parentheses."] = "残缺的括号。"
TSM.L["Undercut amount:"] = "压价金额:"
TSM.L["Undercut by whitelisted player."] = "被白名单玩家压价"
TSM.L["Undercutting blacklisted player."] = "压价黑名单"
TSM.L["Undercutting competition."] = "压价发布"
TSM.L["Ungrouped Items"] = "未分组的物品"
TSM.L["Unknown Item"] = "未知物品"
TSM.L["Unwrap Gift"] = "打开礼物包裹"
TSM.L["Up"] = "向上"
TSM.L["UPDATE EXISTING MACRO"] = "更新已有的宏"
TSM.L["Usage: /tsm price <ItemLink> <Price String>"] = "用法：/tsm price <物品链接> <价格字符串>"
TSM.L["Use smart average for purchase price"] = " 使用智能均价作为购买价"
TSM.L["Use the field below to search the auction house by filter"] = "使用下面的字段按过滤搜索拍卖行"
TSM.L["Use the list to the left to select groups, & operations you'd like to create export strings for."] = "使用左侧的列表选择要为其创建导出字符串的分组和操作。"
TSM.L["VALUE PRICE SOURCE"] = "价格来源"
TSM.L["ValueSources"] = "价格来源"
TSM.L["Variable Name"] = "变量名"
TSM.L["Vendor"] = "NPC"
TSM.L["Vendor Buy Price"] = "NPC购买价"
TSM.L["Vendor Search"] = "卖店价搜索"
TSM.L["VENDOR SEARCH"] = "卖店价搜索"
TSM.L["Vendor Sell"] = "出售NPC"
TSM.L["Vendor Sell Price"] = "NPC出售价"
TSM.L["Vendoring 'SELL ALL' Button"] = "NPC \"出售所有\" 按钮"
TSM.L["View ignored items in the Destroying options."] = "在分解选项中查看忽略的物品"
TSM.L["Warehousing"] = "Warehousing"
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing会移动这个分组中每种物品最多%d件, 当从背包→银行/公会银行时每种物品保留%d件, 当从银行/公会银行→背包时每种物品保留%d件"
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing会移动这个分组中每种物品最多%d件, 当从背包→银行/公会银行时每种物品保留%d件, 当从银行/公会银行→背包时每种物品保留%d件. 补货会保留%d件物品在你的背包里"
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing会移动这个分组中每种物品最多%d件, 当从背包→银行/公会银行时每种物品保留%d件"
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing会移动这个分组中每种物品最多%d件, 当从背包→银行/公会银行时每种物品保留%d件. 补货会保留%d件物品在你的背包里"
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing会移动这个分组中每种物品最多%d件, 当从银行/公会银行→背包时每种物品保留%d件"
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing会移动这个分组中每种物品最多%d件, 当从银行/公会银行→背包时每种物品保留%d件。补货会保留%d件物品在背包里"
TSM.L["Warehousing will move a max of %d of each item in this group."] = "Warehousing会移动这个分组中每种物品最多%d件"
TSM.L["Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."] = "Warehousing会移动这个分组中每种物品最多%d件。补货会保留%d件物品在背包里"
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing会移动这个分组的所有物品, 当从背包→银行/公会银行时每种物品保留%d件, 当从银行/公会银行→背包时每种物品保留%d件"
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing会移动这个分组的所有物品, 当从背包→银行/公会银行时每种物品保留%d件, 当从银行/公会银行→背包时每种物品保留%d件。补货会在背包里保留%d件物品"
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing会移动这个分组的所有物品, 当从背包→银行/公会银行时每种物品保留%d件"
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing会移动这个分组的所有物品, 当从背包→银行/公会银行时每种物品保留%d。补货会在背包里保留%d件物品"
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing会移动这个分组的所有物品, 当从银行/公会银行→背包时每种物品保留%d件"
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "当银行/工会银行>背包物品时仓库将移动该组中的所有物品，每个物品的％d保持不变。补货将在你的背包中保留％d。"
TSM.L["Warehousing will move all of the items in this group."] = "移动所有Warehousing物品到该分组"
TSM.L["Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."] = "Warehousing将移动该组中的所有项目。补货将在你的背包中保留％d物品。"
TSM.L["WARNING: The macro was too long, so was truncated to fit by WoW."] = "警告：宏过长，将被调整到适合的长度。"
TSM.L["WARNING: You minimum price for %s is below its vendorsell price (with AH cut taken into account). Consider raising your minimum price, or vendoring the item."] = "警告：你的  %s 的最低价格比卖给商人的价格更低（包含AH的手续费）。考虑提高你的最低价，或者直接卖店。"
TSM.L["When above maximum:"] = "当超过最大值："
TSM.L["When below minimum:"] = "当小于最小值："
TSM.L["Whitelist"] = "白名单"
TSM.L["Whitelisted Players"] = "白名单玩家"
TSM.L["You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"] = "已经拥有此物品的的最多补货量。 已经有％d，最多补货量是％d"
TSM.L["You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."] = "您可以使用以下选项清除旧数据。 建议偶尔清除旧数据，以遍accounting模块顺利运行。 选择要删除的最小天数，然后单击“％s”。"
TSM.L["You cannot use %s as part of this custom price."] = "您不能使用 %s 作为自定义价格。"
TSM.L["You cannot use %s within convert() as part of this custom price."] = "你不能使用不超过 转化价的%s作为自定义价格。"
TSM.L["You do not need to add \"%s\", alts are whitelisted automatically."] = "无需添加“％s”，小号会自动列入白名单。"
TSM.L["You don't know how to craft this item."] = "不知道如何制作此物品"
TSM.L["You must reload your UI for these settings to take effect. Reload now?"] = "你需要重载UI来使这些改动生效。是否现在重载？"
TSM.L["You won an auction for %sx%d for %s"] = "你成功购买%sx%s从%s"
TSM.L["Your auction has not been undercut."] = "未被压价"
TSM.L["Your auction of %s expired"] = "您的％s拍卖已过期"
TSM.L["Your auction of %s has sold for %s!"] = "你的%s拍卖以%s的价格卖出！"
TSM.L["Your Buyout"] = "你的一口价"
TSM.L["Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"] = "'％s'制造方法无效，因此已返回默认值。 细节：％s"
TSM.L["Your default craft value method was invalid so it has been returned to the default. Details: %s"] = "你的默认制造价值方法是无效的，所以已经回到初始状态。详细: %s"
TSM.L["Your task list is currently empty."] = "你的任务列表现在是空的。"
TSM.L["You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."] = "由于暴雪结束时的错误导致AH停止工作，因此您已经分阶段进行了最小化。 请关闭并重新打开AH并重新启动Sniper"
TSM.L["You've been undercut."] = "已被压价。"
TSM.L["YY/MM/DD HH:MM"] = "YY/MM/DD HH:MM"
	elseif locale == "zhTW" then
TSM.L = TSM.L or {}
--[[Translation missing --]]
TSM.L["%d |4Group:Groups; Selected (%d |4Item:Items;)"] = "%d |4Group:Groups; Selected (%d |4Item:Items;)"
--[[Translation missing --]]
TSM.L["%d auctions"] = "%d auctions"
--[[Translation missing --]]
TSM.L["%d Groups"] = "%d Groups"
--[[Translation missing --]]
TSM.L["%d Items"] = "%d Items"
--[[Translation missing --]]
TSM.L["%d of %d"] = "%d of %d"
--[[Translation missing --]]
TSM.L["%d Operations"] = "%d Operations"
--[[Translation missing --]]
TSM.L["%d Posted Auctions"] = "%d Posted Auctions"
--[[Translation missing --]]
TSM.L["%d Sold Auctions"] = "%d Sold Auctions"
TSM.L["%s (%s bags, %s bank, %s AH, %s mail)"] = "%s (%s 包包, %s 銀行, %s 拍賣場, %s 信箱)"
--[[Translation missing --]]
TSM.L["%s (%s player, %s alts, %s guild, %s AH)"] = "%s (%s player, %s alts, %s guild, %s AH)"
--[[Translation missing --]]
TSM.L["%s (%s profit)"] = "%s (%s profit)"
TSM.L["%s ago"] = "%s前"
--[[Translation missing --]]
TSM.L["%s Crafts"] = "%s Crafts"
--[[Translation missing --]]
TSM.L["%s in guild vault"] = "%s in guild vault"
TSM.L["%s is a valid custom price but %s is an invalid item."] = "%s 是一個有效的自定義價格但 %s 是一個無效的物品。"
TSM.L["%s is a valid custom price but did not give a value for %s."] = "%s 是一個有效的自定義價格但沒有為 %s 給出一個值。"
--[[Translation missing --]]
TSM.L["'%s' is an invalid operation! Min restock of %d is higher than max restock of %d."] = "'%s' is an invalid operation! Min restock of %d is higher than max restock of %d."
TSM.L["%s is not a valid custom price and gave the following error: %s"] = "%s 不是一個有效的自定義價格,錯誤資訊: %s"
--[[Translation missing --]]
TSM.L["%s operation(s)"] = "%s operation(s)"
TSM.L["%s removed."] = "%s 移除."
--[[Translation missing --]]
TSM.L["%s sent you %s"] = "%s sent you %s"
--[[Translation missing --]]
TSM.L["%s sent you %s and %s"] = "%s sent you %s and %s"
--[[Translation missing --]]
TSM.L["%s sent you a COD of %s for %s"] = "%s sent you a COD of %s for %s"
--[[Translation missing --]]
TSM.L["%s sent you a message: %s"] = "%s sent you a message: %s"
TSM.L["%s total"] = "%s 全部"
TSM.L["%sDrag%s to move this button"] = "%s拖曳%s 移動該按紐"
TSM.L["%sLeft-Click%s to open the main window"] = "%s點擊%s 開啟主視窗"
--[[Translation missing --]]
TSM.L["(%d/500 Characters)"] = "(%d/500 Characters)"
--[[Translation missing --]]
TSM.L["(max %d)"] = "(max %d)"
--[[Translation missing --]]
TSM.L["(max 200)"] = "(max 200)"
--[[Translation missing --]]
TSM.L["(max 5000)"] = "(max 5000)"
--[[Translation missing --]]
TSM.L["(min %d - max %d)"] = "(min %d - max %d)"
--[[Translation missing --]]
TSM.L["(min 0 - max 10000)"] = "(min 0 - max 10000)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 2)"] = "(minimum 0 - maximum 2)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 20)"] = "(minimum 0 - maximum 20)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 2000)"] = "(minimum 0 - maximum 2000)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 30)"] = "(minimum 0 - maximum 30)"
--[[Translation missing --]]
TSM.L["(minimum 0 - maximum 905)"] = "(minimum 0 - maximum 905)"
--[[Translation missing --]]
TSM.L["(minimum 0% - maximum 50%)"] = "(minimum 0% - maximum 50%)"
--[[Translation missing --]]
TSM.L["(minimum 0.5 - maximum 10)"] = "(minimum 0.5 - maximum 10)"
--[[Translation missing --]]
TSM.L["(minimum 1 - maximum 100)"] = "(minimum 1 - maximum 100)"
--[[Translation missing --]]
TSM.L["(minimum 8 - maximum 25)"] = "(minimum 8 - maximum 25)"
--[[Translation missing --]]
TSM.L["(New group(s) will be created)"] = "(New group(s) will be created)"
TSM.L["/tsm help|r - Shows this help listing"] = "/tsm help|r - 顯示幫助列表"
TSM.L["/tsm|r - opens the main TSM window."] = "/tsm|r - 開啟TSM主視窗。"
--[[Translation missing --]]
TSM.L["_ Hr _ Min ago"] = "_ Hr _ Min ago"
--[[Translation missing --]]
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."] = "|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of purchase data has been preserved."
--[[Translation missing --]]
TSM.L["|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."] = "|cffff0000IMPORTANT:|r When TSM_Accounting last saved data for this realm, it was too big for WoW to handle, so old data was automatically trimmed in order to avoid corruption of the saved variables. The last %s of sale data has been preserved."
--[[Translation missing --]]
TSM.L["|cffff0000WARNING:|r TSM_AuctionDB doesn't currently have any pricing data for your realm. Either download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update TSM_AuctionDB's data, or run a manual scan in-game."] = "|cffff0000WARNING:|r TSM_AuctionDB doesn't currently have any pricing data for your realm. Either download the TSM Desktop Application from |cff99ffffhttp://tradeskillmaster.com|r to automatically update TSM_AuctionDB's data, or run a manual scan in-game."
--[[Translation missing --]]
TSM.L["|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."] = "|cffffd839Left-Click|r to ignore an item for this session. Hold |cffffd839Shift|r to ignore permanently. You can remove items from permanent ignore in the Vendoring settings."
--[[Translation missing --]]
TSM.L["|cffffd839Left-Click|r to ignore an item this session."] = "|cffffd839Left-Click|r to ignore an item this session."
--[[Translation missing --]]
TSM.L["|cffffd839Shift-Left-Click|r to ignore it permanently."] = "|cffffd839Shift-Left-Click|r to ignore it permanently."
--[[Translation missing --]]
TSM.L["1 Group"] = "1 Group"
--[[Translation missing --]]
TSM.L["1 Item"] = "1 Item"
TSM.L["12 hr"] = "12小時"
TSM.L["24 hr"] = "24小時"
TSM.L["48 hr"] = "48小時"
TSM.L["A custom price of %s for %s evaluates to %s."] = "%s的自定義價格為%s到%s。"
TSM.L["A maximum of 1 convert() function is allowed."] = "最多只允許1個convert()函數。"
--[[Translation missing --]]
TSM.L["A scan is already in progress. Please stop that scan before starting another one."] = "A scan is already in progress. Please stop that scan before starting another one."
--[[Translation missing --]]
TSM.L["Above max expires."] = "Above max expires."
--[[Translation missing --]]
TSM.L["Above max price. Not posting."] = "Above max price. Not posting."
--[[Translation missing --]]
TSM.L["Above max price. Posting at max price."] = "Above max price. Posting at max price."
--[[Translation missing --]]
TSM.L["Above max price. Posting at min price."] = "Above max price. Posting at min price."
--[[Translation missing --]]
TSM.L["Above max price. Posting at normal price."] = "Above max price. Posting at normal price."
--[[Translation missing --]]
TSM.L["Accepting these item(s) will cost"] = "Accepting these item(s) will cost"
--[[Translation missing --]]
TSM.L["Accepting this item will cost"] = "Accepting this item will cost"
--[[Translation missing --]]
TSM.L["Account sync removed. Please delete the account sync from the other account as well."] = "Account sync removed. Please delete the account sync from the other account as well."
TSM.L["Account Syncing"] = "帳戶同步"
--[[Translation missing --]]
TSM.L["Accounting"] = "Accounting"
--[[Translation missing --]]
TSM.L["Accounting Tooltips"] = "Accounting Tooltips"
--[[Translation missing --]]
TSM.L["Activity Type"] = "Activity Type"
--[[Translation missing --]]
TSM.L["ADD %d ITEMS"] = "ADD %d ITEMS"
--[[Translation missing --]]
TSM.L["Add / Remove Items"] = "Add / Remove Items"
--[[Translation missing --]]
TSM.L["ADD NEW CUSTOM PRICE SOURCE"] = "ADD NEW CUSTOM PRICE SOURCE"
--[[Translation missing --]]
TSM.L["ADD OPERATION"] = "ADD OPERATION"
--[[Translation missing --]]
TSM.L["Add Player"] = "Add Player"
--[[Translation missing --]]
TSM.L["Add Subject / Description"] = "Add Subject / Description"
--[[Translation missing --]]
TSM.L["Add Subject / Description (Optional)"] = "Add Subject / Description (Optional)"
--[[Translation missing --]]
TSM.L["ADD TO MAIL"] = "ADD TO MAIL"
TSM.L["Additional error suppressed"] = "隱藏的其他錯誤"
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be auctioned."] = "Adjust the settings below to set how groups attached to this operation will be auctioned."
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be cancelled."] = "Adjust the settings below to set how groups attached to this operation will be cancelled."
--[[Translation missing --]]
TSM.L["Adjust the settings below to set how groups attached to this operation will be priced."] = "Adjust the settings below to set how groups attached to this operation will be priced."
--[[Translation missing --]]
TSM.L["Advanced Item Search"] = "Advanced Item Search"
--[[Translation missing --]]
TSM.L["Advanced Options"] = "Advanced Options"
TSM.L["AH"] = "拍賣場"
--[[Translation missing --]]
TSM.L["AH (Crafting)"] = "AH (Crafting)"
--[[Translation missing --]]
TSM.L["AH (Disenchanting)"] = "AH (Disenchanting)"
--[[Translation missing --]]
TSM.L["AH BUSY"] = "AH BUSY"
--[[Translation missing --]]
TSM.L["AH Frame Options"] = "AH Frame Options"
--[[Translation missing --]]
TSM.L["AH Rows Shown (requires reload)"] = "AH Rows Shown (requires reload)"
TSM.L["Alarm Clock"] = "警示鐘"
--[[Translation missing --]]
TSM.L["All Auctions"] = "All Auctions"
--[[Translation missing --]]
TSM.L["All Characters and Guilds"] = "All Characters and Guilds"
--[[Translation missing --]]
TSM.L["All Professions"] = "All Professions"
--[[Translation missing --]]
TSM.L["Allow partial stack?"] = "Allow partial stack?"
--[[Translation missing --]]
TSM.L["Alt Guild Bank"] = "Alt Guild Bank"
--[[Translation missing --]]
TSM.L["Alts"] = "Alts"
--[[Translation missing --]]
TSM.L["Alts AH"] = "Alts AH"
--[[Translation missing --]]
TSM.L["Amount"] = "Amount"
--[[Translation missing --]]
TSM.L["AMOUNT"] = "AMOUNT"
--[[Translation missing --]]
TSM.L["Amount of Bag Space to Keep Free"] = "Amount of Bag Space to Keep Free"
TSM.L["Applied %s to %s."] = "將%s應用到%s。"
--[[Translation missing --]]
TSM.L["APPLY FILTERS"] = "APPLY FILTERS"
--[[Translation missing --]]
TSM.L["Apply operation to group:"] = "Apply operation to group:"
--[[Translation missing --]]
TSM.L["Are you sure you want to clear old accounting data?"] = "Are you sure you want to clear old accounting data?"
TSM.L["Are you sure you want to delete this group?"] = "你確定要取消這個群組?"
TSM.L["Are you sure you want to delete this operation?"] = "你確定要取消這個動作?"
--[[Translation missing --]]
TSM.L["Are you sure you want to reset all operation settings?"] = "Are you sure you want to reset all operation settings?"
--[[Translation missing --]]
TSM.L["At above max price and not undercut."] = "At above max price and not undercut."
--[[Translation missing --]]
TSM.L["At normal price and not undercut."] = "At normal price and not undercut."
--[[Translation missing --]]
TSM.L["Auction"] = "Auction"
--[[Translation missing --]]
TSM.L["AUCTION DETAILS"] = "AUCTION DETAILS"
--[[Translation missing --]]
TSM.L["Auction Duration"] = "Auction Duration"
--[[Translation missing --]]
TSM.L["Auction has been bid on."] = "Auction has been bid on."
TSM.L["Auction Window Close"] = "關閉拍賣視窗"
TSM.L["Auction Window Open"] = "開啟拍賣視窗"
TSM.L["Auctionator - Auction Value"] = "Auctionator - 拍賣價格"
TSM.L["Auctioneer - Appraiser"] = "Auctioneer - 出價"
TSM.L["Auctioneer - Market Value"] = "Auctioneer - 市場價格"
TSM.L["Auctioneer - Minimum Buyout"] = "Auctioneer - 最小直購價"
--[[Translation missing --]]
TSM.L["Auctioning"] = "Auctioning"
--[[Translation missing --]]
TSM.L["Auctioning Log"] = "Auctioning Log"
--[[Translation missing --]]
TSM.L["Auctioning Operation"] = "Auctioning Operation"
--[[Translation missing --]]
TSM.L["Auctioning 'POST'/'CANCEL' Button"] = "Auctioning 'POST'/'CANCEL' Button"
TSM.L["Auctions"] = "拍賣"
--[[Translation missing --]]
TSM.L["Auto Quest Complete"] = "Auto Quest Complete"
--[[Translation missing --]]
TSM.L["Automatically sell vendor trash?"] = "Automatically sell vendor trash?"
--[[Translation missing --]]
TSM.L["Average Earned Per Day:"] = "Average Earned Per Day:"
--[[Translation missing --]]
TSM.L["Average Prices:"] = "Average Prices:"
--[[Translation missing --]]
TSM.L["Average Profit Per Day:"] = "Average Profit Per Day:"
--[[Translation missing --]]
TSM.L["Average Spent Per Day:"] = "Average Spent Per Day:"
--[[Translation missing --]]
TSM.L["Avg Buy Price"] = "Avg Buy Price"
--[[Translation missing --]]
TSM.L["Avg Resale Profit"] = "Avg Resale Profit"
--[[Translation missing --]]
TSM.L["Avg Sell Price"] = "Avg Sell Price"
--[[Translation missing --]]
TSM.L["BACK TO LIST"] = "BACK TO LIST"
--[[Translation missing --]]
TSM.L["Back to List"] = "Back to List"
--[[Translation missing --]]
TSM.L["Bag"] = "Bag"
TSM.L["Bags"] = "包包"
--[[Translation missing --]]
TSM.L["Banks"] = "Banks"
--[[Translation missing --]]
TSM.L["BankUI Move Delay"] = "BankUI Move Delay"
--[[Translation missing --]]
TSM.L["Base Group"] = "Base Group"
--[[Translation missing --]]
TSM.L["Base Item"] = "Base Item"
--[[Translation missing --]]
TSM.L["Batch size"] = "Batch size"
--[[Translation missing --]]
TSM.L["Below are your currently available price sources organized by module. The %skey|r is what you would type into a custom price box."] = "Below are your currently available price sources organized by module. The %skey|r is what you would type into a custom price box."
--[[Translation missing --]]
TSM.L["Below custom price:"] = "Below custom price:"
--[[Translation missing --]]
TSM.L["Below min price. Posting at max price."] = "Below min price. Posting at max price."
--[[Translation missing --]]
TSM.L["Below min price. Posting at min price."] = "Below min price. Posting at min price."
--[[Translation missing --]]
TSM.L["Below min price. Posting at normal price."] = "Below min price. Posting at normal price."
--[[Translation missing --]]
TSM.L["Below, you can manage your profiles which allow you to have entirely different sets of groups."] = "Below, you can manage your profiles which allow you to have entirely different sets of groups."
--[[Translation missing --]]
TSM.L["Bid %d / %d"] = "Bid %d / %d"
--[[Translation missing --]]
TSM.L["Bid (item)"] = "Bid (item)"
--[[Translation missing --]]
TSM.L["Bid (stack)"] = "Bid (stack)"
--[[Translation missing --]]
TSM.L["Bid Price"] = "Bid Price"
--[[Translation missing --]]
TSM.L["Bid Sniper Paused"] = "Bid Sniper Paused"
--[[Translation missing --]]
TSM.L["Bid Sniper Running"] = "Bid Sniper Running"
--[[Translation missing --]]
TSM.L["Blacklisted players:"] = "Blacklisted players:"
--[[Translation missing --]]
TSM.L["Bought"] = "Bought"
--[[Translation missing --]]
TSM.L["Bought %sx%d for %s from %s"] = "Bought %sx%d for %s from %s"
--[[Translation missing --]]
TSM.L["Bound Actions"] = "Bound Actions"
--[[Translation missing --]]
TSM.L["BUSY"] = "BUSY"
--[[Translation missing --]]
TSM.L["BUY"] = "BUY"
--[[Translation missing --]]
TSM.L["Buy"] = "Buy"
--[[Translation missing --]]
TSM.L["Buy %d / %d"] = "Buy %d / %d"
--[[Translation missing --]]
TSM.L["Buy %d / %d (Confirming %d / %d)"] = "Buy %d / %d (Confirming %d / %d)"
--[[Translation missing --]]
TSM.L["Buy from AH"] = "Buy from AH"
TSM.L["Buy from Vendor"] = "向商人購買"
--[[Translation missing --]]
TSM.L["BUY GROUPS"] = "BUY GROUPS"
--[[Translation missing --]]
TSM.L["Buy Options"] = "Buy Options"
--[[Translation missing --]]
TSM.L["BUYBACK ALL"] = "BUYBACK ALL"
--[[Translation missing --]]
TSM.L["Buyer/Seller"] = "Buyer/Seller"
--[[Translation missing --]]
TSM.L["Buyout (item)"] = "Buyout (item)"
--[[Translation missing --]]
TSM.L["Buyout (stack)"] = "Buyout (stack)"
--[[Translation missing --]]
TSM.L["Buyout Price"] = "Buyout Price"
--[[Translation missing --]]
TSM.L["Buyout Sniper Paused"] = "Buyout Sniper Paused"
--[[Translation missing --]]
TSM.L["Buyout Sniper Running"] = "Buyout Sniper Running"
--[[Translation missing --]]
TSM.L["BUYS"] = "BUYS"
--[[Translation missing --]]
TSM.L["By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."] = "By default, this group houses all items that aren't assigned to a group. You cannot modify or delete this group."
--[[Translation missing --]]
TSM.L["Can Craft At Least One, Profit, Craftable Quantity"] = "Can Craft At Least One, Profit, Craftable Quantity"
--[[Translation missing --]]
TSM.L["Cancel auctions with bids"] = "Cancel auctions with bids"
--[[Translation missing --]]
TSM.L["Cancel Scan"] = "Cancel Scan"
--[[Translation missing --]]
TSM.L["Cancel to repost higher?"] = "Cancel to repost higher?"
--[[Translation missing --]]
TSM.L["Cancel undercut auctions?"] = "Cancel undercut auctions?"
--[[Translation missing --]]
TSM.L["Canceling"] = "Canceling"
--[[Translation missing --]]
TSM.L["Canceling %d / %d"] = "Canceling %d / %d"
--[[Translation missing --]]
TSM.L["Canceling %d Auctions..."] = "Canceling %d Auctions..."
--[[Translation missing --]]
TSM.L["Canceling all auctions."] = "Canceling all auctions."
--[[Translation missing --]]
TSM.L["Canceling auction which you've undercut."] = "Canceling auction which you've undercut."
--[[Translation missing --]]
TSM.L["Canceling disabled."] = "Canceling disabled."
--[[Translation missing --]]
TSM.L["Canceling Settings"] = "Canceling Settings"
--[[Translation missing --]]
TSM.L["Canceling to repost at higher price."] = "Canceling to repost at higher price."
--[[Translation missing --]]
TSM.L["Canceling to repost at reset price."] = "Canceling to repost at reset price."
--[[Translation missing --]]
TSM.L["Canceling to repost higher."] = "Canceling to repost higher."
--[[Translation missing --]]
TSM.L["Canceling undercut auctions and to repost higher."] = "Canceling undercut auctions and to repost higher."
--[[Translation missing --]]
TSM.L["Canceling undercut auctions."] = "Canceling undercut auctions."
--[[Translation missing --]]
TSM.L["Cancelled"] = "Cancelled"
--[[Translation missing --]]
TSM.L["Cancelled auction of %sx%d"] = "Cancelled auction of %sx%d"
--[[Translation missing --]]
TSM.L["Cancelled Since Last Sale"] = "Cancelled Since Last Sale"
--[[Translation missing --]]
TSM.L["CANCELS"] = "CANCELS"
--[[Translation missing --]]
TSM.L["Cannot repair from the guild bank!"] = "Cannot repair from the guild bank!"
TSM.L["Can't load TSM tooltip while in combat"] = "戰鬥中無法載入TSM提示"
--[[Translation missing --]]
TSM.L["Cash Register"] = "Cash Register"
--[[Translation missing --]]
TSM.L["Character"] = "Character"
--[[Translation missing --]]
TSM.L["CHARACTER"] = "CHARACTER"
--[[Translation missing --]]
TSM.L["Character Bags"] = "Character Bags"
--[[Translation missing --]]
TSM.L["Character Bank"] = "Character Bank"
--[[Translation missing --]]
TSM.L["CHARACTERS"] = "CHARACTERS"
TSM.L["Chat Tab"] = "聊天標籤"
--[[Translation missing --]]
TSM.L["Cheapest auction below min price."] = "Cheapest auction below min price."
--[[Translation missing --]]
TSM.L["Clean Automatically"] = "Clean Automatically"
TSM.L["Clear"] = "清除"
--[[Translation missing --]]
TSM.L["Clear All"] = "Clear All"
--[[Translation missing --]]
TSM.L["CLEAR DATA"] = "CLEAR DATA"
--[[Translation missing --]]
TSM.L["Clear Filters"] = "Clear Filters"
--[[Translation missing --]]
TSM.L["Clear Log After 'X' Amount of Days"] = "Clear Log After 'X' Amount of Days"
--[[Translation missing --]]
TSM.L["Clear Old Data"] = "Clear Old Data"
--[[Translation missing --]]
TSM.L["Clear Old Data Confirmation"] = "Clear Old Data Confirmation"
--[[Translation missing --]]
TSM.L["Clear Queue"] = "Clear Queue"
TSM.L["Clear Selection"] = "消除選擇"
--[[Translation missing --]]
TSM.L["COD"] = "COD"
--[[Translation missing --]]
TSM.L["Coins (%s)"] = "Coins (%s)"
--[[Translation missing --]]
TSM.L["Combine Partial Stacks"] = "Combine Partial Stacks"
--[[Translation missing --]]
TSM.L["Combining..."] = "Combining..."
--[[Translation missing --]]
TSM.L["Configuration Scroll Wheel"] = "Configuration Scroll Wheel"
--[[Translation missing --]]
TSM.L["Confirm"] = "Confirm"
--[[Translation missing --]]
TSM.L["Confirm Complete Sound"] = "Confirm Complete Sound"
--[[Translation missing --]]
TSM.L["Confirming %d / %d"] = "Confirming %d / %d"
--[[Translation missing --]]
TSM.L["Connected to %s"] = "Connected to %s"
--[[Translation missing --]]
TSM.L["Connecting to %s"] = "Connecting to %s"
--[[Translation missing --]]
TSM.L["CONTACTS"] = "CONTACTS"
--[[Translation missing --]]
TSM.L["Contacts Menu"] = "Contacts Menu"
--[[Translation missing --]]
TSM.L["Cooldown"] = "Cooldown"
--[[Translation missing --]]
TSM.L["Cooldowns"] = "Cooldowns"
--[[Translation missing --]]
TSM.L["Cost"] = "Cost"
--[[Translation missing --]]
TSM.L["Could not apply %s operation %s to %s - it has too many operations already."] = "Could not apply %s operation %s to %s - it has too many operations already."
--[[Translation missing --]]
TSM.L["Could not apply %s operation to group %s because the group does not exist"] = "Could not apply %s operation to group %s because the group does not exist"
--[[Translation missing --]]
TSM.L["Could not create macro as you already have too many. Delete one of your existing macros and try again."] = "Could not create macro as you already have too many. Delete one of your existing macros and try again."
--[[Translation missing --]]
TSM.L["Could not deserialize input"] = "Could not deserialize input"
--[[Translation missing --]]
TSM.L["Could not find enchanted item from"] = "Could not find enchanted item from"
--[[Translation missing --]]
TSM.L["Could not find pet"] = "Could not find pet"
--[[Translation missing --]]
TSM.L["Could not find profile '%s'. Possible profiles: '%s'"] = "Could not find profile '%s'. Possible profiles: '%s'"
--[[Translation missing --]]
TSM.L["Could not sell items due to not having free bag space available to split a stack of items."] = "Could not sell items due to not having free bag space available to split a stack of items."
--[[Translation missing --]]
TSM.L["Craft"] = "Craft"
--[[Translation missing --]]
TSM.L["CRAFT"] = "CRAFT"
--[[Translation missing --]]
TSM.L["Craft (Unprofitable)"] = "Craft (Unprofitable)"
--[[Translation missing --]]
TSM.L["Craft (When Profitable)"] = "Craft (When Profitable)"
--[[Translation missing --]]
TSM.L["Craft All"] = "Craft All"
--[[Translation missing --]]
TSM.L["CRAFT ALL"] = "CRAFT ALL"
--[[Translation missing --]]
TSM.L["Craft Name"] = "Craft Name"
--[[Translation missing --]]
TSM.L["CRAFT NEXT"] = "CRAFT NEXT"
--[[Translation missing --]]
TSM.L["Craft value method:"] = "Craft value method:"
--[[Translation missing --]]
TSM.L["Craftable Quantity, Profit"] = "Craftable Quantity, Profit"
--[[Translation missing --]]
TSM.L["CRAFTER"] = "CRAFTER"
--[[Translation missing --]]
TSM.L["CRAFTING"] = "CRAFTING"
--[[Translation missing --]]
TSM.L["Crafting"] = "Crafting"
--[[Translation missing --]]
TSM.L["Crafting Cost"] = "Crafting Cost"
--[[Translation missing --]]
TSM.L["Crafting 'CRAFT NEXT' Button"] = "Crafting 'CRAFT NEXT' Button"
--[[Translation missing --]]
TSM.L["Crafting Queue"] = "Crafting Queue"
--[[Translation missing --]]
TSM.L["Crafting Tooltips"] = "Crafting Tooltips"
--[[Translation missing --]]
TSM.L["Crafts"] = "Crafts"
--[[Translation missing --]]
TSM.L["Crafts %d"] = "Crafts %d"
--[[Translation missing --]]
TSM.L["CREATE MACRO"] = "CREATE MACRO"
--[[Translation missing --]]
TSM.L["Create New Operation"] = "Create New Operation"
--[[Translation missing --]]
TSM.L["CREATE NEW PROFILE"] = "CREATE NEW PROFILE"
TSM.L["Crystals"] = "水晶"
--[[Translation missing --]]
TSM.L["Current Profiles"] = "Current Profiles"
--[[Translation missing --]]
TSM.L["CURRENT SEARCH"] = "CURRENT SEARCH"
--[[Translation missing --]]
TSM.L["CUSTOM POST"] = "CUSTOM POST"
--[[Translation missing --]]
TSM.L["Custom Price"] = "Custom Price"
TSM.L["Custom Price Source"] = "自定義價格源"
--[[Translation missing --]]
TSM.L["Custom Sources"] = "Custom Sources"
--[[Translation missing --]]
TSM.L["Database Sources"] = "Database Sources"
--[[Translation missing --]]
TSM.L["DD/MM/YY HH:MM"] = "DD/MM/YY HH:MM"
--[[Translation missing --]]
TSM.L["Default Craft Value Method:"] = "Default Craft Value Method:"
--[[Translation missing --]]
TSM.L["Default Material Cost Method:"] = "Default Material Cost Method:"
--[[Translation missing --]]
TSM.L["Default Price"] = "Default Price"
--[[Translation missing --]]
TSM.L["Default Price Configuration"] = "Default Price Configuration"
--[[Translation missing --]]
TSM.L["Default vendoring page"] = "Default vendoring page"
--[[Translation missing --]]
TSM.L["Define whet priority Gathering gives certain sources."] = "Define whet priority Gathering gives certain sources."
--[[Translation missing --]]
TSM.L["Delete Profile Confirmation"] = "Delete Profile Confirmation"
--[[Translation missing --]]
TSM.L["DEPOSIT REAGENTS"] = "DEPOSIT REAGENTS"
TSM.L["Deselect All Groups"] = "取消所有分組選定"
--[[Translation missing --]]
TSM.L["Deselect All Items"] = "Deselect All Items"
--[[Translation missing --]]
TSM.L["Destroy Next"] = "Destroy Next"
--[[Translation missing --]]
TSM.L["Destroy Value"] = "Destroy Value"
--[[Translation missing --]]
TSM.L["Destroy Value Source"] = "Destroy Value Source"
--[[Translation missing --]]
TSM.L["Destroying"] = "Destroying"
--[[Translation missing --]]
TSM.L["Destroying 'DESTROY NEXT' Button"] = "Destroying 'DESTROY NEXT' Button"
--[[Translation missing --]]
TSM.L["Destroying Tooltips"] = "Destroying Tooltips"
--[[Translation missing --]]
TSM.L["Destroying..."] = "Destroying..."
--[[Translation missing --]]
TSM.L["Details"] = "Details"
--[[Translation missing --]]
TSM.L["Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."] = "Did not cancel %s because your cancel to repost threshold (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your maximum price (%s) is invalid. Check your settings."] = "Did not cancel %s because your maximum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not cancel %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your minimum price (%s) is invalid. Check your settings."] = "Did not cancel %s because your minimum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your normal price (%s) is invalid. Check your settings."] = "Did not cancel %s because your normal price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not cancel %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not cancel %s because your undercut (%s) is invalid. Check your settings."] = "Did not cancel %s because your undercut (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."] = "Did not post %s because Blizzard didn't provide all necessary information for it. Try again later."
--[[Translation missing --]]
TSM.L["Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."] = "Did not post %s because the owner of the lowest auction (%s) is on both the blacklist and whitelist which is not allowed. Adjust your settings to correct this issue."
--[[Translation missing --]]
TSM.L["Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."] = "Did not post %s because you or one of your alts (%s) is on the blacklist which is not allowed. Remove this character from your blacklist."
--[[Translation missing --]]
TSM.L["Did not post %s because your maximum price (%s) is invalid. Check your settings."] = "Did not post %s because your maximum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not post %s because your maximum price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your minimum price (%s) is invalid. Check your settings."] = "Did not post %s because your minimum price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your normal price (%s) is invalid. Check your settings."] = "Did not post %s because your normal price (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."] = "Did not post %s because your normal price (%s) is lower than your minimum price (%s). Check your settings."
--[[Translation missing --]]
TSM.L["Did not post %s because your stack size (%d) is higher than the max stack size of the item (%d)."] = "Did not post %s because your stack size (%d) is higher than the max stack size of the item (%d)."
--[[Translation missing --]]
TSM.L["Did not post %s because your undercut (%s) is invalid. Check your settings."] = "Did not post %s because your undercut (%s) is invalid. Check your settings."
--[[Translation missing --]]
TSM.L["Disable invalid price warnings"] = "Disable invalid price warnings"
--[[Translation missing --]]
TSM.L["Disenchant Search"] = "Disenchant Search"
--[[Translation missing --]]
TSM.L["DISENCHANT SEARCH"] = "DISENCHANT SEARCH"
--[[Translation missing --]]
TSM.L["Disenchant Search Options"] = "Disenchant Search Options"
--[[Translation missing --]]
TSM.L["Disenchant Value"] = "Disenchant Value"
--[[Translation missing --]]
TSM.L["Disenchanting Options"] = "Disenchanting Options"
--[[Translation missing --]]
TSM.L["Display auctioning values"] = "Display auctioning values"
--[[Translation missing --]]
TSM.L["Display cancelled since last sale"] = "Display cancelled since last sale"
--[[Translation missing --]]
TSM.L["Display crafting cost"] = "Display crafting cost"
--[[Translation missing --]]
TSM.L["Display detailed destroy info"] = "Display detailed destroy info"
--[[Translation missing --]]
TSM.L["Display disenchant value"] = "Display disenchant value"
--[[Translation missing --]]
TSM.L["Display global historical price"] = "Display global historical price"
--[[Translation missing --]]
TSM.L["Display global market value avg"] = "Display global market value avg"
--[[Translation missing --]]
TSM.L["Display global min buyout avg"] = "Display global min buyout avg"
--[[Translation missing --]]
TSM.L["Display global sale avg"] = "Display global sale avg"
--[[Translation missing --]]
TSM.L["Display group name"] = "Display group name"
--[[Translation missing --]]
TSM.L["Display historical price"] = "Display historical price"
--[[Translation missing --]]
TSM.L["Display market value"] = "Display market value"
--[[Translation missing --]]
TSM.L["Display mill value"] = "Display mill value"
--[[Translation missing --]]
TSM.L["Display min buyout"] = "Display min buyout"
--[[Translation missing --]]
TSM.L["Display Operation Names"] = "Display Operation Names"
--[[Translation missing --]]
TSM.L["Display prospect value"] = "Display prospect value"
--[[Translation missing --]]
TSM.L["Display purchase info"] = "Display purchase info"
--[[Translation missing --]]
TSM.L["Display region historical price"] = "Display region historical price"
--[[Translation missing --]]
TSM.L["Display region market value avg"] = "Display region market value avg"
--[[Translation missing --]]
TSM.L["Display region min buyout avg"] = "Display region min buyout avg"
--[[Translation missing --]]
TSM.L["Display region sale avg"] = "Display region sale avg"
--[[Translation missing --]]
TSM.L["Display region sale rate"] = "Display region sale rate"
--[[Translation missing --]]
TSM.L["Display region sold per day"] = "Display region sold per day"
--[[Translation missing --]]
TSM.L["Display sale info"] = "Display sale info"
--[[Translation missing --]]
TSM.L["Display sale rate"] = "Display sale rate"
--[[Translation missing --]]
TSM.L["Display shopping max price"] = "Display shopping max price"
--[[Translation missing --]]
TSM.L["Display total money recieved in chat?"] = "Display total money recieved in chat?"
--[[Translation missing --]]
TSM.L["Display transform value"] = "Display transform value"
--[[Translation missing --]]
TSM.L["Display vendor buy price"] = "Display vendor buy price"
--[[Translation missing --]]
TSM.L["Display vendor sell price"] = "Display vendor sell price"
--[[Translation missing --]]
TSM.L["Doing so will also remove any sub-groups attached to this group."] = "Doing so will also remove any sub-groups attached to this group."
--[[Translation missing --]]
TSM.L["Done Canceling"] = "Done Canceling"
--[[Translation missing --]]
TSM.L["Done Posting"] = "Done Posting"
--[[Translation missing --]]
TSM.L["Done Scanning"] = "Done Scanning"
--[[Translation missing --]]
TSM.L["Don't post after this many expires:"] = "Don't post after this many expires:"
--[[Translation missing --]]
TSM.L["Don't Post Items"] = "Don't Post Items"
--[[Translation missing --]]
TSM.L["Don't prompt to record trades"] = "Don't prompt to record trades"
--[[Translation missing --]]
TSM.L["DOWN"] = "DOWN"
--[[Translation missing --]]
TSM.L["Drag in Additional Items (%d/%d Items)"] = "Drag in Additional Items (%d/%d Items)"
--[[Translation missing --]]
TSM.L["Drag Item(s) Into Box"] = "Drag Item(s) Into Box"
--[[Translation missing --]]
TSM.L["Duplicate"] = "Duplicate"
--[[Translation missing --]]
TSM.L["Duplicate Profile Confirmation"] = "Duplicate Profile Confirmation"
TSM.L["Dust"] = "塵"
--[[Translation missing --]]
TSM.L["Elevate your gold-making!"] = "Elevate your gold-making!"
--[[Translation missing --]]
TSM.L["Embed TSM tooltips"] = "Embed TSM tooltips"
--[[Translation missing --]]
TSM.L["EMPTY BAGS"] = "EMPTY BAGS"
--[[Translation missing --]]
TSM.L["Empty parentheses are not allowed"] = "Empty parentheses are not allowed"
TSM.L["Empty price string."] = "清空價格字串。"
--[[Translation missing --]]
TSM.L["Enable automatic stack combination"] = "Enable automatic stack combination"
--[[Translation missing --]]
TSM.L["Enable buying?"] = "Enable buying?"
--[[Translation missing --]]
TSM.L["Enable inbox chat messages"] = "Enable inbox chat messages"
--[[Translation missing --]]
TSM.L["Enable restock?"] = "Enable restock?"
--[[Translation missing --]]
TSM.L["Enable selling?"] = "Enable selling?"
--[[Translation missing --]]
TSM.L["Enable sending chat messages"] = "Enable sending chat messages"
--[[Translation missing --]]
TSM.L["Enable smart crafting for quests"] = "Enable smart crafting for quests"
--[[Translation missing --]]
TSM.L["Enable TSM Tooltips"] = "Enable TSM Tooltips"
--[[Translation missing --]]
TSM.L["Enable tweet enhancement"] = "Enable tweet enhancement"
--[[Translation missing --]]
TSM.L["Enchant Vellum"] = "Enchant Vellum"
--[[Translation missing --]]
TSM.L["Enter a name for the new profile"] = "Enter a name for the new profile"
--[[Translation missing --]]
TSM.L["Enter Filter"] = "Enter Filter"
--[[Translation missing --]]
TSM.L["Enter Keyword"] = "Enter Keyword"
--[[Translation missing --]]
TSM.L["Enter name of logged-in character from other account"] = "Enter name of logged-in character from other account"
--[[Translation missing --]]
TSM.L["Enter player name"] = "Enter player name"
TSM.L["Essences"] = "精華"
--[[Translation missing --]]
TSM.L["Establishing connection to %s. Make sure that you've entered this character's name on the other account."] = "Establishing connection to %s. Make sure that you've entered this character's name on the other account."
--[[Translation missing --]]
TSM.L["Estimated Cost:"] = "Estimated Cost:"
--[[Translation missing --]]
TSM.L["Estimated Profit:"] = "Estimated Profit:"
--[[Translation missing --]]
TSM.L["Exact Match Only?"] = "Exact Match Only?"
--[[Translation missing --]]
TSM.L["Exclude crafts with cooldowns"] = "Exclude crafts with cooldowns"
--[[Translation missing --]]
TSM.L["Expenses"] = "Expenses"
--[[Translation missing --]]
TSM.L["EXPENSES"] = "EXPENSES"
--[[Translation missing --]]
TSM.L["Expired"] = "Expired"
--[[Translation missing --]]
TSM.L["Expired Since Last Sale"] = "Expired Since Last Sale"
--[[Translation missing --]]
TSM.L["Expires"] = "Expires"
--[[Translation missing --]]
TSM.L["EXPIRES"] = "EXPIRES"
--[[Translation missing --]]
TSM.L["Exploration"] = "Exploration"
--[[Translation missing --]]
TSM.L["Export"] = "Export"
--[[Translation missing --]]
TSM.L["Export List"] = "Export List"
--[[Translation missing --]]
TSM.L["Failed Auctions"] = "Failed Auctions"
--[[Translation missing --]]
TSM.L["Failed Since Last Sale (Expired/Cancelled)"] = "Failed Since Last Sale (Expired/Cancelled)"
--[[Translation missing --]]
TSM.L["Failed to bid on auction of %s."] = "Failed to bid on auction of %s."
--[[Translation missing --]]
TSM.L["Failed to buy auction of %s."] = "Failed to buy auction of %s."
--[[Translation missing --]]
TSM.L["Failed to find auction for %s, so removing it from the results."] = "Failed to find auction for %s, so removing it from the results."
--[[Translation missing --]]
TSM.L["Favorite Scans"] = "Favorite Scans"
--[[Translation missing --]]
TSM.L["Favorite Searches"] = "Favorite Searches"
TSM.L["Filter Auctions by Duration"] = "以時間篩選拍賣"
TSM.L["Filter Auctions by Keyword"] = "以關鍵字篩選拍賣"
--[[Translation missing --]]
TSM.L["FILTER BY KEYWORD"] = "FILTER BY KEYWORD"
--[[Translation missing --]]
TSM.L["Filter by Keyword"] = "Filter by Keyword"
--[[Translation missing --]]
TSM.L["Filter group item lists based on the following price source"] = "Filter group item lists based on the following price source"
--[[Translation missing --]]
TSM.L["Filter Items"] = "Filter Items"
--[[Translation missing --]]
TSM.L["Filter Shopping"] = "Filter Shopping"
--[[Translation missing --]]
TSM.L["Finding Selected Auction"] = "Finding Selected Auction"
--[[Translation missing --]]
TSM.L["Fishing Reel In"] = "Fishing Reel In"
--[[Translation missing --]]
TSM.L["Forget Character"] = "Forget Character"
--[[Translation missing --]]
TSM.L["Found auction sound"] = "Found auction sound"
--[[Translation missing --]]
TSM.L["Friends"] = "Friends"
--[[Translation missing --]]
TSM.L["From"] = "From"
--[[Translation missing --]]
TSM.L["Full"] = "Full"
--[[Translation missing --]]
TSM.L["Garrison"] = "Garrison"
--[[Translation missing --]]
TSM.L["Gathering"] = "Gathering"
--[[Translation missing --]]
TSM.L["Gathering Search"] = "Gathering Search"
TSM.L["General Options"] = "常規選項"
--[[Translation missing --]]
TSM.L["Get from Bank"] = "Get from Bank"
--[[Translation missing --]]
TSM.L["Get from Guild Bank"] = "Get from Guild Bank"
--[[Translation missing --]]
TSM.L["Global Data Tooltips"] = "Global Data Tooltips"
--[[Translation missing --]]
TSM.L["Global Historical Price"] = "Global Historical Price"
--[[Translation missing --]]
TSM.L["Global Market Value Avg"] = "Global Market Value Avg"
--[[Translation missing --]]
TSM.L["Global Min Buyout Avg"] = "Global Min Buyout Avg"
--[[Translation missing --]]
TSM.L["Global Operation Confirmation"] = "Global Operation Confirmation"
--[[Translation missing --]]
TSM.L["Global Sale Avg"] = "Global Sale Avg"
--[[Translation missing --]]
TSM.L["Gold"] = "Gold"
--[[Translation missing --]]
TSM.L["Gold Earned:"] = "Gold Earned:"
--[[Translation missing --]]
TSM.L["GOLD ON HAND"] = "GOLD ON HAND"
--[[Translation missing --]]
TSM.L["Gold Spent:"] = "Gold Spent:"
--[[Translation missing --]]
TSM.L["GREAT DEALS SEARCH"] = "GREAT DEALS SEARCH"
--[[Translation missing --]]
TSM.L["Group already exists."] = "Group already exists."
--[[Translation missing --]]
TSM.L["Group Management"] = "Group Management"
--[[Translation missing --]]
TSM.L["Group Operations"] = "Group Operations"
--[[Translation missing --]]
TSM.L["Group Settings"] = "Group Settings"
--[[Translation missing --]]
TSM.L["Grouped Items"] = "Grouped Items"
TSM.L["Groups"] = "分組"
--[[Translation missing --]]
TSM.L["Guild"] = "Guild"
--[[Translation missing --]]
TSM.L["Guild Bank"] = "Guild Bank"
--[[Translation missing --]]
TSM.L["GUILDS"] = "GUILDS"
--[[Translation missing --]]
TSM.L["GVault"] = "GVault"
--[[Translation missing --]]
TSM.L["Have"] = "Have"
--[[Translation missing --]]
TSM.L["Have Materials"] = "Have Materials"
--[[Translation missing --]]
TSM.L["Have Skill Up"] = "Have Skill Up"
--[[Translation missing --]]
TSM.L["Help & Info"] = "Help & Info"
--[[Translation missing --]]
TSM.L["Hide auctions with bids"] = "Hide auctions with bids"
--[[Translation missing --]]
TSM.L["Hide Description"] = "Hide Description"
--[[Translation missing --]]
TSM.L["Hide minimap icon"] = "Hide minimap icon"
--[[Translation missing --]]
TSM.L["Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."] = "Hiding the TSM Banking UI. Type '/tsm bankui' to reopen it."
--[[Translation missing --]]
TSM.L["Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."] = "Hiding the TSM Task List UI. Type '/tsm tasklist' to reopen it."
--[[Translation missing --]]
TSM.L["High Bidder"] = "High Bidder"
--[[Translation missing --]]
TSM.L["Historical Price"] = "Historical Price"
--[[Translation missing --]]
TSM.L["Hold ALT to repair from the guild bank."] = "Hold ALT to repair from the guild bank."
--[[Translation missing --]]
TSM.L["Hr"] = "Hr"
--[[Translation missing --]]
TSM.L["Hrs"] = "Hrs"
--[[Translation missing --]]
TSM.L["I just bought [%s]x%d for %s! %s #TSM4 #warcraft"] = "I just bought [%s]x%d for %s! %s #TSM4 #warcraft"
--[[Translation missing --]]
TSM.L["I just sold [%s] for %s! %s #TSM4 #warcraft"] = "I just sold [%s] for %s! %s #TSM4 #warcraft"
--[[Translation missing --]]
TSM.L["If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."] = "If you don't want to undercut another player, you can add them to your whitelist and TSM will not undercut them. Note that if somebody on your whitelist matches your buyout but lists a lower bid, TSM will still consider them undercutting you."
TSM.L["If you have multiple profile set up with operations, enabling this will cause all but the current profile's operations to be irreversibly lost. Are you sure you want to continue?"] = "警告：如果你在多個配置檔下設定了“操作”選項，該操作會導致除了當前配置檔以外的所有配置檔中的“操作”選項永久性丟失。你確定要繼續嗎？"
--[[Translation missing --]]
TSM.L["If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."] = "If you have WoW's Twitter integration setup, TSM will add a share link to its enhanced auction sale / purchase messages, as well as replace URLs with a TSM link."
--[[Translation missing --]]
TSM.L["Ignore Auctions Below Min"] = "Ignore Auctions Below Min"
--[[Translation missing --]]
TSM.L["Ignore auctions by duration?"] = "Ignore auctions by duration?"
--[[Translation missing --]]
TSM.L["Ignore Characters"] = "Ignore Characters"
--[[Translation missing --]]
TSM.L["Ignore duplicate operations?"] = "Ignore duplicate operations?"
--[[Translation missing --]]
TSM.L["Ignore Guilds"] = "Ignore Guilds"
--[[Translation missing --]]
TSM.L["Ignore operation on characters:"] = "Ignore operation on characters:"
--[[Translation missing --]]
TSM.L["Ignore operation on faction-realms:"] = "Ignore operation on faction-realms:"
--[[Translation missing --]]
TSM.L["Ignore random enchants?"] = "Ignore random enchants?"
--[[Translation missing --]]
TSM.L["Ignored Cooldowns"] = "Ignored Cooldowns"
--[[Translation missing --]]
TSM.L["Ignored Items"] = "Ignored Items"
--[[Translation missing --]]
TSM.L["ilvl"] = "ilvl"
--[[Translation missing --]]
TSM.L["Import"] = "Import"
--[[Translation missing --]]
TSM.L["IMPORT"] = "IMPORT"
--[[Translation missing --]]
TSM.L["Import %d Items and %s Operations?"] = "Import %d Items and %s Operations?"
--[[Translation missing --]]
TSM.L["Import Groups & Operations"] = "Import Groups & Operations"
--[[Translation missing --]]
TSM.L["Imported Items"] = "Imported Items"
--[[Translation missing --]]
TSM.L["Imported Operations"] = "Imported Operations"
--[[Translation missing --]]
TSM.L["Inbox Settings"] = "Inbox Settings"
--[[Translation missing --]]
TSM.L["Include Attached Operations"] = "Include Attached Operations"
--[[Translation missing --]]
TSM.L["Include operations?"] = "Include operations?"
--[[Translation missing --]]
TSM.L["Include soulbound items"] = "Include soulbound items"
--[[Translation missing --]]
TSM.L["Information"] = "Information"
--[[Translation missing --]]
TSM.L["Invalid custom price entered."] = "Invalid custom price entered."
--[[Translation missing --]]
TSM.L["Invalid custom price source for %s. %s"] = "Invalid custom price source for %s. %s"
TSM.L["Invalid custom price."] = "無效的自定義價格。"
TSM.L["Invalid function."] = "無效函數。"
--[[Translation missing --]]
TSM.L["Invalid group name."] = "Invalid group name."
TSM.L["Invalid item link."] = "無效的物品鏈接。"
--[[Translation missing --]]
TSM.L["Invalid operation name."] = "Invalid operation name."
TSM.L["Invalid operator at end of custom price."] = "無效的自定義價格運算符"
TSM.L["Invalid parameter to price source."] = "無效的自定義價格源參數。"
--[[Translation missing --]]
TSM.L["Invalid player name."] = "Invalid player name."
TSM.L["Invalid price source in convert."] = "轉換價格來源無效"
--[[Translation missing --]]
TSM.L["Invalid price source."] = "Invalid price source."
--[[Translation missing --]]
TSM.L["Invalid seller data returned by server."] = "Invalid seller data returned by server."
TSM.L["Invalid word: '%s'"] = "無效詞：“%s”"
--[[Translation missing --]]
TSM.L["Inventory"] = "Inventory"
--[[Translation missing --]]
TSM.L["Inventory / Mailing"] = "Inventory / Mailing"
--[[Translation missing --]]
TSM.L["Inventory Options"] = "Inventory Options"
--[[Translation missing --]]
TSM.L["Inventory Tooltip Format"] = "Inventory Tooltip Format"
--[[Translation missing --]]
TSM.L["It appears that you've manually copied your saved variables between accounts which will cause TSM's automatic sync'ing to not work. You'll need to undo this, and/or delete the TradeSkillMaster and TSM_Crafting saved variables files on both accounts (with WoW closed) in order to fix this."] = "It appears that you've manually copied your saved variables between accounts which will cause TSM's automatic sync'ing to not work. You'll need to undo this, and/or delete the TradeSkillMaster and TSM_Crafting saved variables files on both accounts (with WoW closed) in order to fix this."
TSM.L["Item"] = "物品"
--[[Translation missing --]]
TSM.L["ITEM CLASS"] = "ITEM CLASS"
--[[Translation missing --]]
TSM.L["Item Level"] = "Item Level"
--[[Translation missing --]]
TSM.L["ITEM LEVEL RANGE"] = "ITEM LEVEL RANGE"
TSM.L["Item links may only be used as parameters to price sources."] = "物品鏈接只能作為價格源的參數。"
TSM.L["Item Name"] = "物品名稱"
--[[Translation missing --]]
TSM.L["Item Quality"] = "Item Quality"
--[[Translation missing --]]
TSM.L["ITEM SEARCH"] = "ITEM SEARCH"
--[[Translation missing --]]
TSM.L["ITEM SUBCLASS"] = "ITEM SUBCLASS"
--[[Translation missing --]]
TSM.L["Item Value"] = "Item Value"
--[[Translation missing --]]
TSM.L["Item/Group is invalid (see chat)."] = "Item/Group is invalid (see chat)."
--[[Translation missing --]]
TSM.L["ITEMS"] = "ITEMS"
TSM.L["Items"] = "物品"
--[[Translation missing --]]
TSM.L["Items in Bags"] = "Items in Bags"
--[[Translation missing --]]
TSM.L["Keep in bags quantity:"] = "Keep in bags quantity:"
--[[Translation missing --]]
TSM.L["Keep in bank quantity:"] = "Keep in bank quantity:"
--[[Translation missing --]]
TSM.L["Keep posted:"] = "Keep posted:"
--[[Translation missing --]]
TSM.L["Keep quantity:"] = "Keep quantity:"
--[[Translation missing --]]
TSM.L["Keep this amount in bags:"] = "Keep this amount in bags:"
--[[Translation missing --]]
TSM.L["Keep this amount:"] = "Keep this amount:"
--[[Translation missing --]]
TSM.L["Keeping %d."] = "Keeping %d."
--[[Translation missing --]]
TSM.L["Keeping undercut auctions posted."] = "Keeping undercut auctions posted."
--[[Translation missing --]]
TSM.L["Last 14 Days"] = "Last 14 Days"
--[[Translation missing --]]
TSM.L["Last 3 Days"] = "Last 3 Days"
--[[Translation missing --]]
TSM.L["Last 30 Days"] = "Last 30 Days"
--[[Translation missing --]]
TSM.L["LAST 30 DAYS"] = "LAST 30 DAYS"
--[[Translation missing --]]
TSM.L["Last 60 Days"] = "Last 60 Days"
--[[Translation missing --]]
TSM.L["Last 7 Days"] = "Last 7 Days"
--[[Translation missing --]]
TSM.L["LAST 7 DAYS"] = "LAST 7 DAYS"
--[[Translation missing --]]
TSM.L["Last Data Update:"] = "Last Data Update:"
--[[Translation missing --]]
TSM.L["Last Purchased"] = "Last Purchased"
--[[Translation missing --]]
TSM.L["Last Sold"] = "Last Sold"
TSM.L["Level Up"] = "升級"
--[[Translation missing --]]
TSM.L["LIMIT"] = "LIMIT"
--[[Translation missing --]]
TSM.L["Link to Another Operation"] = "Link to Another Operation"
--[[Translation missing --]]
TSM.L["List"] = "List"
--[[Translation missing --]]
TSM.L["List materials in tooltip"] = "List materials in tooltip"
--[[Translation missing --]]
TSM.L["Loading Mails..."] = "Loading Mails..."
--[[Translation missing --]]
TSM.L["Loading..."] = "Loading..."
TSM.L["Looks like TradeSkillMaster has encountered an error. Please help the author fix this error by following the instructions shown."] = "看起來TradeSkillMaster似乎發生了一個錯誤。請按照下列指示協助作者修正此問題。"
TSM.L["Loop detected in the following custom price:"] = "在以下自定義價格中循環檢測："
--[[Translation missing --]]
TSM.L["Lowest auction by whitelisted player."] = "Lowest auction by whitelisted player."
--[[Translation missing --]]
TSM.L["Macro created and scroll wheel bound!"] = "Macro created and scroll wheel bound!"
TSM.L["Macro Setup"] = "建立巨集"
TSM.L["Mail"] = "信箱"
--[[Translation missing --]]
TSM.L["Mail Disenchantables"] = "Mail Disenchantables"
--[[Translation missing --]]
TSM.L["Mail Disenchantables Max Quality"] = "Mail Disenchantables Max Quality"
--[[Translation missing --]]
TSM.L["MAIL SELECTED GROUPS"] = "MAIL SELECTED GROUPS"
--[[Translation missing --]]
TSM.L["Mail to %s"] = "Mail to %s"
--[[Translation missing --]]
TSM.L["Mailing"] = "Mailing"
--[[Translation missing --]]
TSM.L["Mailing all to %s."] = "Mailing all to %s."
--[[Translation missing --]]
TSM.L["Mailing Options"] = "Mailing Options"
--[[Translation missing --]]
TSM.L["Mailing up to %d to %s."] = "Mailing up to %d to %s."
--[[Translation missing --]]
TSM.L["Main Settings"] = "Main Settings"
--[[Translation missing --]]
TSM.L["Make Cash On Delivery?"] = "Make Cash On Delivery?"
--[[Translation missing --]]
TSM.L["Management Options"] = "Management Options"
--[[Translation missing --]]
TSM.L["Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."] = "Many commonly-used actions in TSM can be added to a macro and bound to your scroll wheel. Use the options below to setup this macro and scroll wheel binding."
--[[Translation missing --]]
TSM.L["Map Ping"] = "Map Ping"
--[[Translation missing --]]
TSM.L["Market Value"] = "Market Value"
--[[Translation missing --]]
TSM.L["Market Value Price Source"] = "Market Value Price Source"
--[[Translation missing --]]
TSM.L["Market Value Source"] = "Market Value Source"
--[[Translation missing --]]
TSM.L["Mat Cost"] = "Mat Cost"
--[[Translation missing --]]
TSM.L["Mat Price"] = "Mat Price"
--[[Translation missing --]]
TSM.L["Match stack size?"] = "Match stack size?"
--[[Translation missing --]]
TSM.L["Match whitelisted players"] = "Match whitelisted players"
--[[Translation missing --]]
TSM.L["Material Name"] = "Material Name"
--[[Translation missing --]]
TSM.L["Materials"] = "Materials"
--[[Translation missing --]]
TSM.L["Materials to Gather"] = "Materials to Gather"
--[[Translation missing --]]
TSM.L["Max Destroy Value"] = "Max Destroy Value"
--[[Translation missing --]]
TSM.L["MAX EXPIRES TO BANK"] = "MAX EXPIRES TO BANK"
--[[Translation missing --]]
TSM.L["Max Market Value"] = "Max Market Value"
--[[Translation missing --]]
TSM.L["Max Shopping Price"] = "Max Shopping Price"
--[[Translation missing --]]
TSM.L["Maximum amount already posted."] = "Maximum amount already posted."
--[[Translation missing --]]
TSM.L["Maximum Auction Price (Per Item)"] = "Maximum Auction Price (Per Item)"
--[[Translation missing --]]
TSM.L["Maximum Destroy Value (Enter '0c' to disable)"] = "Maximum Destroy Value (Enter '0c' to disable)"
--[[Translation missing --]]
TSM.L["Maximum disenchant level:"] = "Maximum disenchant level:"
--[[Translation missing --]]
TSM.L["Maximum Disenchant Quality"] = "Maximum Disenchant Quality"
--[[Translation missing --]]
TSM.L["Maximum disenchant search percentage:"] = "Maximum disenchant search percentage:"
--[[Translation missing --]]
TSM.L["Maximum Market Value (Enter '0c' to disable)"] = "Maximum Market Value (Enter '0c' to disable)"
--[[Translation missing --]]
TSM.L["MAXIMUM QUANTITY TO BUY:"] = "MAXIMUM QUANTITY TO BUY:"
--[[Translation missing --]]
TSM.L["Maximum quantity:"] = "Maximum quantity:"
--[[Translation missing --]]
TSM.L["Maximum restock quantity:"] = "Maximum restock quantity:"
--[[Translation missing --]]
TSM.L["Mill Value"] = "Mill Value"
--[[Translation missing --]]
TSM.L["Min"] = "Min"
--[[Translation missing --]]
TSM.L["Min Buyout"] = "Min Buyout"
--[[Translation missing --]]
TSM.L["Min/Normal/Max Prices"] = "Min/Normal/Max Prices"
--[[Translation missing --]]
TSM.L["Minimum Days Old"] = "Minimum Days Old"
--[[Translation missing --]]
TSM.L["Minimum disenchant level:"] = "Minimum disenchant level:"
--[[Translation missing --]]
TSM.L["Minimum expires:"] = "Minimum expires:"
--[[Translation missing --]]
TSM.L["Minimum profit:"] = "Minimum profit:"
--[[Translation missing --]]
TSM.L["MINIMUM RARITY"] = "MINIMUM RARITY"
--[[Translation missing --]]
TSM.L["Minimum restock quantity:"] = "Minimum restock quantity:"
TSM.L["Misplaced comma"] = "錯誤的逗號分隔"
--[[Translation missing --]]
TSM.L["Missing Materials"] = "Missing Materials"
--[[Translation missing --]]
TSM.L["MM/DD/YY HH:MM"] = "MM/DD/YY HH:MM"
--[[Translation missing --]]
TSM.L["Modifiers:"] = "Modifiers:"
--[[Translation missing --]]
TSM.L["Money Frame Open"] = "Money Frame Open"
--[[Translation missing --]]
TSM.L["Money Transfer"] = "Money Transfer"
--[[Translation missing --]]
TSM.L["Most Profitable Item:"] = "Most Profitable Item:"
--[[Translation missing --]]
TSM.L["MOVE"] = "MOVE"
--[[Translation missing --]]
TSM.L["Move already grouped items?"] = "Move already grouped items?"
--[[Translation missing --]]
TSM.L["Move Quantity Settings"] = "Move Quantity Settings"
--[[Translation missing --]]
TSM.L["MOVE TO BAGS"] = "MOVE TO BAGS"
--[[Translation missing --]]
TSM.L["MOVE TO BANK"] = "MOVE TO BANK"
--[[Translation missing --]]
TSM.L["MOVING"] = "MOVING"
--[[Translation missing --]]
TSM.L["Moving"] = "Moving"
--[[Translation missing --]]
TSM.L["Multiple Items"] = "Multiple Items"
TSM.L["My Auctions"] = "我的拍賣"
--[[Translation missing --]]
TSM.L["My Auctions 'CANCEL' Button"] = "My Auctions 'CANCEL' Button"
--[[Translation missing --]]
TSM.L["Neat Stacks only?"] = "Neat Stacks only?"
--[[Translation missing --]]
TSM.L["NEED MATS"] = "NEED MATS"
TSM.L["New Group"] = "新分組"
--[[Translation missing --]]
TSM.L["New Operation"] = "New Operation"
--[[Translation missing --]]
TSM.L["NEWS AND INFORMATION"] = "NEWS AND INFORMATION"
--[[Translation missing --]]
TSM.L["No Attachments"] = "No Attachments"
--[[Translation missing --]]
TSM.L["No Data"] = "No Data"
--[[Translation missing --]]
TSM.L["No group selected"] = "No group selected"
--[[Translation missing --]]
TSM.L["No item specified. Usage: /tsm restock_help [ITEM_LINK]"] = "No item specified. Usage: /tsm restock_help [ITEM_LINK]"
--[[Translation missing --]]
TSM.L["NO ITEMS"] = "NO ITEMS"
--[[Translation missing --]]
TSM.L["No Materials to Gather"] = "No Materials to Gather"
--[[Translation missing --]]
TSM.L["No Operation Selected"] = "No Operation Selected"
--[[Translation missing --]]
TSM.L["No posting."] = "No posting."
--[[Translation missing --]]
TSM.L["No Profession Opened"] = "No Profession Opened"
--[[Translation missing --]]
TSM.L["No Profession Selected"] = "No Profession Selected"
--[[Translation missing --]]
TSM.L["No profile specified. Possible profiles: '%s'"] = "No profile specified. Possible profiles: '%s'"
--[[Translation missing --]]
TSM.L["No recent AuctionDB scan data found."] = "No recent AuctionDB scan data found."
--[[Translation missing --]]
TSM.L["No Sound"] = "No Sound"
--[[Translation missing --]]
TSM.L["None"] = "None"
--[[Translation missing --]]
TSM.L["None (Always Show)"] = "None (Always Show)"
--[[Translation missing --]]
TSM.L["None Selected"] = "None Selected"
--[[Translation missing --]]
TSM.L["NONGROUP TO BANK"] = "NONGROUP TO BANK"
--[[Translation missing --]]
TSM.L["Normal"] = "Normal"
--[[Translation missing --]]
TSM.L["Not canceling auction at reset price."] = "Not canceling auction at reset price."
--[[Translation missing --]]
TSM.L["Not canceling auction below min price."] = "Not canceling auction below min price."
--[[Translation missing --]]
TSM.L["Not canceling."] = "Not canceling."
--[[Translation missing --]]
TSM.L["Not enough items in bags."] = "Not enough items in bags."
--[[Translation missing --]]
TSM.L["NOT OPEN"] = "NOT OPEN"
--[[Translation missing --]]
TSM.L["Not Scanned"] = "Not Scanned"
--[[Translation missing --]]
TSM.L["NPC"] = "NPC"
--[[Translation missing --]]
TSM.L["Number Owned"] = "Number Owned"
--[[Translation missing --]]
TSM.L["of"] = "of"
--[[Translation missing --]]
TSM.L["Offline"] = "Offline"
--[[Translation missing --]]
TSM.L["Old TSM addons detected. TSM has disabled them and requires a reload."] = "Old TSM addons detected. TSM has disabled them and requires a reload."
--[[Translation missing --]]
TSM.L["On Cooldown"] = "On Cooldown"
--[[Translation missing --]]
TSM.L["Only show craftable"] = "Only show craftable"
--[[Translation missing --]]
TSM.L["Only show items with disenchant value above custom price"] = "Only show items with disenchant value above custom price"
--[[Translation missing --]]
TSM.L["OPEN"] = "OPEN"
--[[Translation missing --]]
TSM.L["Open all bags when auctioning"] = "Open all bags when auctioning"
--[[Translation missing --]]
TSM.L["OPEN ALL MAIL"] = "OPEN ALL MAIL"
--[[Translation missing --]]
TSM.L["Open Mail"] = "Open Mail"
--[[Translation missing --]]
TSM.L["Open Mail Complete Sound"] = "Open Mail Complete Sound"
--[[Translation missing --]]
TSM.L["Open Task List"] = "Open Task List"
--[[Translation missing --]]
TSM.L["Operation"] = "Operation"
TSM.L["Operations"] = "操作"
--[[Translation missing --]]
TSM.L["Other Character"] = "Other Character"
--[[Translation missing --]]
TSM.L["Other Settings"] = "Other Settings"
--[[Translation missing --]]
TSM.L["Other Shopping Searches"] = "Other Shopping Searches"
--[[Translation missing --]]
TSM.L["Override default craft value method?"] = "Override default craft value method?"
--[[Translation missing --]]
TSM.L["Override parent operations"] = "Override parent operations"
--[[Translation missing --]]
TSM.L["Parent Items"] = "Parent Items"
--[[Translation missing --]]
TSM.L["Past 7 Days"] = "Past 7 Days"
--[[Translation missing --]]
TSM.L["Past Day"] = "Past Day"
--[[Translation missing --]]
TSM.L["Past Month"] = "Past Month"
--[[Translation missing --]]
TSM.L["Past Year"] = "Past Year"
--[[Translation missing --]]
TSM.L["Paste string here"] = "Paste string here"
--[[Translation missing --]]
TSM.L["Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."] = "Paste your import string in the field below and then press 'IMPORT'. You can import everything from item lists (comma delineated please) to whole group & operation structures."
--[[Translation missing --]]
TSM.L["Per Item"] = "Per Item"
--[[Translation missing --]]
TSM.L["Per Stack"] = "Per Stack"
--[[Translation missing --]]
TSM.L["Per Unit"] = "Per Unit"
--[[Translation missing --]]
TSM.L["Player Gold"] = "Player Gold"
--[[Translation missing --]]
TSM.L["Player Invite Accept"] = "Player Invite Accept"
--[[Translation missing --]]
TSM.L["Please select a group to export"] = "Please select a group to export"
--[[Translation missing --]]
TSM.L["POST"] = "POST"
--[[Translation missing --]]
TSM.L["Post at Maximum Price"] = "Post at Maximum Price"
--[[Translation missing --]]
TSM.L["Post at Minimum Price"] = "Post at Minimum Price"
--[[Translation missing --]]
TSM.L["Post at Normal Price"] = "Post at Normal Price"
--[[Translation missing --]]
TSM.L["POST CAP TO BAGS"] = "POST CAP TO BAGS"
--[[Translation missing --]]
TSM.L["Post Scan"] = "Post Scan"
--[[Translation missing --]]
TSM.L["POST SELECTED"] = "POST SELECTED"
--[[Translation missing --]]
TSM.L["POSTAGE"] = "POSTAGE"
--[[Translation missing --]]
TSM.L["Postage"] = "Postage"
--[[Translation missing --]]
TSM.L["Posted at whitelisted player's price."] = "Posted at whitelisted player's price."
--[[Translation missing --]]
TSM.L["Posted Auctions %s:"] = "Posted Auctions %s:"
--[[Translation missing --]]
TSM.L["Posting"] = "Posting"
--[[Translation missing --]]
TSM.L["Posting %d / %d"] = "Posting %d / %d"
--[[Translation missing --]]
TSM.L["Posting %d stack(s) of %d for %d hours."] = "Posting %d stack(s) of %d for %d hours."
--[[Translation missing --]]
TSM.L["Posting at normal price."] = "Posting at normal price."
--[[Translation missing --]]
TSM.L["Posting at whitelisted player's price."] = "Posting at whitelisted player's price."
--[[Translation missing --]]
TSM.L["Posting at your current price."] = "Posting at your current price."
--[[Translation missing --]]
TSM.L["Posting disabled."] = "Posting disabled."
--[[Translation missing --]]
TSM.L["Posting Settings"] = "Posting Settings"
--[[Translation missing --]]
TSM.L["Potential"] = "Potential"
--[[Translation missing --]]
TSM.L["Price Settings"] = "Price Settings"
--[[Translation missing --]]
TSM.L["PRICE SOURCE"] = "PRICE SOURCE"
--[[Translation missing --]]
TSM.L["Price source with name '%s' already exists."] = "Price source with name '%s' already exists."
--[[Translation missing --]]
TSM.L["Price Variables"] = "Price Variables"
--[[Translation missing --]]
TSM.L["Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."] = "Price Variables allow you to create more advanced custom prices for use throughout the addon. You'll be able to use these new variables in the same way you can use the built-in price sources such as 'vendorsell' and 'vendorbuy'."
--[[Translation missing --]]
TSM.L["PROFESSION"] = "PROFESSION"
--[[Translation missing --]]
TSM.L["Profession Filters"] = "Profession Filters"
--[[Translation missing --]]
TSM.L["Profession loading..."] = "Profession loading..."
--[[Translation missing --]]
TSM.L["Professions Used In"] = "Professions Used In"
--[[Translation missing --]]
TSM.L["Profile changed to '%s'."] = "Profile changed to '%s'."
TSM.L["Profiles"] = "配置檔"
--[[Translation missing --]]
TSM.L["Profit"] = "Profit"
--[[Translation missing --]]
TSM.L["PROFIT"] = "PROFIT"
--[[Translation missing --]]
TSM.L["Profit Deduction"] = "Profit Deduction"
--[[Translation missing --]]
TSM.L["Profit, Craftable Quantity"] = "Profit, Craftable Quantity"
--[[Translation missing --]]
TSM.L["Prospect Value"] = "Prospect Value"
--[[Translation missing --]]
TSM.L["PURCHASE DATA"] = "PURCHASE DATA"
--[[Translation missing --]]
TSM.L["Purchased (Min/Avg/Max Price)"] = "Purchased (Min/Avg/Max Price)"
--[[Translation missing --]]
TSM.L["Purchased (Total Price)"] = "Purchased (Total Price)"
--[[Translation missing --]]
TSM.L["Purchases"] = "Purchases"
--[[Translation missing --]]
TSM.L["Qty"] = "Qty"
--[[Translation missing --]]
TSM.L["Quantity Bought:"] = "Quantity Bought:"
--[[Translation missing --]]
TSM.L["Quantity Sold:"] = "Quantity Sold:"
--[[Translation missing --]]
TSM.L["Quantity to move:"] = "Quantity to move:"
--[[Translation missing --]]
TSM.L["Quest Added"] = "Quest Added"
--[[Translation missing --]]
TSM.L["Quest Completed"] = "Quest Completed"
--[[Translation missing --]]
TSM.L["Quest Objectives Complete"] = "Quest Objectives Complete"
--[[Translation missing --]]
TSM.L["QUEUE"] = "QUEUE"
--[[Translation missing --]]
TSM.L["Queue Sorting Method"] = "Queue Sorting Method"
--[[Translation missing --]]
TSM.L["Quick Sell"] = "Quick Sell"
--[[Translation missing --]]
TSM.L["Quick Sell Options"] = "Quick Sell Options"
--[[Translation missing --]]
TSM.L["Quickly mail all excess disenchantable items to a character"] = "Quickly mail all excess disenchantable items to a character"
--[[Translation missing --]]
TSM.L["Quickly mail all excess gold (limited to a certain amount) to a character"] = "Quickly mail all excess gold (limited to a certain amount) to a character"
--[[Translation missing --]]
TSM.L["Raid Warning"] = "Raid Warning"
--[[Translation missing --]]
TSM.L["Read More"] = "Read More"
--[[Translation missing --]]
TSM.L["Ready Check"] = "Ready Check"
--[[Translation missing --]]
TSM.L["Ready to Cancel"] = "Ready to Cancel"
--[[Translation missing --]]
TSM.L["Reagent Bank"] = "Reagent Bank"
--[[Translation missing --]]
TSM.L["Realm Data Tooltips"] = "Realm Data Tooltips"
--[[Translation missing --]]
TSM.L["Recent Scans"] = "Recent Scans"
--[[Translation missing --]]
TSM.L["Recent Searches"] = "Recent Searches"
--[[Translation missing --]]
TSM.L["Recently Mailed"] = "Recently Mailed"
--[[Translation missing --]]
TSM.L["RECIPIENT"] = "RECIPIENT"
--[[Translation missing --]]
TSM.L["Region Avg Daily Sold"] = "Region Avg Daily Sold"
--[[Translation missing --]]
TSM.L["Region Data Tooltips"] = "Region Data Tooltips"
--[[Translation missing --]]
TSM.L["Region Historical Price"] = "Region Historical Price"
--[[Translation missing --]]
TSM.L["Region Market Value Avg"] = "Region Market Value Avg"
--[[Translation missing --]]
TSM.L["Region Min Buyout Avg"] = "Region Min Buyout Avg"
--[[Translation missing --]]
TSM.L["Region Sale Avg"] = "Region Sale Avg"
--[[Translation missing --]]
TSM.L["Region Sale Rate"] = "Region Sale Rate"
--[[Translation missing --]]
TSM.L["Reload"] = "Reload"
--[[Translation missing --]]
TSM.L["REMOVE %d ITEMS"] = "REMOVE %d ITEMS"
--[[Translation missing --]]
TSM.L["Removed a total of %s old records."] = "Removed a total of %s old records."
--[[Translation missing --]]
TSM.L["REPAIR"] = "REPAIR"
--[[Translation missing --]]
TSM.L["Repair Bill"] = "Repair Bill"
TSM.L["Replace"] = "替換"
--[[Translation missing --]]
TSM.L["REPLY"] = "REPLY"
--[[Translation missing --]]
TSM.L["REPORT SPAM"] = "REPORT SPAM"
--[[Translation missing --]]
TSM.L["Repost Higher Threshold"] = "Repost Higher Threshold"
--[[Translation missing --]]
TSM.L["Required Level"] = "Required Level"
--[[Translation missing --]]
TSM.L["REQUIRED LEVEL RANGE"] = "REQUIRED LEVEL RANGE"
--[[Translation missing --]]
TSM.L["Requires TSM Desktop Application"] = "Requires TSM Desktop Application"
--[[Translation missing --]]
TSM.L["Resale"] = "Resale"
--[[Translation missing --]]
TSM.L["RESCAN"] = "RESCAN"
--[[Translation missing --]]
TSM.L["RESET"] = "RESET"
--[[Translation missing --]]
TSM.L["Reset All"] = "Reset All"
--[[Translation missing --]]
TSM.L["Reset Filters"] = "Reset Filters"
--[[Translation missing --]]
TSM.L["Reset Profile Confirmation"] = "Reset Profile Confirmation"
--[[Translation missing --]]
TSM.L["RESTART"] = "RESTART"
--[[Translation missing --]]
TSM.L["Restart Delay (minutes)"] = "Restart Delay (minutes)"
--[[Translation missing --]]
TSM.L["RESTOCK BAGS"] = "RESTOCK BAGS"
--[[Translation missing --]]
TSM.L["Restock help for %s:"] = "Restock help for %s:"
--[[Translation missing --]]
TSM.L["Restock Quantity Settings"] = "Restock Quantity Settings"
--[[Translation missing --]]
TSM.L["Restock quantity:"] = "Restock quantity:"
--[[Translation missing --]]
TSM.L["RESTOCK SELECTED GROUPS"] = "RESTOCK SELECTED GROUPS"
--[[Translation missing --]]
TSM.L["Restock Settings"] = "Restock Settings"
--[[Translation missing --]]
TSM.L["Restock target to max quantity?"] = "Restock target to max quantity?"
--[[Translation missing --]]
TSM.L["Restocking to %d."] = "Restocking to %d."
--[[Translation missing --]]
TSM.L["Restocking to a max of %d (min of %d) with a min profit."] = "Restocking to a max of %d (min of %d) with a min profit."
--[[Translation missing --]]
TSM.L["Restocking to a max of %d (min of %d) with no min profit."] = "Restocking to a max of %d (min of %d) with no min profit."
--[[Translation missing --]]
TSM.L["RESTORE BAGS"] = "RESTORE BAGS"
--[[Translation missing --]]
TSM.L["Resume Scan"] = "Resume Scan"
--[[Translation missing --]]
TSM.L["Retrying %d auction(s) which failed."] = "Retrying %d auction(s) which failed."
--[[Translation missing --]]
TSM.L["Revenue"] = "Revenue"
--[[Translation missing --]]
TSM.L["Round normal price"] = "Round normal price"
--[[Translation missing --]]
TSM.L["RUN ADVANCED ITEM SEARCH"] = "RUN ADVANCED ITEM SEARCH"
--[[Translation missing --]]
TSM.L["Run Bid Sniper"] = "Run Bid Sniper"
--[[Translation missing --]]
TSM.L["Run Buyout Sniper"] = "Run Buyout Sniper"
--[[Translation missing --]]
TSM.L["RUN CANCEL SCAN"] = "RUN CANCEL SCAN"
--[[Translation missing --]]
TSM.L["RUN POST SCAN"] = "RUN POST SCAN"
--[[Translation missing --]]
TSM.L["RUN SHOPPING SCAN"] = "RUN SHOPPING SCAN"
--[[Translation missing --]]
TSM.L["Running Sniper Scan"] = "Running Sniper Scan"
--[[Translation missing --]]
TSM.L["Sale"] = "Sale"
--[[Translation missing --]]
TSM.L["SALE DATA"] = "SALE DATA"
--[[Translation missing --]]
TSM.L["Sale Rate"] = "Sale Rate"
--[[Translation missing --]]
TSM.L["Sales"] = "Sales"
--[[Translation missing --]]
TSM.L["SALES"] = "SALES"
--[[Translation missing --]]
TSM.L["Sales Summary"] = "Sales Summary"
--[[Translation missing --]]
TSM.L["SCAN ALL"] = "SCAN ALL"
--[[Translation missing --]]
TSM.L["Scan Complete Sound"] = "Scan Complete Sound"
--[[Translation missing --]]
TSM.L["Scan Paused"] = "Scan Paused"
--[[Translation missing --]]
TSM.L["SCANNING"] = "SCANNING"
--[[Translation missing --]]
TSM.L["Scanning %d / %d (Page %d / %d)"] = "Scanning %d / %d (Page %d / %d)"
--[[Translation missing --]]
TSM.L["Scroll wheel direction:"] = "Scroll wheel direction:"
--[[Translation missing --]]
TSM.L["Search"] = "Search"
--[[Translation missing --]]
TSM.L["Search Bags"] = "Search Bags"
--[[Translation missing --]]
TSM.L["Search for Item"] = "Search for Item"
--[[Translation missing --]]
TSM.L["Search Groups"] = "Search Groups"
--[[Translation missing --]]
TSM.L["Search Inbox"] = "Search Inbox"
--[[Translation missing --]]
TSM.L["Search Operations"] = "Search Operations"
--[[Translation missing --]]
TSM.L["Search Patterns"] = "Search Patterns"
--[[Translation missing --]]
TSM.L["Search Usable Items Only?"] = "Search Usable Items Only?"
--[[Translation missing --]]
TSM.L["Search Vendor"] = "Search Vendor"
--[[Translation missing --]]
TSM.L["Select a Source"] = "Select a Source"
--[[Translation missing --]]
TSM.L["Select Action"] = "Select Action"
TSM.L["Select All Groups"] = "選擇所有分組"
--[[Translation missing --]]
TSM.L["Select All Items"] = "Select All Items"
--[[Translation missing --]]
TSM.L["Select Auction to Cancel"] = "Select Auction to Cancel"
--[[Translation missing --]]
TSM.L["Select crafter"] = "Select crafter"
--[[Translation missing --]]
TSM.L["Select custom price sources to include in item tooltips"] = "Select custom price sources to include in item tooltips"
TSM.L["Select Duration"] = "選擇時間"
--[[Translation missing --]]
TSM.L["Select Items to Add"] = "Select Items to Add"
--[[Translation missing --]]
TSM.L["Select Items to Remove"] = "Select Items to Remove"
--[[Translation missing --]]
TSM.L["Select Operation"] = "Select Operation"
--[[Translation missing --]]
TSM.L["Select professions"] = "Select professions"
--[[Translation missing --]]
TSM.L["Select which accounting information to display in item tooltips."] = "Select which accounting information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which auctioning information to display in item tooltips."] = "Select which auctioning information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which crafting information to display in item tooltips."] = "Select which crafting information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which destroying information to display in item tooltips."] = "Select which destroying information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Select which shopping information to display in item tooltips."] = "Select which shopping information to display in item tooltips."
--[[Translation missing --]]
TSM.L["Selected Groups"] = "Selected Groups"
--[[Translation missing --]]
TSM.L["SELECTED ITEM"] = "SELECTED ITEM"
--[[Translation missing --]]
TSM.L["Selected Operations"] = "Selected Operations"
--[[Translation missing --]]
TSM.L["Sell"] = "Sell"
--[[Translation missing --]]
TSM.L["SELL ALL"] = "SELL ALL"
--[[Translation missing --]]
TSM.L["SELL BOES"] = "SELL BOES"
--[[Translation missing --]]
TSM.L["SELL GROUPS"] = "SELL GROUPS"
--[[Translation missing --]]
TSM.L["Sell Options"] = "Sell Options"
--[[Translation missing --]]
TSM.L["Sell soulbound items?"] = "Sell soulbound items?"
TSM.L["Sell to Vendor"] = "賣給商人"
--[[Translation missing --]]
TSM.L["SELL TRASH"] = "SELL TRASH"
--[[Translation missing --]]
TSM.L["Seller"] = "Seller"
--[[Translation missing --]]
TSM.L["Selling soulbound items."] = "Selling soulbound items."
--[[Translation missing --]]
TSM.L["Send"] = "Send"
--[[Translation missing --]]
TSM.L["SEND DISENCHANTABLES"] = "SEND DISENCHANTABLES"
--[[Translation missing --]]
TSM.L["Send Excess Gold to Banker"] = "Send Excess Gold to Banker"
--[[Translation missing --]]
TSM.L["SEND GOLD"] = "SEND GOLD"
--[[Translation missing --]]
TSM.L["Send grouped items individually"] = "Send grouped items individually"
--[[Translation missing --]]
TSM.L["SEND MAIL"] = "SEND MAIL"
--[[Translation missing --]]
TSM.L["Send Money"] = "Send Money"
--[[Translation missing --]]
TSM.L["SENDING"] = "SENDING"
--[[Translation missing --]]
TSM.L["Sending %s individually to %s"] = "Sending %s individually to %s"
--[[Translation missing --]]
TSM.L["Sending %s to %s"] = "Sending %s to %s"
--[[Translation missing --]]
TSM.L["Sending %s to %s with a COD of %s"] = "Sending %s to %s with a COD of %s"
--[[Translation missing --]]
TSM.L["Sending Settings"] = "Sending Settings"
--[[Translation missing --]]
TSM.L["SENDING..."] = "SENDING..."
--[[Translation missing --]]
TSM.L["Set auction duration to:"] = "Set auction duration to:"
--[[Translation missing --]]
TSM.L["Set bid as percentage of buyout:"] = "Set bid as percentage of buyout:"
--[[Translation missing --]]
TSM.L["Set keep in bags quantity?"] = "Set keep in bags quantity?"
--[[Translation missing --]]
TSM.L["Set keep in bank quantity?"] = "Set keep in bank quantity?"
--[[Translation missing --]]
TSM.L["Set Maximum Price:"] = "Set Maximum Price:"
--[[Translation missing --]]
TSM.L["Set maximum quantity?"] = "Set maximum quantity?"
--[[Translation missing --]]
TSM.L["Set Minimum Price:"] = "Set Minimum Price:"
--[[Translation missing --]]
TSM.L["Set minimum profit?"] = "Set minimum profit?"
--[[Translation missing --]]
TSM.L["Set move quantity?"] = "Set move quantity?"
--[[Translation missing --]]
TSM.L["Set Normal Price:"] = "Set Normal Price:"
--[[Translation missing --]]
TSM.L["Set post cap to:"] = "Set post cap to:"
--[[Translation missing --]]
TSM.L["Set posted stack size to:"] = "Set posted stack size to:"
--[[Translation missing --]]
TSM.L["Set stack size for bags?"] = "Set stack size for bags?"
--[[Translation missing --]]
TSM.L["Setup"] = "Setup"
--[[Translation missing --]]
TSM.L["SETUP ACCOUNT SYNC"] = "SETUP ACCOUNT SYNC"
TSM.L["Shards"] = "碎片"
--[[Translation missing --]]
TSM.L["Shopping"] = "Shopping"
--[[Translation missing --]]
TSM.L["Shopping 'BUYOUT' Button"] = "Shopping 'BUYOUT' Button"
--[[Translation missing --]]
TSM.L["Shopping for auctions including those above the max price."] = "Shopping for auctions including those above the max price."
--[[Translation missing --]]
TSM.L["Shopping for auctions with a max price set."] = "Shopping for auctions with a max price set."
--[[Translation missing --]]
TSM.L["Shopping for even stacks including those above the max price"] = "Shopping for even stacks including those above the max price"
--[[Translation missing --]]
TSM.L["Shopping for even stacks with a max price set."] = "Shopping for even stacks with a max price set."
--[[Translation missing --]]
TSM.L["Shopping Tooltips"] = "Shopping Tooltips"
--[[Translation missing --]]
TSM.L["SHORTFALL TO BAGS"] = "SHORTFALL TO BAGS"
--[[Translation missing --]]
TSM.L["Show auctions above max price?"] = "Show auctions above max price?"
--[[Translation missing --]]
TSM.L["Show Description"] = "Show Description"
--[[Translation missing --]]
TSM.L["Show Destroying frame automatically"] = "Show Destroying frame automatically"
--[[Translation missing --]]
TSM.L["Show material cost"] = "Show material cost"
--[[Translation missing --]]
TSM.L["Show on Modifier"] = "Show on Modifier"
--[[Translation missing --]]
TSM.L["Showing %d Mail"] = "Showing %d Mail"
--[[Translation missing --]]
TSM.L["Showing %d of %d Mail"] = "Showing %d of %d Mail"
--[[Translation missing --]]
TSM.L["Showing %d of %d Mails"] = "Showing %d of %d Mails"
--[[Translation missing --]]
TSM.L["Showing all %d Mails"] = "Showing all %d Mails"
--[[Translation missing --]]
TSM.L["Simple"] = "Simple"
--[[Translation missing --]]
TSM.L["SKIP"] = "SKIP"
--[[Translation missing --]]
TSM.L["Skip Import / Export confirmations?"] = "Skip Import / Export confirmations?"
--[[Translation missing --]]
TSM.L["Skipped: No assigned operation"] = "Skipped: No assigned operation"
TSM.L["Slash Commands:"] = "斜線命令列表："
--[[Translation missing --]]
TSM.L["Sniper 'BUYOUT' Button"] = "Sniper 'BUYOUT' Button"
--[[Translation missing --]]
TSM.L["Sniper Options"] = "Sniper Options"
--[[Translation missing --]]
TSM.L["Sniper Settings"] = "Sniper Settings"
--[[Translation missing --]]
TSM.L["Sniping items below a max price"] = "Sniping items below a max price"
--[[Translation missing --]]
TSM.L["Sold"] = "Sold"
--[[Translation missing --]]
TSM.L["Sold %s worth of items."] = "Sold %s worth of items."
--[[Translation missing --]]
TSM.L["Sold (Min/Avg/Max Price)"] = "Sold (Min/Avg/Max Price)"
--[[Translation missing --]]
TSM.L["Sold (Total Price)"] = "Sold (Total Price)"
--[[Translation missing --]]
TSM.L["Sold [%s]x%d for %s to %s"] = "Sold [%s]x%d for %s to %s"
--[[Translation missing --]]
TSM.L["Sold Auctions %s:"] = "Sold Auctions %s:"
--[[Translation missing --]]
TSM.L["Source"] = "Source"
--[[Translation missing --]]
TSM.L["SOURCE %d"] = "SOURCE %d"
--[[Translation missing --]]
TSM.L["SOURCES"] = "SOURCES"
TSM.L["Sources"] = "來源"
--[[Translation missing --]]
TSM.L["Sources to include for restock:"] = "Sources to include for restock:"
--[[Translation missing --]]
TSM.L["Stack"] = "Stack"
--[[Translation missing --]]
TSM.L["Stack / Quantity"] = "Stack / Quantity"
--[[Translation missing --]]
TSM.L["Stack size multiple:"] = "Stack size multiple:"
--[[Translation missing --]]
TSM.L["Start either a 'Buyout' or 'Bid' sniper using the buttons above."] = "Start either a 'Buyout' or 'Bid' sniper using the buttons above."
--[[Translation missing --]]
TSM.L["Starting Scan..."] = "Starting Scan..."
--[[Translation missing --]]
TSM.L["STOP"] = "STOP"
--[[Translation missing --]]
TSM.L["Store operations globally"] = "Store operations globally"
--[[Translation missing --]]
TSM.L["Subject"] = "Subject"
--[[Translation missing --]]
TSM.L["SUBJECT"] = "SUBJECT"
--[[Translation missing --]]
TSM.L["Switch to %s"] = "Switch to %s"
TSM.L["Switch to WoW UI"] = "轉到魔獸界面"
--[[Translation missing --]]
TSM.L["Sync Setup Error: The specified player on the other account is not currently online."] = "Sync Setup Error: The specified player on the other account is not currently online."
--[[Translation missing --]]
TSM.L["Sync Setup Error: This character is already part of a known account."] = "Sync Setup Error: This character is already part of a known account."
--[[Translation missing --]]
TSM.L["Sync Setup Error: You entered the name of the current character and not the character on the other account."] = "Sync Setup Error: You entered the name of the current character and not the character on the other account."
--[[Translation missing --]]
TSM.L["TAKE ALL"] = "TAKE ALL"
--[[Translation missing --]]
TSM.L["Take Attachments"] = "Take Attachments"
--[[Translation missing --]]
TSM.L["Target Character"] = "Target Character"
--[[Translation missing --]]
TSM.L["TARGET SHORTFALL TO BAGS"] = "TARGET SHORTFALL TO BAGS"
--[[Translation missing --]]
TSM.L["Tasks Added to Task List"] = "Tasks Added to Task List"
--[[Translation missing --]]
TSM.L["Text (%s)"] = "Text (%s)"
--[[Translation missing --]]
TSM.L["The canlearn filter was ignored because the CanIMogIt addon was not found."] = "The canlearn filter was ignored because the CanIMogIt addon was not found."
--[[Translation missing --]]
TSM.L["The 'Craft Value Method' (%s) did not return a value for this item."] = "The 'Craft Value Method' (%s) did not return a value for this item."
--[[Translation missing --]]
TSM.L["The 'disenchant' price source has been replaced by the more general 'destroy' price source. Please update your custom prices."] = "The 'disenchant' price source has been replaced by the more general 'destroy' price source. Please update your custom prices."
--[[Translation missing --]]
TSM.L["The min profit (%s) did not evalulate to a valid value for this item."] = "The min profit (%s) did not evalulate to a valid value for this item."
TSM.L["The name can ONLY contain letters. No spaces, numbers, or special characters."] = "名稱只能包括字母！不能有空格、數字或特殊字符。"
--[[Translation missing --]]
TSM.L["The number which would be queued (%d) is less than the min restock quantity (%d)."] = "The number which would be queued (%d) is less than the min restock quantity (%d)."
--[[Translation missing --]]
TSM.L["The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."] = "The operation applied to this item is invalid! Min restock of %d is higher than max restock of %d."
--[[Translation missing --]]
TSM.L["The player \"%s\" is already on your whitelist."] = "The player \"%s\" is already on your whitelist."
--[[Translation missing --]]
TSM.L["The profit of this item (%s) is below the min profit (%s)."] = "The profit of this item (%s) is below the min profit (%s)."
--[[Translation missing --]]
TSM.L["The seller name of the lowest auction for %s was not given by the server. Skipping this item."] = "The seller name of the lowest auction for %s was not given by the server. Skipping this item."
--[[Translation missing --]]
TSM.L["The TradeSkillMaster_AppHelper addon is not enabled and is required for proper operation of TSM. TSM has enabled it and requires a reload."] = "The TradeSkillMaster_AppHelper addon is not enabled and is required for proper operation of TSM. TSM has enabled it and requires a reload."
--[[Translation missing --]]
TSM.L["The TradeSkillMaster_AppHelper addon is not installed and is required for proper operation of TSM."] = "The TradeSkillMaster_AppHelper addon is not installed and is required for proper operation of TSM."
--[[Translation missing --]]
TSM.L["The unlearned filter was ignored because the CanIMogIt addon was not found."] = "The unlearned filter was ignored because the CanIMogIt addon was not found."
--[[Translation missing --]]
TSM.L["There is a crafting cost and crafted item value, but TSM_Crafting wasn't able to calculate a profit. This shouldn't happen!"] = "There is a crafting cost and crafted item value, but TSM_Crafting wasn't able to calculate a profit. This shouldn't happen!"
--[[Translation missing --]]
TSM.L["There is no TSM_Crafting operation applied to this item's TSM group (%s)."] = "There is no TSM_Crafting operation applied to this item's TSM group (%s)."
TSM.L["This group already has operations. Would you like to add another one or replace the last one?"] = "該分組已經擁有操作，您希望新增一個操作還是取代之前的操作?"
TSM.L["This group already has the max number of operation. Would you like to replace the last one?"] = "該分組已經擁有最大數量的操作了，您希望取代之前的操作嗎?"
--[[Translation missing --]]
TSM.L["This is not a valid profile name. Profile names must be at least one character long and may not contain '@' characters."] = "This is not a valid profile name. Profile names must be at least one character long and may not contain '@' characters."
--[[Translation missing --]]
TSM.L["This item does not have a crafting cost. Check that all of its mats have mat prices."] = "This item does not have a crafting cost. Check that all of its mats have mat prices."
--[[Translation missing --]]
TSM.L["This item is not in a TSM group."] = "This item is not in a TSM group."
--[[Translation missing --]]
TSM.L["This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general TSM_Crafting options."] = "This item will be added to the queue when you restock its group. If this isn't happening, make a post on the TSM forums with a screenshot of the item's tooltip, operation settings, and your general TSM_Crafting options."
--[[Translation missing --]]
TSM.L["This looks like an exported operation and not a custom price."] = "This looks like an exported operation and not a custom price."
--[[Translation missing --]]
TSM.L["This will copy the settings from '%s' into your currently-active one."] = "This will copy the settings from '%s' into your currently-active one."
--[[Translation missing --]]
TSM.L["This will permanently delete the '%s' profile."] = "This will permanently delete the '%s' profile."
--[[Translation missing --]]
TSM.L["This will reset all groups and operations (if not stored globally) to be wiped from this profile."] = "This will reset all groups and operations (if not stored globally) to be wiped from this profile."
--[[Translation missing --]]
TSM.L["Time"] = "Time"
--[[Translation missing --]]
TSM.L["Time Format"] = "Time Format"
--[[Translation missing --]]
TSM.L["Time Frame"] = "Time Frame"
--[[Translation missing --]]
TSM.L["TIME FRAME"] = "TIME FRAME"
--[[Translation missing --]]
TSM.L["TINKER"] = "TINKER"
--[[Translation missing --]]
TSM.L["Tooltip Price Format"] = "Tooltip Price Format"
--[[Translation missing --]]
TSM.L["Tooltip Settings"] = "Tooltip Settings"
--[[Translation missing --]]
TSM.L["Top Buyers:"] = "Top Buyers:"
--[[Translation missing --]]
TSM.L["Top Item:"] = "Top Item:"
--[[Translation missing --]]
TSM.L["Top Sellers:"] = "Top Sellers:"
--[[Translation missing --]]
TSM.L["Total"] = "Total"
--[[Translation missing --]]
TSM.L["Total Gold"] = "Total Gold"
--[[Translation missing --]]
TSM.L["Total Gold Earned:"] = "Total Gold Earned:"
--[[Translation missing --]]
TSM.L["Total Gold Spent:"] = "Total Gold Spent:"
--[[Translation missing --]]
TSM.L["Total Price"] = "Total Price"
--[[Translation missing --]]
TSM.L["Total Profit:"] = "Total Profit:"
--[[Translation missing --]]
TSM.L["Total Value"] = "Total Value"
--[[Translation missing --]]
TSM.L["Total Value of All Items: "] = "Total Value of All Items: "
--[[Translation missing --]]
TSM.L["Track Sales / Purchases via trade"] = "Track Sales / Purchases via trade"
--[[Translation missing --]]
TSM.L["TradeSkillMaster Info"] = "TradeSkillMaster Info"
--[[Translation missing --]]
TSM.L["Transform Value"] = "Transform Value"
--[[Translation missing --]]
TSM.L["TSM Banking"] = "TSM Banking"
--[[Translation missing --]]
TSM.L["TSM can sync data automatically between multiple accounts."] = "TSM can sync data automatically between multiple accounts."
--[[Translation missing --]]
TSM.L["TSM Crafting"] = "TSM Crafting"
--[[Translation missing --]]
TSM.L["TSM Destroying"] = "TSM Destroying"
--[[Translation missing --]]
TSM.L["TSM failed to scan some auctions. Please rerun the scan."] = "TSM failed to scan some auctions. Please rerun the scan."
--[[Translation missing --]]
TSM.L["TSM Groups"] = "TSM Groups"
--[[Translation missing --]]
TSM.L["TSM is missing important information from the TSM Desktop Application. Please ensure the TSM Desktop Application is running and is properly configured."] = "TSM is missing important information from the TSM Desktop Application. Please ensure the TSM Desktop Application is running and is properly configured."
--[[Translation missing --]]
TSM.L["TSM Mailing"] = "TSM Mailing"
--[[Translation missing --]]
TSM.L["TSM TASK LIST"] = "TSM TASK LIST"
--[[Translation missing --]]
TSM.L["TSM Vendoring"] = "TSM Vendoring"
TSM.L["TSM Version Info:"] = "TSM版本資訊:"
--[[Translation missing --]]
TSM.L["TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"] = "TSM_Accounting detected that you just traded %s %s in return for %s. Would you like Accounting to store a record of this trade?"
--[[Translation missing --]]
TSM.L["TSM4"] = "TSM4"
--[[Translation missing --]]
TSM.L["TUJ 3-Day Price"] = "TUJ 3-Day Price"
--[[Translation missing --]]
TSM.L["Twitter Integration"] = "Twitter Integration"
--[[Translation missing --]]
TSM.L["Twitter Integration Not Enabled"] = "Twitter Integration Not Enabled"
--[[Translation missing --]]
TSM.L["Type"] = "Type"
--[[Translation missing --]]
TSM.L["Type Something"] = "Type Something"
TSM.L["Unbalanced parentheses."] = "缺少括弧。"
--[[Translation missing --]]
TSM.L["Undercut amount:"] = "Undercut amount:"
--[[Translation missing --]]
TSM.L["Undercut by whitelisted player."] = "Undercut by whitelisted player."
--[[Translation missing --]]
TSM.L["Undercutting blacklisted player."] = "Undercutting blacklisted player."
--[[Translation missing --]]
TSM.L["Undercutting competition."] = "Undercutting competition."
--[[Translation missing --]]
TSM.L["Ungrouped Items"] = "Ungrouped Items"
--[[Translation missing --]]
TSM.L["Unknown Item"] = "Unknown Item"
--[[Translation missing --]]
TSM.L["Unwrap Gift"] = "Unwrap Gift"
--[[Translation missing --]]
TSM.L["Up"] = "Up"
--[[Translation missing --]]
TSM.L["UPDATE EXISTING MACRO"] = "UPDATE EXISTING MACRO"
TSM.L["Usage: /tsm price <ItemLink> <Price String>"] = "用法：/tsm price <ItemLink(物品鏈接)> <Price String(價格)>"
--[[Translation missing --]]
TSM.L["Use smart average for purchase price"] = "Use smart average for purchase price"
--[[Translation missing --]]
TSM.L["Use the field below to search the auction house by filter"] = "Use the field below to search the auction house by filter"
--[[Translation missing --]]
TSM.L["Use the list to the left to select groups, & operations you'd like to create export strings for."] = "Use the list to the left to select groups, & operations you'd like to create export strings for."
--[[Translation missing --]]
TSM.L["VALUE PRICE SOURCE"] = "VALUE PRICE SOURCE"
--[[Translation missing --]]
TSM.L["ValueSources"] = "ValueSources"
--[[Translation missing --]]
TSM.L["Variable Name"] = "Variable Name"
--[[Translation missing --]]
TSM.L["Vendor"] = "Vendor"
--[[Translation missing --]]
TSM.L["Vendor Buy Price"] = "Vendor Buy Price"
--[[Translation missing --]]
TSM.L["Vendor Search"] = "Vendor Search"
--[[Translation missing --]]
TSM.L["VENDOR SEARCH"] = "VENDOR SEARCH"
--[[Translation missing --]]
TSM.L["Vendor Sell"] = "Vendor Sell"
--[[Translation missing --]]
TSM.L["Vendor Sell Price"] = "Vendor Sell Price"
--[[Translation missing --]]
TSM.L["Vendoring 'SELL ALL' Button"] = "Vendoring 'SELL ALL' Button"
--[[Translation missing --]]
TSM.L["View ignored items in the Destroying options."] = "View ignored items in the Destroying options."
--[[Translation missing --]]
TSM.L["Warehousing"] = "Warehousing"
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group."] = "Warehousing will move a max of %d of each item in this group."
--[[Translation missing --]]
TSM.L["Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."] = "Warehousing will move a max of %d of each item in this group. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank, %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bags > bank/gbank. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group keeping %d of each item back when bank/gbank > bags. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group."] = "Warehousing will move all of the items in this group."
--[[Translation missing --]]
TSM.L["Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."] = "Warehousing will move all of the items in this group. Restock will maintain %d items in your bags."
--[[Translation missing --]]
TSM.L["WARNING: The macro was too long, so was truncated to fit by WoW."] = "WARNING: The macro was too long, so was truncated to fit by WoW."
--[[Translation missing --]]
TSM.L["WARNING: You minimum price for %s is below its vendorsell price (with AH cut taken into account). Consider raising your minimum price, or vendoring the item."] = "WARNING: You minimum price for %s is below its vendorsell price (with AH cut taken into account). Consider raising your minimum price, or vendoring the item."
--[[Translation missing --]]
TSM.L["When above maximum:"] = "When above maximum:"
--[[Translation missing --]]
TSM.L["When below minimum:"] = "When below minimum:"
--[[Translation missing --]]
TSM.L["Whitelist"] = "Whitelist"
--[[Translation missing --]]
TSM.L["Whitelisted Players"] = "Whitelisted Players"
--[[Translation missing --]]
TSM.L["You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"] = "You already have at least your max restock quantity of this item. You have %d and the max restock quantity is %d"
--[[Translation missing --]]
TSM.L["You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."] = "You can use the options below to clear old data. It is recommended to occasionally clear your old data to keep the accounting module running smoothly. Select the minimum number of days old to be removed, then click '%s'."
TSM.L["You cannot use %s as part of this custom price."] = "你不能使用%s作為自定義價格的一部份。"
--[[Translation missing --]]
TSM.L["You cannot use %s within convert() as part of this custom price."] = "You cannot use %s within convert() as part of this custom price."
--[[Translation missing --]]
TSM.L["You do not need to add \"%s\", alts are whitelisted automatically."] = "You do not need to add \"%s\", alts are whitelisted automatically."
--[[Translation missing --]]
TSM.L["You don't know how to craft this item."] = "You don't know how to craft this item."
--[[Translation missing --]]
TSM.L["You must reload your UI for these settings to take effect. Reload now?"] = "You must reload your UI for these settings to take effect. Reload now?"
--[[Translation missing --]]
TSM.L["You won an auction for %sx%d for %s"] = "You won an auction for %sx%d for %s"
--[[Translation missing --]]
TSM.L["Your auction has not been undercut."] = "Your auction has not been undercut."
--[[Translation missing --]]
TSM.L["Your auction of %s expired"] = "Your auction of %s expired"
--[[Translation missing --]]
TSM.L["Your auction of %s has sold for %s!"] = "Your auction of %s has sold for %s!"
--[[Translation missing --]]
TSM.L["Your Buyout"] = "Your Buyout"
--[[Translation missing --]]
TSM.L["Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"] = "Your craft value method for '%s' was invalid so it has been returned to the default. Details: %s"
--[[Translation missing --]]
TSM.L["Your default craft value method was invalid so it has been returned to the default. Details: %s"] = "Your default craft value method was invalid so it has been returned to the default. Details: %s"
--[[Translation missing --]]
TSM.L["Your task list is currently empty."] = "Your task list is currently empty."
--[[Translation missing --]]
TSM.L["You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."] = "You've been phased which has caused the AH to stop working due to a bug on Blizzard's end. Please close and reopen the AH and restart Sniper."
--[[Translation missing --]]
TSM.L["You've been undercut."] = "You've been undercut."
--[[Translation missing --]]
TSM.L["YY/MM/DD HH:MM"] = "YY/MM/DD HH:MM"
	else
		error("Unknown locale: "..tostring(locale))
	end

	--local HAS_STRINGS = next(TSM.L) and true or false
	setmetatable(TSM.L, {
		__index = function(t, k)
			--assert(not HAS_STRINGS)
			local v = tostring(k)
			rawset(t, k, v)
			return v
		end,
		__newindex = function(t, k, v)
			error("Cannot write to the locale table")
		end,
	})
end
