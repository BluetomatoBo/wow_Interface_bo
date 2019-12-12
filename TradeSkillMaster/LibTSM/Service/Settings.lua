-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--          http://www.curse.com/addons/wow/tradeskillmaster_warehousing          --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

local _, TSM = ...
local Settings = TSM.Init("Service.Settings")
local L = TSM.Include("Locale").GetTable()
local TempTable = TSM.Include("Util.TempTable")
local Table = TSM.Include("Util.Table")
local Math = TSM.Include("Util.Math")
local String = TSM.Include("Util.String")
local Log = TSM.Include("Util.Log")
local Sound = TSM.Include("Util.Sound")
local CSV = TSM.Include("Util.CSV")
local private = {
	context = {},
	proxies = {},
	profileWarning = nil,
	protectedAccessAllowed = {},
	cachedConnectedRealms = nil,
	upgradeContext = nil,
	svCopyErrorTime = 0,
	db = nil,
}
local LibRealmInfo = LibStub("LibRealmInfo")
local KEY_SEP = "@"
local SCOPE_KEY_SEP = " - "
local GLOBAL_SCOPE_KEY = " "
local DEFAULT_PROFILE_NAME = "Default"
local PLAYER = UnitName("player")
local FACTION = UnitFactionGroup("player")
local REALM = GetRealmName()
local VALID_TYPES = {
	boolean = true,
	string = true,
	table = true,
	number = true,
}
local SCOPE_TYPES = {
	global = "g",
	profile = "p",
	realm = "r",
	factionrealm = "f",
	char = "c",
	sync = "s",
}
local SCOPE_KEYS = {
	global = " ",
	profile = nil, -- set per-DB
	realm = REALM,
	factionrealm = strjoin(SCOPE_KEY_SEP, FACTION, REALM),
	char = strjoin(SCOPE_KEY_SEP, PLAYER, REALM),
	sync = strjoin(SCOPE_KEY_SEP, PLAYER, FACTION, REALM),
}
local DEFAULT_DB = {
	_version = -math.huge, -- DB version
	_currentProfile = {}, -- lookup table of the current profile name by character
	_syncAccountKey = {}, -- lookup table of the sync account key by factionrealm
	_syncOwner = {}, -- lookup table of the owner sync account key by character
	_hash = 0,
	_scopeKeys = {
		profile = {},
		realm = {},
		factionrealm = {},
		char = {},
		sync = {},
	},
}

-- Changelog:
-- [6] added 'global.locale' key
-- [7] changed default value of 'tsmItemTweetEnabled' to false
-- [8] added 'global.itemCacheVersion' key
-- [9] removed 'global.itemCacheVersion' key, added 'global.clientVersion' key
-- [10] first TSM4 version - combined all module settings into a single DB
-- [11] added profile.internalData.createdDefaultOperations
-- [12] added global.shoppingOptions.pctSource
-- [13] added profile.internalData.{managementGroupTreeContext,auctioningGroupTreeContext,shoppingGroupTreeContext}
-- [14] added global.userData.savedAuctioningSearches
-- [15] added global.coreOptions.bankUITab, profile.coreOptions.{bankUIBankFramePosition,bankUIGBankFramePosition}
-- [16] moved profile.coreOptions.{bankUIBankFramePosition,bankUIGBankFramePosition} to profile.internalData.{bankUIBankFramePosition,bankUIGBankFramePosition}
-- [17] added global.internalData.{mainUIFrameContext,auctionUIFrameContext,craftingUIFrameContext}
-- [18] removed global.internalData.itemStringLookup
-- [19] added sync scope (initially with internalData.{classKey,bagQuantity,bankQuantity,reagentBankQuantity,auctionQuantity,mailQuantity}), removed factionrealm.internalData.{syncMetadata,accountKey,inventory,characters} and factionrealm.coreOptions.syncAccounts, added global.debug.chatLoggingEnabled
-- [20] added global.tooltipOptions.enabled
-- [21] added global.craftingOptions.{profitPercent,questSmartCrafting,queueSort}
-- [22] added global.coreOptions.cleanGuildBank
-- [23] changed global.shoppingOptions.maxDeSearchPercent default to 100
-- [24] added global.auctioningOptions.{showAuctionDBTab,openAllBags,ahRowDisplay}
-- [25] split realm.internalData.goldLog into sync.internalData.goldLog and factionrealm.internalData.guildGoldLog
-- [26] added profile.internalData.{shoppingTabGroupContext,auctioningTabGroupContext}
-- [27] added char.internalData.craftingCooldowns
-- [28] added global.internalData.mailingUIFrameContext
-- [29] added global.internalData.vendoringUIFrameContext
-- [30] added global.internalData.bankingUIFrameContext
-- [31] changed global.internalData.bankingUIFrameContext default (isOpen = true), added profile.internalData.{bankingWarehousingGroupTreeContext,bankingAuctioningGroupTreeContext,bankingMailingGroupTreeContext}
-- [32] removed factionrealm.internalData.gathering, added factionrealm.internalData.gatheringContext.{crafter,professions}, added profile.gatheringOptions.sources
-- [33] added global.internalData.taskListUIFrameContext
-- [34] removed realm.internalData.{lastAuctionDBCompleteScan,lastAuctionDBSaveTime,auctionDBScanData}
-- [35] added factionrealm.userData.craftingCooldownIgnore
-- [36] removed factionrealm.internalData.playerProfessions and added sync.internalData.playerProfessions
-- [37] removed global.auctioningOptions.showAuctionDBTab
-- [38] removed global.mailingOptions.{defaultMailTab,autoCheck,displayMoneyCollected,deleteEmptyNPCMail,showReloadBtn,sendDelay,defaultPage}, added global.mailingOptions.recentlyMailedList
-- [39] added profile.internalData.{craftingGroupTreeContext,mailingGroupTreeContext,vendoringGroupTreeContext,importGroupTreeContext}
-- [40] removed global.accountingOptions.{timeFormat,mvSource}
-- [41] removed global.coreOptions.groupPriceSource
-- [42] removed global.vendoringOptions.defaultMerchantTab
-- [43] removed global.coreOptions.{moveDelay,bankUITab}, removed global.auctioningOptions.{openAllBags,ahRowDisplay}, removed global.craftingOptions.{profitPercent,questSmartCrafting,queueSort}, removed global.destroyingOptions.{logDays,timeFormat}, removed global.vendoringOptions.{autoSellTrash,qsHideGrouped,qsHideSoulbound,qsBatchSize,defaultPage,qsMaxMarketValue,qsDestroyValue}, removed profile.coreOptions.{cleanBags,cleanBank,cleanReagentBank,cleanGuildBank}
-- [44] changed global.internalData.{mainUIFrameContext,auctionUIFrameContext,craftingUIFrameContext,destroyingUIFrameContext,mailingUIFrameContext,vendoringUIFrameContext,bankingUIFrameContext} default (added "scale = 1")
-- [45] added char.internalData.auctionSaleHints
-- [46] added global.shoppingOptions.{buyoutConfirm,buyoutAlertSource}
-- [47] added factionrealm.internalData.expiringMail and factionrealm.internalData.expiringAuction
-- [48] added profile.internalData.exportGroupTreeContext
-- [49] added factionrealm.internalData.{mailDisenchantablesChar,mailExcessGoldChar,mailExcessGoldLimit}
-- [50] added factionrealm.internalData.{csvAuctionDBScan,auctionDBScanTime,auctionDBScanHash}
-- [51-53] resetting factionrealm.internalData.crafts

local SETTINGS_INFO = {
	version = 53,
	global = {
		debug = {
			chatLoggingEnabled = { type = "boolean", default = false, lastModifiedVersion = 19 },
		},
		internalData = {
			vendorItems = { type = "table", default = {}, lastModifiedVersion = 10 },
			appMessageId = { type = "number", default = 0, lastModifiedVersion = 10 },
			destroyingHistory = { type = "table", default = {}, lastModifiedVersion = 10 },
			mainUIFrameContext = { type = "table", default = { width = 948, height = 757, centerX = 0, centerY = 0, page = 1, scale = 1 }, lastModifiedVersion = 44 },
			auctionUIFrameContext = { type = "table", default = { width = 830, height = 587, centerX = -300, centerY = 100, page = 1, scale = 1 }, lastModifiedVersion = 44 },
			craftingUIFrameContext = { type = "table", default = { width = 820, height = 587, centerX = -200, centerY = 0, page = 1, scale = 1 }, lastModifiedVersion = 44 },
			destroyingUIFrameContext = { type = "table", default = { width = 296, height = 442, centerX = 0, centerY = 0, scale = 1 }, lastModifiedVersion = 44 },
			mailingUIFrameContext = { type = "table", default = { width = 560, height = 500, centerX = -200, centerY = 0, page = 1, scale = 1 }, lastModifiedVersion = 44 },
			vendoringUIFrameContext = { type = "table", default = { width = 560, height = 500, centerX = -200, centerY = 0, page = 1, scale = 1 }, lastModifiedVersion = 44 },
			bankingUIFrameContext = { type = "table", default = { width = 325, height = 600, centerX = 500, centerY = 0, tab = "Warehousing", isOpen = true, scale = 1 }, lastModifiedVersion = 44 },
			taskListUIFrameContext = { type = "table", default = { topRightX = -220, topRightY = -10, minimized = false, isOpen = true }, lastModifiedVersion = 33 },
		},
		coreOptions = {
			globalOperations = { type = "boolean", default = false, lastModifiedVersion = 10 },
			chatFrame = { type = "string", default = "", lastModifiedVersion = 10 },
			auctionSaleSound = { type = "string", default = Sound.GetNoSoundKey(), lastModifiedVersion = 10 },
			minimapIcon = { type = "table", default = { hide = false, minimapPos = 220, radius = 80 }, lastModifiedVersion = 10 },
			destroyValueSource = { type = "string", default = "dbmarket", lastModifiedVersion = 10 },
			groupPriceSource = { type = "string", default = "dbmarket", lastModifiedVersion = 41 },
			-- TODO: remove these settings when it's safe to bump our version
			tsmItemTweetEnabled = { type = "boolean", default = false, lastModifiedVersion = 10 },
			auctionSaleEnabled = { type = "boolean", default = true, lastModifiedVersion = 10 },
			auctionBuyEnabled = { type = "boolean", default = true, lastModifiedVersion = 10 },
		},
		accountingOptions = {
			trackTrades = { type = "boolean", default = true, lastModifiedVersion = 10 },
			autoTrackTrades = { type = "boolean", default = false, lastModifiedVersion = 10 },
			smartBuyPrice = { type = "boolean", default = false, lastModifiedVersion = 10 },
		},
		auctioningOptions = {
			cancelWithBid = { type = "boolean", default = false, lastModifiedVersion = 10 },
			disableInvalidMsg = { type = "boolean", default = false, lastModifiedVersion = 10 },
			roundNormalPrice = { type = "boolean", default = false, lastModifiedVersion = 10 },
			matchWhitelist = { type = "boolean", default = true, lastModifiedVersion = 10 },
			scanCompleteSound = { type = "string", default = Sound.GetNoSoundKey(), lastModifiedVersion = 10 },
			confirmCompleteSound = { type = "string", default = Sound.GetNoSoundKey(), lastModifiedVersion = 10 },
		},
		craftingOptions = {
			ignoreCDCraftCost = { type = "boolean", default = true, lastModifiedVersion = 10 },
			defaultMatCostMethod = { type = "string", default = "min(dbmarket, crafting, vendorbuy, convert(dbmarket))", lastModifiedVersion = 10 },
			defaultCraftPriceMethod = { type = "string", default = "first(dbminbuyout, dbmarket)", lastModifiedVersion = 10 },
			ignoreCharacters = { type = "table", default = {}, lastModifiedVersion = 10 },
			ignoreGuilds = { type = "table", default = {}, lastModifiedVersion = 10 },
		},
		destroyingOptions = {
			autoStack = { type = "boolean", default = true, lastModifiedVersion = 10 },
			includeSoulbound = { type = "boolean", default = false, lastModifiedVersion = 10 },
			autoShow = { type = "boolean", default = true, lastModifiedVersion = 10 },
			deMaxQuality = { type = "number", default = 3, lastModifiedVersion = 10 },
			deAbovePrice = { type = "string", default = "0c", lastModifiedVersion = 10 },
		},
		mailingOptions = {
			sendItemsIndividually = { type = "boolean", default = false, lastModifiedVersion = 10 },
			inboxMessages = { type = "boolean", default = true, lastModifiedVersion = 10 },
			sendMessages = { type = "boolean", default = true, lastModifiedVersion = 10 },
			resendDelay = { type = "number", default = 1, lastModifiedVersion = 10 },
			keepMailSpace = { type = "number", default = 0, lastModifiedVersion = 10 },
			deMaxQuality = { type = "number", default = 2, lastModifiedVersion = 10 },
			openMailSound = { type = "string", default = Sound.GetNoSoundKey(), lastModifiedVersion = 10 },
			recentlyMailedList = { type = "table", default = {}, lastModifiedVersion = 38 },
		},
		shoppingOptions = {
			minDeSearchLvl = { type = "number", default = 1, lastModifiedVersion = 10 },
			maxDeSearchLvl = { type = "number", default = 735, lastModifiedVersion = 10 },
			maxDeSearchPercent = { type = "number", default = 100, lastModifiedVersion = 23 },
			pctSource  = { type = "string", default = "dbmarket", lastModifiedVersion = 12 },
			buyoutConfirm  = { type = "boolean", default = false, lastModifiedVersion = 46 },
			buyoutAlertSource  = { type = "string", default = "min(100000g, 200% dbmarket)", lastModifiedVersion = 46 },
		},
		sniperOptions = {
			sniperSound = { type = "string", default = Sound.GetNoSoundKey(), lastModifiedVersion = 10 },
		},
		vendoringOptions = {
			displayMoneyCollected = { type = "boolean", default = false, lastModifiedVersion = 10 },
			qsMarketValue = { type = "string", default = "dbmarket", lastModifiedVersion = 10 },
		},
		tooltipOptions = {
			enabled = { type = "boolean", default = true, lastModifiedVersion = 20 },
			embeddedTooltip = { type = "boolean", default = true, lastModifiedVersion = 10 },
			customPriceTooltips = { type = "table", default = {}, lastModifiedVersion = 10 },
			moduleTooltips = { type = "table", default = {}, lastModifiedVersion = 10 },
			vendorBuyTooltip = { type = "boolean", default = true, lastModifiedVersion = 10 },
			vendorSellTooltip = { type = "boolean", default = true, lastModifiedVersion = 10 },
			groupNameTooltip = { type = "boolean", default = true, lastModifiedVersion = 10 },
			detailedDestroyTooltip = { type = "boolean", default = false, lastModifiedVersion = 10 },
			millTooltip = { type = "boolean", default = true, lastModifiedVersion = 10 },
			prospectTooltip = { type = "boolean", default = true, lastModifiedVersion = 10 },
			deTooltip = { type = "boolean", default = true, lastModifiedVersion = 10 },
			transformTooltip = { type = "boolean", default = true, lastModifiedVersion = 10 },
			operationTooltips = { type = "table", default = {}, lastModifiedVersion = 10 },
			tooltipShowModifier = { type = "string", default = "none", lastModifiedVersion = 10 },
			inventoryTooltipFormat = { type = "string", default = "full", lastModifiedVersion = 10 },
			tooltipPriceFormat = { type = "string", default = "text", lastModifiedVersion = 10 },
		},
		userData = {
			operations = { type = "table", default = {}, lastModifiedVersion = 10 },
			customPriceSources = { type = "table", default = {}, lastModifiedVersion = 10 },
			destroyingIgnore = { type = "table", default = {}, lastModifiedVersion = 10 },
			savedShoppingSearches = { type = "table", default = {}, lastModifiedVersion = 10 },
			vendoringIgnore = { type = "table", default = {}, lastModifiedVersion = 10 },
			savedAuctioningSearches = { type = "table", default = {}, lastModifiedVersion = 14 },
		},
	},
	profile = {
		internalData = {
			createdDefaultOperations = { type = "boolean", default = false, lastModifiedVersion = 11 },
			managementGroupTreeContext = { type = "table", default = {}, lastModifiedVersion = 13 },
			auctioningGroupTreeContext = { type = "table", default = {}, lastModifiedVersion = 13 },
			shoppingGroupTreeContext = { type = "table", default = {}, lastModifiedVersion = 13 },
			shoppingTabGroupContext = { type = "table", default = {}, lastModifiedVersion = 26 },
			auctioningTabGroupContext = { type = "table", default = {}, lastModifiedVersion = 26 },
			bankUIBankFramePosition = { type = "table", default = { 100, 300 }, lastModifiedVersion = 16 },
			bankUIGBankFramePosition = { type = "table", default = { 100, 300 }, lastModifiedVersion = 16 },
			bankingWarehousingGroupTreeContext = { type = "table", default = {}, lastModifiedVersion = 31 },
			bankingAuctioningGroupTreeContext = { type = "table", default = {}, lastModifiedVersion = 31 },
			bankingMailingGroupTreeContext = { type = "table", default = {}, lastModifiedVersion = 31 },
			craftingGroupTreeContext = { type = "table", default = {}, lastModifiedVersion = 39 },
			mailingGroupTreeContext = { type = "table", default = {}, lastModifiedVersion = 39 },
			vendoringGroupTreeContext = { type = "table", default = {}, lastModifiedVersion = 39 },
			importGroupTreeContext = { type = "table", default = {}, lastModifiedVersion = 39 },
			exportGroupTreeContext = { type = "table", default = {}, lastModifiedVersion = 48 },
		},
		userData = {
			groups = { type = "table", default = {}, lastModifiedVersion = 10 },
			items = { type = "table", default = {}, lastModifiedVersion = 10 },
			operations = { type = "table", default = {}, lastModifiedVersion = 10 },
		},
		gatheringOptions = {
			sources = { type = "table", default = { "vendor", "guildBank", "alt", "altGuildBank", "craftProfit", "auction", "craftNoProfit" }, lastModifiedVersion = 32 },
		},
	},
	factionrealm = {
		internalData = {
			characterGuilds = { type = "table", default = {}, lastModifiedVersion = 10 },
			guildVaults = { type = "table", default = {}, lastModifiedVersion = 10 },
			pendingMail = { type = "table", default = {}, lastModifiedVersion = 10 },
			expiringMail = { type = "table", default = {}, lastModifiedVersion = 47 },
			expiringAuction = { type = "table", default = {}, lastModifiedVersion = 47 },
			mailDisenchantablesChar = { type = "string", default = "", lastModifiedVersion = 49 },
			mailExcessGoldChar = { type = "string", default = "", lastModifiedVersion = 49 },
			mailExcessGoldLimit = { type = "number", default = 10000000000, lastModifiedVersion = 49 },
			crafts = { type = "table", default = {}, lastModifiedVersion = 53 },
			mats = { type = "table", default = {}, lastModifiedVersion = 10 },
			guildGoldLog = { type = "table", default = {}, lastModifiedVersion = 25 },
			csvAuctionDBScan = { type = "string", default = "", lastModifiedVersion = 50 },
			auctionDBScanTime = { type = "number", default = 0, lastModifiedVersion = 50 },
			auctionDBScanHash = { type = "number", default = 0, lastModifiedVersion = 50 },
		},
		coreOptions = {
			ignoreGuilds = { type = "table", default = {}, lastModifiedVersion = 10 },
		},
		auctioningOptions = {
			whitelist = { type = "table", default = {}, lastModifiedVersion = 10 },
		},
		gatheringContext = {
			crafter = { type = "string", default = "", lastModifiedVersion = 32 },
			professions = { type = "table", default = {}, lastModifiedVersion = 32 },
		},
		userData = {
			craftingCooldownIgnore = { type = "table", default = {}, lastModifiedVersion = 35 },
		},
	},
	realm = {
		internalData = {
			csvSales = { type = "string", default = "", lastModifiedVersion = 10 },
			csvBuys = { type = "string", default = "", lastModifiedVersion = 10 },
			csvIncome = { type = "string", default = "", lastModifiedVersion = 10 },
			csvExpense = { type = "string", default = "", lastModifiedVersion = 10 },
			csvExpired = { type = "string", default = "", lastModifiedVersion = 10 },
			csvCancelled = { type = "string", default = "", lastModifiedVersion = 10 },
			saveTimeSales = { type = "string", default = "", lastModifiedVersion = 10 },
			saveTimeBuys = { type = "string", default = "", lastModifiedVersion = 10 },
			saveTimeExpires = { type = "string", default = "", lastModifiedVersion = 10 },
			saveTimeCancels = { type = "string", default = "", lastModifiedVersion = 10 },
			accountingTrimmed = { type = "table", default = {}, lastModifiedVersion = 10 },
		},
	},
	char = {
		internalData = {
			auctionPrices = { type = "table", default = {}, lastModifiedVersion = 10 },
			auctionMessages = { type = "table", default = {}, lastModifiedVersion = 10 },
			craftingCooldowns = { type = "table", default = {}, lastModifiedVersion = 27 },
			auctionSaleHints = { type = "table", default = {}, lastModifiedVersion = 45 },
		},
	},
	sync = {
		-- NOTE: whenever these are changed, the sync version needs to be increased in Core/Lib/Sync/Core.lua
		internalData = {
			classKey = { type = "string", default = "", lastModifiedVersion = 19 },
			bagQuantity = { type = "table", default = {}, lastModifiedVersion = 19 },
			bankQuantity = { type = "table", default = {}, lastModifiedVersion = 19 },
			reagentBankQuantity = { type = "table", default = {}, lastModifiedVersion = 19 },
			auctionQuantity = { type = "table", default = {}, lastModifiedVersion = 19 },
			mailQuantity = { type = "table", default = {}, lastModifiedVersion = 19 },
			goldLog = { type = "string", default = "", lastModifiedVersion = 25 },
			playerProfessions = { type = "table", default = {}, lastModifiedVersion = 36 },
		},
	},
}



-- ============================================================================
-- Module Loading
-- ============================================================================

Settings:OnSettingsLoad(function()
	local db, upgradeObj = private.Constructor("TradeSkillMasterDB", SETTINGS_INFO)
	private.db = db
	if not upgradeObj then
		return
	end

	-- process DB upgrades
	local prevVersion = upgradeObj:GetPrevVersion()
	if prevVersion < 19 then
		-- migrate inventory data to the sync scope
		local oldInventoryData = TempTable.Acquire()
		local oldSyncMetadata = TempTable.Acquire()
		local oldAccountKey = TempTable.Acquire()
		local oldCharacters = TempTable.Acquire()
		for key, value in upgradeObj:RemovedSettingIterator() do
			local scopeType, scopeKey, _, settingKey = upgradeObj:GetKeyInfo(key)
			if scopeType == "factionrealm" then
				if settingKey == "inventory" then
					oldInventoryData[scopeKey] = value
				elseif settingKey == "syncMetadata" then
					oldSyncMetadata[scopeKey] = value
				elseif settingKey == "accountKey" then
					oldAccountKey[scopeKey] = value
				elseif settingKey == "characters" then
					oldCharacters[scopeKey] = value
				end
			end
		end
		for factionrealm, characters in pairs(oldInventoryData) do
			local syncMetadata = oldSyncMetadata[factionrealm] and oldSyncMetadata[factionrealm].TSM_CHARACTERS
			for character, inventoryData in pairs(characters) do
				if not syncMetadata or not syncMetadata[character] or syncMetadata[character].owner == oldAccountKey[factionrealm] then
					db:NewSyncCharacter(character, db:GetSyncAccountKey(factionrealm), factionrealm)
					local syncScopeKey = db:GetSyncScopeKeyByCharacter(character, factionrealm)
					local class = oldCharacters[factionrealm] and oldCharacters[factionrealm][character]
					if type(class) == "string" then
						db:Set("sync", syncScopeKey, "internalData", "classKey", class)
					end
					db:Set("sync", syncScopeKey, "internalData", "bagQuantity", inventoryData.bag)
					db:Set("sync", syncScopeKey, "internalData", "bankQuantity", inventoryData.bank)
					db:Set("sync", syncScopeKey, "internalData", "reagentBankQuantity", inventoryData.reagentBank)
					db:Set("sync", syncScopeKey, "internalData", "auctionQuantity", inventoryData.auction)
					db:Set("sync", syncScopeKey, "internalData", "mailQuantity", inventoryData.mail)
				end
			end
		end
		TempTable.Release(oldInventoryData)
		TempTable.Release(oldSyncMetadata)
		TempTable.Release(oldAccountKey)
		TempTable.Release(oldCharacters)
	end
	if prevVersion < 25 then
		-- migrate gold log info
		local NEW_CSV_COLS = { "minute", "copper" }
		local function ConvertGoldLogFormat(data)
			local decodedData = select(2, CSV.Decode(data))
			if not decodedData then
				return
			end
			for _, entry in ipairs(decodedData) do
				local minute = entry.startMinute
				local copper = entry.copper
				wipe(entry)
				entry.minute = minute
				entry.copper = copper
			end
			return CSV.Encode(NEW_CSV_COLS, decodedData)
		end
		local function ProcessGoldLogData(character, data, scopeKey)
			if type(data) ~= "string" then
				return
			end
			-- check if we know about this character and under what faction
			local syncScopeKey = nil
			for factionrealm in db:FactionrealmByRealmIterator(scopeKey) do
				local testSyncScopeKey = db:GetSyncScopeKeyByCharacter(character, factionrealm)
				if db:Get("sync", testSyncScopeKey, "internalData", "classKey") then
					syncScopeKey = testSyncScopeKey
				end
			end
			if syncScopeKey then
				db:Set("sync", syncScopeKey, "internalData", "goldLog", ConvertGoldLogFormat(data))
			else
				-- check if this is a known guild
				local found = false
				for factionrealm in db:FactionrealmByRealmIterator(scopeKey) do
					local characterGuilds = db:Get("factionrealm", factionrealm, "internalData", "characterGuilds")
					if not found and characterGuilds and Table.KeyByValue(characterGuilds, character) then
						local guildGoldLog = db:Get("factionrealm", factionrealm, "internalData", "guildGoldLog") or {}
						guildGoldLog[character] = ConvertGoldLogFormat(data)
						db:Set("factionrealm", factionrealm, "internalData", "guildGoldLog", guildGoldLog)
						found = true
					end
				end
			end
		end
		if prevVersion >= 10 then
			for key, value in upgradeObj:RemovedSettingIterator() do
				local scopeType, scopeKey, _, settingKey = upgradeObj:GetKeyInfo(key)
				if scopeType == "realm" and settingKey == "goldLog" then
					for character, data in pairs(value) do
						ProcessGoldLogData(character, data, scopeKey)
					end
				end
			end
		end
	end
	if prevVersion < 36 then
		for key, value in upgradeObj:RemovedSettingIterator() do
			local scopeType, factionrealm, _, settingKey = upgradeObj:GetKeyInfo(key)
			if scopeType == "factionrealm" and settingKey == "playerProfessions" then
				for character, data in pairs(value) do
					-- check if we know about this character
					local syncScopeKey = db:GetSyncScopeKeyByCharacter(character, factionrealm)
					if db:Get("sync", syncScopeKey, "internalData", "classKey") then
						db:Set("sync", syncScopeKey, "internalData", "playerProfessions", data)
					end
				end
			end
		end
	end
	if prevVersion < 53 and not TSM.IsWowClassic() then
		for key, value in upgradeObj:RemovedSettingIterator() do
			local scopeType, factionrealm, namespace, settingKey = upgradeObj:GetKeyInfo(key)
			if scopeType == "factionrealm" and namespace == "internalData" and settingKey == "crafts" then
				db:Set("factionrealm", factionrealm, "internalData", "crafts", value)
			end
		end
	end
end)



-- ============================================================================
-- Module Functions
-- ============================================================================

-- TODO: get rid of this
function Settings.GetDB()
	assert(private.db)
	return private.db
end

function Settings.NewView()
	assert(private.db)
	return private.CreateView(private.db)
end

function Settings.Get(scope, scopeKey, namespace, key)
	return private.db:Get(scope, scopeKey, namespace, key)
end

function Settings.Set(scope, scopeKey, namespace, key, value)
	return private.db:Set(scope, scopeKey, namespace, key, value)
end

function Settings.GetCurrentSyncAccountKey()
	return private.db:GetSyncAccountKey()
end

function Settings.GetSyncScopeKeyByCharacter(character)
	return private.db:GetSyncScopeKeyByCharacter(character)
end

function Settings.GetCharacterSyncAccountKey(character)
	return private.context[private.db].db._syncOwner[private.db:GetSyncScopeKeyByCharacter(character)]
end

function Settings.ShowSyncSVCopyError()
	if time() - private.svCopyErrorTime < 60 then
		return
	end
	private.svCopyErrorTime = time()
	Log.PrintfUser(L["It appears that you've manually copied your saved variables between accounts which will cause TSM's automatic sync'ing to not work. You'll need to undo this, and/or delete the TradeSkillMaster saved variables files on both accounts (with WoW closed) in order to fix this."])
end

function Settings.CharacterByAccountFactionrealmIterator(account, factionrealm)
	factionrealm = factionrealm or SCOPE_KEYS.factionrealm
	account = account or private.db:GetSyncAccountKey(factionrealm)
	local result = TempTable.Acquire()
	for scopeKey, ownerAccount in pairs(private.context[private.db].db._syncOwner) do
		if ownerAccount == account then
			local character = strmatch(scopeKey, "^(.+)"..String.Escape(SCOPE_KEY_SEP..factionrealm))
			if character then
				tinsert(result, character)
			end
		end
	end
	return TempTable.Iterator(result)
end

function Settings.CharacterByFactionrealmIterator(factionrealm)
	factionrealm = factionrealm or SCOPE_KEYS.factionrealm
	local result = TempTable.Acquire()
	for scopeKey in pairs(private.context[private.db].db._syncOwner) do
		local character = strmatch(scopeKey, "^(.+)"..String.Escape(SCOPE_KEY_SEP..factionrealm))
		if character then
			tinsert(result, character)
		end
	end
	return TempTable.Iterator(result)
end

function Settings.IsCurrentAccountOwner(character)
	return Settings.GetCharacterSyncAccountKey(character) == Settings.GetCurrentSyncAccountKey()
end

function Settings.ConnectedFactionrealmAltCharacterIterator()
	local result = TempTable.Acquire()
	for factionrealm in private.db:GetConnectedRealmIterator("factionrealm") do
		for scopeKey in pairs(private.context[private.db].db._syncOwner) do
			local character = strmatch(scopeKey, "^(.+)"..String.Escape(SCOPE_KEY_SEP..factionrealm))
			if character and (factionrealm ~= SCOPE_KEYS.factionrealm or character ~= PLAYER) then
				tinsert(result, factionrealm)
				tinsert(result, character)
				tinsert(result, character..SCOPE_KEY_SEP..factionrealm)
			end
		end
	end
	return TempTable.Iterator(result, 3)
end

function Settings.SyncAccountIterator()
	local result = TempTable.Acquire()
	local used = TempTable.Acquire()
	for _, syncOwner in pairs(private.context[private.db].db._syncOwner) do
		if strmatch(syncOwner, "^"..String.Escape(SCOPE_KEYS.factionrealm..SCOPE_KEY_SEP).."(%d+)$") and not used[syncOwner] and syncOwner ~= Settings.GetCurrentSyncAccountKey() then
			used[syncOwner] = true
			tinsert(result, syncOwner)
		end
	end
	TempTable.Release(used)
	return TempTable.Iterator(result)
end

function Settings.NewSyncCharacter(accountKey, character)
	local factionrealm = SCOPE_KEYS.factionrealm
	assert(strmatch(accountKey, "^"..String.Escape(factionrealm..SCOPE_KEY_SEP).."(%d+)$"), "Invalid account key")
	local scopeKey = private.db:GetSyncScopeKeyByCharacter(character, factionrealm)
	local context = private.context[private.db]
	context.db._syncOwner[scopeKey] = accountKey
	if not tContains(context.db._scopeKeys.sync, scopeKey) then
		tinsert(context.db._scopeKeys.sync, scopeKey)
	end
	private.SetScopeDefaults(context.db, context.settingsInfo, strjoin(KEY_SEP, SCOPE_TYPES.sync, String.Escape(scopeKey), ".+", ".+"))
end

function Settings.RemoveSyncAccount(accountKey)
	local settingsDB = private.context[private.db].db
	assert(accountKey ~= private.db:GetSyncAccountKey())
	local scopeKeysToRemove = TempTable.Acquire()
	for scopeKey, ownerAccountKey in pairs(settingsDB._syncOwner) do
		if ownerAccountKey == accountKey then
			tinsert(scopeKeysToRemove, scopeKey)
		end
	end
	for _, scopeKey in ipairs(scopeKeysToRemove) do
		private.db:DeleteScope("sync", scopeKey)
		settingsDB._syncOwner[scopeKey] = nil
	end
	TempTable.Release(scopeKeysToRemove)
end

function Settings.RemoveSyncCharacter(character)
	local settingsDB = private.context[private.db].db
	local scopeKey = private.db:GetSyncScopeKeyByCharacter(character)
	private.db:DeleteScope("sync", scopeKey)
	settingsDB._syncOwner[scopeKey] = nil
end

function Settings.SyncSettingIterator()
	local result = TempTable.Acquire()
	for namespace, settings in pairs(private.context[private.db].settingsInfo.sync) do
		for settingKey in pairs(settings) do
			tinsert(result, namespace)
			tinsert(result, settingKey)
		end
	end
	return TempTable.Iterator(result, 2)
end



-- ============================================================================
-- Main SettingsDB Class
-- ============================================================================

local PROTECTED_TABLE_MT = {
	__newindex = function(self, key, value)
		assert(private.protectedAccessAllowed[self], "Attempting to modify a protected table")
		rawset(self, key, value)
	end,
	__metatable = false
}

local SETTINGS_MT = {
	-- getter
	__index = function(self, key)
		if private.SettingsDBMethods[key] then
			return private.SettingsDBMethods[key]
		elseif SCOPE_TYPES[key] then
			return private.context[self].scopeProxies[key]
		else
			error("Invalid scope: "..tostring(key))
		end
	end,

	-- setter
	__newindex = function(self, key, value)
		error("You cannot set values in this table! You're probably missing a scope.")
	end,

	__metatable = false,
}

function private.Constructor(name, rawSettingsInfo)
	assert(type(name) == "string")
	assert(type(rawSettingsInfo) == "table")
	local version = rawSettingsInfo.version
	assert(type(version) == "number" and version >= 1)

	-- get (and create if necessary) the global table
	local db = _G[name]
	if not db then
		db = {}
		_G[name] = db
	end

	-- flatten and validate rawSettingsInfo and generate hash data
	local settingsInfo = CopyTable(rawSettingsInfo)
	local hashDataParts = TempTable.Acquire()
	for scope, scopeSettingsInfo in pairs(rawSettingsInfo) do
		if scope ~= "version" then
			assert(SCOPE_TYPES[scope], "Invalid scope: "..tostring(scope))
			for namespace, namespaceSettingsInfo in pairs(scopeSettingsInfo) do
				assert(type(namespace) == "string" and type(namespaceSettingsInfo) == "table")
				assert(not strfind(namespace, KEY_SEP))
				for key, info in pairs(namespaceSettingsInfo) do
					assert(type(key) == "string" and type(info) == "table", "Invalid type for key: "..tostring(key))
					assert(not strfind(key, KEY_SEP))
					for k, v in pairs(info) do
						if k == "type" then
							assert(VALID_TYPES[info.type], "Invalid type for key: "..key)
						elseif k == "default" then
							assert(v == nil or type(v) == info.type, "Invalid default for key: "..key)
							-- if the default is a table, it must not contain non-empty tables
							if type(v) == "table" then
								for k2, v2 in pairs(v) do
									assert(type(k2) == "string" or type(k2) == "number")
									assert(type(v2) ~= "table" or not next(v2), "Default has non-empty table attribute: "..k2)
								end
							end
						elseif k == "lastModifiedVersion" then
							assert(type(v) == "number" and v <= version, "Invalid lastModifiedVersion for key: "..key)
						else
							error("Unexpected key in settingsInfo for key: "..key)
						end
					end
					tinsert(hashDataParts, strjoin(",", key, scope, namespace, info.type, type(info.default) == "table" and "table" or tostring(info.default)))
				end
			end
		end
	end
	sort(hashDataParts)
	local hash = Math.CalculateHash(table.concat(hashDataParts, ";"))
	TempTable.Release(hashDataParts)

	-- reset the DB if it's not valid
	local isValid = true
	if not next(db) then
		-- new DB
		isValid = false
	elseif not private.ValidateDB(db) then
		-- corrupted DB
		assert(not TSM.IsDevVersion(), "DB is not valid!")
		isValid = false
	elseif db._version == version and db._hash ~= hash then
		-- the hash didn't match
		assert(not TSM.IsDevVersion(), "Invalid settings hash! Did you forget to increase the version?")
		isValid = false
	elseif db._version > version then
		-- this is a downgrade
		assert(not TSM.IsDevVersion(), "Unexpected DB version! If you really want to downgrade, comment out this line (remember to uncomment before committing).")
		isValid = false
	elseif db._syncOwner and db._syncOwner[SCOPE_KEYS.sync] and db._syncOwner[SCOPE_KEYS.sync] ~= db._syncAccountKey[SCOPE_KEYS.factionrealm] then
		-- we aren't the owner of this character, so wipe the DB and show a manual error
		Settings.ShowSyncSVCopyError()
		assert(not TSM.IsDevVersion(), "Settings are corrupted due to manual copying of saved variables file")
		isValid = false
	end
	if not isValid then
		-- wipe the DB and start over
		wipe(db)
		for key, value in pairs(DEFAULT_DB) do
			db[key] = private.CopyData(value)
		end
	end
	db._hash = hash

	if not db._syncOwner then
		-- we just upgraded to the first version with the sync scope
		db._syncOwner = {}
		db._syncAccountKey = {}
		db._scopeKeys.sync = {}
	end

	-- make sure we have sync acocunt keys for every factionrealm
	for _, factionrealm in ipairs(db._scopeKeys.factionrealm) do
		db._syncAccountKey[factionrealm] = db._syncAccountKey[factionrealm] or strjoin(SCOPE_KEY_SEP, factionrealm, random(time()))
	end
	-- create the sync account key for this factionrealm if necessary
	db._syncAccountKey[SCOPE_KEYS.factionrealm] = db._syncAccountKey[SCOPE_KEYS.factionrealm] or strjoin(SCOPE_KEY_SEP, SCOPE_KEYS.factionrealm, random(time()))
	-- set the sync owner of the current sync scope key to this account
	db._syncOwner[SCOPE_KEYS.sync] = db._syncOwner[SCOPE_KEYS.sync] or db._syncAccountKey[SCOPE_KEYS.factionrealm]

	-- setup current scope keys and set defaults for new keys
	db._currentProfile[SCOPE_KEYS.char] = db._currentProfile[SCOPE_KEYS.char] or DEFAULT_PROFILE_NAME
	local currentScopeKeys = CopyTable(SCOPE_KEYS)
	currentScopeKeys.profile = db._currentProfile[SCOPE_KEYS.char]
	for scopeType, scopeKey in pairs(currentScopeKeys) do
		if scopeType ~= "global" and not tContains(db._scopeKeys[scopeType], scopeKey) then
			tinsert(db._scopeKeys[scopeType], scopeKey)
			private.SetScopeDefaults(db, settingsInfo, strjoin(KEY_SEP, SCOPE_TYPES[scopeType], String.Escape(scopeKey), ".+", ".+"))
		end
	end

	-- do any necessary upgrading or downgrading if the version changed
	local removedSettings, prevVersion = nil, nil
	if version ~= db._version then
		-- clear any settings which no longer exist, and set new/updated settings to their default values
		removedSettings = {}
		for key in pairs(db) do
			-- ignore metadata (keys starting with "_")
			if strsub(key, 1, 1) ~= "_" then
				local scopeTypeShort, namespace, settingKey = strmatch(key, "^(.+)"..KEY_SEP..".+"..KEY_SEP.."(.+)"..KEY_SEP.."(.+)$")
				local scopeType = scopeTypeShort and private.ScopeReverseLookup(scopeTypeShort)
				local info = settingKey and settingsInfo[scopeType] and settingsInfo[scopeType][namespace] and settingsInfo[scopeType][namespace][settingKey]
				if not info then
					-- this setting was removed so remove it from the db
					removedSettings[key] = db[key]
					db[key] = nil
				elseif info.lastModifiedVersion > db._version or version < db._version then
					-- this will be reset to the default value in the next for loop below
					removedSettings[key] = db[key]
				end
			end
		end
		for scope, scopeInfo in pairs(settingsInfo) do
			if scope ~= "version" then
				for namespace, namespaceInfo in pairs(scopeInfo) do
					for settingKey, info in pairs(namespaceInfo) do
						if info.lastModifiedVersion > db._version or version < db._version then
							-- this is either a new setting or was changed or this is a downgrade - either way set it to the default value
							private.SetScopeDefaults(db, settingsInfo, strjoin(KEY_SEP, SCOPE_TYPES[scope], ".+", namespace, settingKey))
						end
					end
				end
			end
		end
		if version > db._version then
			prevVersion = db._version
		else
			removedSettings = nil
		end
		db._version = version
	end

	-- make the db table protected
	setmetatable(db, PROTECTED_TABLE_MT)

	-- create the new object and return it
	local new = setmetatable({}, SETTINGS_MT)
	private.context[new] = {
		db = db,
		settingsInfo = settingsInfo,
		currentScopeKeys = currentScopeKeys,
		callbacks = {},
		scopeProxies = {},
		namespaceProxies = {},
	}
	for scopeType, scopeInfo in pairs(rawSettingsInfo) do
		if scopeType ~= "version" then
			for namespace in pairs(scopeInfo) do
				private.context[new].namespaceProxies[scopeType..KEY_SEP..namespace] = private.CreateNamespace(new, namespace, scopeType)
			end
			private.context[new].scopeProxies[scopeType] = private.CreateScope(new, scopeType)
		end
	end
	local upgradeObj = nil
	if removedSettings then
		upgradeObj = setmetatable({}, private.SettingsDBUpgradeObjMT)
		assert(prevVersion)
		private.upgradeContext = {
			removedSettings = removedSettings,
			prevVersion = prevVersion,
		}
	end
	return new, upgradeObj
end



-- ============================================================================
-- Class for upgrade object
-- ============================================================================

private.SettingsDBUpgradeObjMT = {
	-- getter
	__index = {
		GetPrevVersion = function(self)
			return private.upgradeContext.prevVersion
		end,

		RemovedSettingIterator = function(self)
			return next, private.upgradeContext.removedSettings, nil
		end,

		GetKeyInfo = function(self, key)
			local scopeType, scopeKey, namespace, settingKey = nil, nil, nil, nil
			local parts = TempTable.Acquire(strsplit(KEY_SEP, key))
			if #parts == 4 then
				scopeType, scopeKey, namespace, settingKey = TempTable.UnpackAndRelease(parts)
				scopeType = private.ScopeReverseLookup(scopeType)
			elseif #parts == 3 then
				scopeType, scopeKey, settingKey = TempTable.UnpackAndRelease(parts)
				scopeType = private.ScopeReverseLookup(scopeType)
			else
				error("Unknown key: "..tostring(key))
			end
			return scopeType, scopeKey, namespace, settingKey
		end,
	},

	-- setter
	__newindex = function(self)
		error("You cannot set values in this table!")
	end,

	__metatable = false,
}



-- ============================================================================
-- SettingsDB Object Methods
-- ============================================================================

private.SettingsDBMethods = {
	Get = function(self, scope, scopeKey, namespace, key)
		assert(SCOPE_TYPES[scope] and type(namespace) == "string" and type(key) == "string", "Invalid parameters!")
		local context = private.context[self]
		assert(context.settingsInfo[scope][namespace][key], "Setting does not exist!")
		scopeKey = scopeKey or context.currentScopeKeys[scope]
		return context.db[strjoin(KEY_SEP, SCOPE_TYPES[scope], scopeKey, namespace, key)]
	end,

	Set = function(self, scope, scopeKey, namespace, key, value)
		assert(SCOPE_TYPES[scope] and type(namespace) == "string" and type(key) == "string", "Invalid parameters!")
		local context = private.context[self]
		local info = context.settingsInfo[scope][namespace][key]
		assert(info, "Setting does not exist!")
		assert(value == nil or type(value) == info.type, "Value is of wrong type.")
		scopeKey = scopeKey or context.currentScopeKeys[scope]
		private.SetDBKeyValue(context.db, strjoin(KEY_SEP, SCOPE_TYPES[scope], scopeKey, namespace, key), value)
	end,

	GetDefaultReadOnly = function(self, scope, namespace, key)
		local context = private.context[self]
		return context.settingsInfo[scope][namespace][key].default
	end,

	GetDefault = function(self, scope, namespace, key)
		return private.CopyData(self:GetDefaultReadOnly(scope, namespace, key))
	end,

	RegisterCallback = function(self, event, callback)
		assert(event == "OnProfileUpdated")
		assert(type(callback) == "function")
		private.context[self].callbacks[event] = callback
	end,

	IsValidProfileName = function(self, name)
		return name ~= "" and not strfind(name, KEY_SEP)
	end,

	ProfileExists = function(self, name)
		return tContains(private.context[self].db._scopeKeys.profile, name) and true or false
	end,

	GetCurrentProfile = function(self)
		return private.context[self].currentScopeKeys.profile
	end,

	GetScopeKeys = function(self, scope)
		return CopyTable(private.context[self].db._scopeKeys[scope])
	end,

	GetProfiles = function(self)
		return self:GetScopeKeys("profile")
	end,

	ProfileIterator = function(self)
		return ipairs(private.context[self].db._scopeKeys.profile)
	end,

	SetProfile = function(self, profileName)
		assert(type(profileName) == "string", tostring(profileName))
		assert(not strfind(profileName, KEY_SEP))
		local context = private.context[self]

		-- change the current profile for this character
		context.db._currentProfile[SCOPE_KEYS.char] = profileName
		context.currentScopeKeys.profile = context.db._currentProfile[SCOPE_KEYS.char]

		local isNew = false
		if not tContains(context.db._scopeKeys.profile, profileName) then
			tinsert(context.db._scopeKeys.profile, profileName)
			-- this is a new profile, so set all the settings to their default values
			private.SetScopeDefaults(context.db, context.settingsInfo, strjoin(KEY_SEP, SCOPE_TYPES.profile, String.Escape(profileName), ".+", ".+"))
			isNew = true
		end

		if context.callbacks.OnProfileUpdated then
			context.callbacks.OnProfileUpdated(isNew)
		end
	end,

	ResetProfile = function(self)
		local context = private.context[self]
		private.SetScopeDefaults(context.db, context.settingsInfo, strjoin(KEY_SEP, SCOPE_TYPES.profile, String.Escape(context.currentScopeKeys.profile), ".+", ".+"))
		if context.callbacks.OnProfileUpdated then
			context.callbacks.OnProfileUpdated(true)
		end
	end,

	CopyProfile = function(self, sourceProfileName)
		assert(type(sourceProfileName) == "string")
		assert(not strfind(sourceProfileName, KEY_SEP))
		local context = private.context[self]
		assert(sourceProfileName ~= context.currentScopeKeys.profile)

		-- copy all the settings from the source profile to the current one
		for namespace, namespaceInfo in pairs(context.settingsInfo.profile) do
			for settingKey in pairs(namespaceInfo) do
				local srcKey = strjoin(KEY_SEP, SCOPE_TYPES.profile, sourceProfileName, namespace, settingKey)
				local destKey = strjoin(KEY_SEP, SCOPE_TYPES.profile, context.currentScopeKeys.profile, namespace, settingKey)
				private.SetDBKeyValue(context.db, destKey, private.CopyData(context.db[srcKey]))
			end
		end

		if context.callbacks.OnProfileUpdated then
			context.callbacks.OnProfileUpdated(false)
		end
	end,

	DeleteScope = function(self, scopeType, scopeKey)
		assert(SCOPE_TYPES[scopeType])
		assert(type(scopeKey) == "string")
		local context = private.context[self]
		assert(scopeKey ~= context.currentScopeKeys[scopeType])

		-- remove all settings for the specified profile
		local searchPattern = strjoin(KEY_SEP, SCOPE_TYPES[scopeType], String.Escape(scopeKey), ".+", ".+")
		for key in pairs(context.db) do
			if strmatch(key, searchPattern) then
				private.SetDBKeyValue(context.db, key, nil)
			end
		end

		-- remove the scope key from the list
		Table.RemoveByValue(context.db._scopeKeys[scopeType], scopeKey)
	end,

	DeleteProfile = function(self, profileName)
		self:DeleteScope("profile", profileName)
	end,

	GetConnectedRealmIterator = function(self, scope)
		assert(scope == "factionrealm" or scope == "realm")
		return private.ConnectedRealmIterator, self, scope
	end,

	GetSyncAccountKey = function(self, factionrealm)
		factionrealm = factionrealm or SCOPE_KEYS.factionrealm
		return private.context[self].db._syncAccountKey[factionrealm]
	end,

	SyncAccountIterator = function(self)
		local result = TempTable.Acquire()
		local used = TempTable.Acquire()
		for _, syncOwner in pairs(private.context[self].db._syncOwner) do
			if strmatch(syncOwner, "^"..String.Escape(SCOPE_KEYS.factionrealm..SCOPE_KEY_SEP).."(%d+)$") and not used[syncOwner] and syncOwner ~= self:GetSyncAccountKey() then
				used[syncOwner] = true
				tinsert(result, syncOwner)
			end
		end
		TempTable.Release(used)
		return TempTable.Iterator(result)
	end,

	NewSyncCharacter = function(self, character, accountKey, factionrealm)
		factionrealm = factionrealm or SCOPE_KEYS.factionrealm
		assert(strmatch(accountKey, "^"..String.Escape(factionrealm..SCOPE_KEY_SEP).."(%d+)$"), "Invalid account key")
		local scopeKey = self:GetSyncScopeKeyByCharacter(character, factionrealm)
		local context = private.context[self]
		context.db._syncOwner[scopeKey] = accountKey
		if not tContains(context.db._scopeKeys.sync, scopeKey) then
			tinsert(context.db._scopeKeys.sync, scopeKey)
		end
		private.SetScopeDefaults(context.db, context.settingsInfo, strjoin(KEY_SEP, SCOPE_TYPES.sync, String.Escape(scopeKey), ".+", ".+"))
	end,

	RemoveSyncAccount = function(self, accountKey)
		local settingsDB = private.context[self].db
		assert(accountKey ~= self:GetSyncAccountKey())
		local scopeKeysToRemove = TempTable.Acquire()
		for scopeKey, ownerAccountKey in pairs(settingsDB._syncOwner) do
			if ownerAccountKey == accountKey then
				tinsert(scopeKeysToRemove, scopeKey)
			end
		end
		for _, scopeKey in ipairs(scopeKeysToRemove) do
			self:DeleteScope("sync", scopeKey)
			settingsDB._syncOwner[scopeKey] = nil
		end
		TempTable.Release(scopeKeysToRemove)
	end,

	RemoveSyncCharacter = function(self, character)
		local settingsDB = private.context[self].db
		local scopeKey = self:GetSyncScopeKeyByCharacter(character)
		self:DeleteScope("sync", scopeKey)
		settingsDB._syncOwner[scopeKey] = nil
	end,

	GetSyncOwnerAccountKey = function(self, character)
		return private.context[self].db._syncOwner[self:GetSyncScopeKeyByCharacter(character)]
	end,

	FactionrealmCharacterIterator = function(self, factionrealm)
		factionrealm = factionrealm or SCOPE_KEYS.factionrealm
		local result = TempTable.Acquire()
		for scopeKey in pairs(private.context[self].db._syncOwner) do
			local character = strmatch(scopeKey, "^(.+)"..String.Escape(SCOPE_KEY_SEP..factionrealm))
			if character then
				tinsert(result, character)
			end
		end
		return TempTable.Iterator(result)
	end,

	GetSyncScopeKeyByCharacter = function(self, character, factionrealm)
		return character..SCOPE_KEY_SEP..(factionrealm or SCOPE_KEYS.factionrealm)
	end,

	FactionrealmByRealmIterator = function(self, realm)
		return private.FactionrealmByRealmIteratorHelper, realm
	end,
}



-- ============================================================================
-- Proxy Class for Scopes (TSM.db.XXXXX)
-- ============================================================================

local SCOPE_MT = {
	-- getter
	__index = function(self, namespace)
		assert(type(namespace) == "string", "Invalid namespace type!")
		local proxyInfo = private.proxies[self]
		local context = private.context[proxyInfo.settingsDB]
		assert(context.settingsInfo[proxyInfo.scope][namespace], "Namespace does not exist!")
		local namespaceProxy = context.namespaceProxies[proxyInfo.scope..KEY_SEP..namespace]
		assert(namespaceProxy)
		return namespaceProxy
	end,

	-- setter
	__newindex = function(self, key, value)
		error("You cannot set values in this table! You're probably missing a namespace.")
	end,

	__metatable = false,
}



-- ============================================================================
-- Proxy Class for Namespaces (TSM.db.<scope>.XXXXX)
-- ============================================================================

local NAMESPACE_MT = {
	-- getter
	__index = function(self, key)
		assert(type(key) == "string", "Invalid setting key type!")
		local proxyInfo = private.proxies[self]
		return proxyInfo.settingsDB:Get(proxyInfo.scope, nil, proxyInfo.namespace, key)
	end,

	-- setter
	__newindex = function(self, key, value)
		local proxyInfo = private.proxies[self]
		proxyInfo.settingsDB:Set(proxyInfo.scope, nil, proxyInfo.namespace, key, value)
	end,

	__metatable = false,
}



-- ============================================================================
-- Setting View Class (see Settings.CreateView(...))
-- ============================================================================

local VIEW_METHODS = {
	AddKey = function(self, scopeType, namespace, key)
		local proxyInfo = private.proxies[self]
		assert(proxyInfo and not proxyInfo.keyProxies[key])
		proxyInfo.keyProxies[key] = private.context[proxyInfo.settingsDB].namespaceProxies[scopeType..KEY_SEP..namespace]
		return self
	end,
}

local VIEW_MT = {
	__index = function(self, key)
		if VIEW_METHODS[key] then
			return VIEW_METHODS[key]
		end
		return private.proxies[self].keyProxies[key][key]
	end,
	__newindex = function(self, key, value)
		private.proxies[self].keyProxies[key][key] = value
	end,
	__metatable = false,
}



-- ============================================================================
-- Helper Functions
-- ============================================================================

function private.CreateScope(settingsDB, scope)
	assert(private.context[settingsDB])
	local new = setmetatable({}, SCOPE_MT)
	private.proxies[new] = {
		settingsDB = settingsDB,
		scope = scope,
	}
	return new
end

function private.CreateNamespace(settingsDB, namespace, scope)
	assert(private.context[settingsDB])
	local new = setmetatable({}, NAMESPACE_MT)
	private.proxies[new] = {
		settingsDB = settingsDB,
		namespace = namespace,
		scope = scope,
	}
	return new
end

function private.CreateView(settingsDB)
	assert(private.context[settingsDB])
	local view = setmetatable({}, VIEW_MT)
	private.proxies[view] = {
		settingsDB = settingsDB,
		keyProxies = {},
	}
	return view
end

function private.SetDBKeyValue(db, key, value)
	private.protectedAccessAllowed[db] = true
	db[key] = value
	private.protectedAccessAllowed[db] = nil
end

function private.CopyData(data)
	if type(data) == "table" then
		return CopyTable(data)
	elseif VALID_TYPES[type(data)] or type(data) == nil then
		return data
	end
end

function private.ScopeReverseLookup(scopeTypeShort)
	for key, value in pairs(SCOPE_TYPES) do
		if value == scopeTypeShort then
			return key
		end
	end
end

function private.ValidateDB(db)
	-- make sure the DB we are loading from is valid
	if #db > 0 then return end
	if type(db._version) ~= "number" then return end
	if type(db._hash) ~= "number" then return end
	if type(db._scopeKeys) ~= "table" then return end
	for scopeType, keys in pairs(db._scopeKeys) do
		if not SCOPE_TYPES[scopeType] then return end
		for i, name in pairs(keys) do
			if type(i) ~= "number" or i > #keys or i <= 0 or type(name) ~= "string" then return end
		end
	end
	if type(db._currentProfile) ~= "table" then return end
	for key, value in pairs(db._currentProfile) do
		if type(key) ~= "string" or type(value) ~= "string" then return end
	end
	return true
end

function private.SetScopeDefaults(db, settingsInfo, searchPattern)
	-- remove any existing entries for matching keys
	for key in pairs(db) do
		if strmatch(key, searchPattern) then
			private.SetDBKeyValue(db, key, nil)
		end
	end

	local scopeTypeShort = strsub(searchPattern, 1, 1)
	local scopeType = private.ScopeReverseLookup(scopeTypeShort)
	assert(scopeType, "Couldn't find scopeType: "..tostring(scopeTypeShort))
	local scopeKeys = nil
	if scopeTypeShort == SCOPE_TYPES.global then
		scopeKeys = {GLOBAL_SCOPE_KEY}
	else
		scopeKeys = db._scopeKeys[scopeType]
		assert(scopeKeys, "Couldn't find scopeKeys for type: "..tostring(scopeTypeShort))
	end

	-- set any matching keys to their default values
	if not settingsInfo[scopeType] then return end
	for namespace, namespaceInfo in pairs(settingsInfo[scopeType]) do
		for settingKey, info in pairs(namespaceInfo) do
			for _, scopeKey in ipairs(scopeKeys) do
				local key = strjoin(KEY_SEP, scopeTypeShort, scopeKey, namespace, settingKey)
				if strmatch(key, searchPattern) then
					private.SetDBKeyValue(db, key, private.CopyData(info.default))
				end
			end
		end
	end
end

function private.ConnectedRealmIterator(self, prevScopeKey)
	if not private.cachedConnectedRealms then
		local connectedRealms = {}
		if not TSM.IsWowClassic() then
			local realmId, _, _, _, _, _, _, _, connectedRealmIds = LibRealmInfo:GetRealmInfo(REALM)
			if connectedRealmIds then
				for _, id in ipairs(connectedRealmIds) do
					if id ~= realmId then
						local _, connectedRealmName = LibRealmInfo:GetRealmInfoByID(id)
						tinsert(connectedRealms, connectedRealmName)
					end
				end
			end
		end
		private.cachedConnectedRealms = connectedRealms
	end
	local scope = nil
	if prevScopeKey == "factionrealm" or prevScopeKey == "realm" then
		-- this is the first time
		scope = prevScopeKey
		prevScopeKey = nil
	else
		scope = strmatch(prevScopeKey, String.Escape(FACTION.." - ")) and "factionrealm" or "realm"
	end
	local foundPrev = prevScopeKey == nil
	local index = 0
	while true do
		local realm = index == 0 and SCOPE_KEYS.realm or private.cachedConnectedRealms[index]
		if not realm then return end
		index = index + 1
		local scopeKey = (scope == "factionrealm") and (FACTION..SCOPE_KEY_SEP..realm) or realm
		if scopeKey == prevScopeKey then
			foundPrev = true
		elseif foundPrev and tContains(private.context[self].db._scopeKeys[scope], scopeKey) then
			return scopeKey
		end
	end
end

function private.FactionrealmByRealmIteratorHelper(realm, prevValue)
	if not prevValue then
		return strjoin(SCOPE_KEY_SEP, "Horde", realm)
	elseif strmatch(prevValue, "^Horde") then
		return strjoin(SCOPE_KEY_SEP, "Alliance", realm)
	elseif strmatch(prevValue, "^Alliance") then
		return strjoin(SCOPE_KEY_SEP, "Neutral", realm)
	end
end
