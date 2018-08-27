-- ------------------------------------------------------------------------------ --
--                                TradeSkillMaster                                --
--                http://www.curse.com/addons/wow/tradeskill-master               --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

-- TSM's error handler

local _, TSM = ...
local L = TSM.L
local private = { errorFrame = nil, isSilent = nil, errorSuppressed = nil, errorReports = {}, num = 0 }
-- use strmatch does this string doesn't itself get replaced when we deploy
local IS_DEV_VERSION = strmatch(GetAddOnMetadata("TradeSkillMaster", "version"), "^@tsm%-project%-version@$") and true or false
local MAX_ERROR_REPORT_AGE = 7 * 24 * 60 * 60 -- 1 week
local MAX_STACK_DEPTH = 50
local ADDON_SUITES = {
	"ArkInventory",
	"AtlasLoot",
	"Altoholic",
	"Auc-",
	"Bagnon",
	"BigWigs",
	"Broker",
	"ButtonFacade",
	"Carbonite",
	"DataStore",
	"DBM",
	"Dominos",
	"DXE",
	"EveryQuest",
	"Forte",
	"FuBar",
	"GatherMate2",
	"Grid",
	"LightHeaded",
	"LittleWigs",
	"Masque",
	"MogIt",
	"Odyssey",
	"Overachiever",
	"PitBull4",
	"Prat-3.0",
	"RaidAchievement",
	"Skada",
	"SpellFlash",
	"TidyPlates",
	"TipTac",
	"Titan",
	"UnderHood",
	"WowPro",
	"ZOMGBuffs",
}



-- ============================================================================
-- Module Functions
-- ============================================================================

function TSM:ShowManualError()
	private.isManual = true
	TSM:ShowError("Manually triggered error")
end

function TSM:ShowError(err, thread)
	if thread then
		local stackLine = debugstack(thread, 0, 1, 0)
		local oldModule = strmatch(stackLine, "(lMaster_[A-Za-z]+)")
		if oldModule and tContains(TSM.CONST.OLD_TSM_MODULES, "TradeSkil"..oldModule) then
			-- ignore errors from old modules
			return
		end
	end
	-- show an error, but don't cause an exception to be thrown
	private.isSilent = true
	private.ErrorHandler(err, thread, debugprofilestop())
end

function TSM.SaveErrorReports(appDB)
	private.errorFrame:Hide()
	appDB.errorReports = appDB.errorReports or { updateTime = 0, data = {} }
	if #private.errorReports > 0 then
		appDB.errorReports.updateTime = private.errorReports[#private.errorReports].timestamp
	end
	-- remove any events which are too old
	for i = #appDB.errorReports.data, 1, -1 do
		local timestamp = strmatch(appDB.errorReports.data[i], "([0-9]+)%]$") or ""
		if (tonumber(timestamp) or 0) < time() - MAX_ERROR_REPORT_AGE then
			tremove(appDB.errorReports.data, i)
		end
	end
	for _, report in ipairs(private.errorReports) do
		local line = format("[\"%s\",\"%s\",%d]", report.errMsg, report.details, report.timestamp)
		tinsert(appDB.errorReports.data, line)
	end
end



-- ============================================================================
-- Error Handler
-- ============================================================================

function private.ErrorHandler(msg, thread, errorTime)
	-- ignore errors while we are handling this error
	private.ignoreErrors = true
	local isSilent = private.isSilent
	private.isSilent = nil
	local isManual = private.isManual
	private.isManual = nil

	if type(thread) ~= "thread" then
		thread = nil
	end

	local color = "|cff99ffff"
	local errMsgParts = {}

	-- build stack trace with locals and get addon name
	local addonName = nil
	local errLocation = strmatch(msg, "[A-Za-z]+%.lua:[0-9]+")
	local stackInfo = { color.."Stack Trace:|r" }
	local stackStarted = false
	for i = 0, MAX_STACK_DEPTH do
		local stackLine = nil
		if thread then
			stackLine = debugstack(thread, i, 1, 0)
		else
			stackLine = debugstack(i, 1, 0)
		end
		if not stackStarted then
			if errLocation then
				stackStarted = strmatch(stackLine, "[A-Za-z]+%.lua:[0-9]+") == errLocation
			else
				stackStarted = (i > (thread and 1 or 4) and not strmatch(stackLine, "^%[C%]:"))
			end
		end
		if not addonName and stackStarted and strmatch(stackLine, "[A-Za-z]+%.lua:[0-9]+") then
			addonName = private.IsTSMAddon(stackLine) or (isSilent and "TradeSkillMaster")
		end
		if stackStarted then
			stackLine = gsub(stackLine, "%.%.%.T?r?a?d?e?S?k?i?l?lM?a?ster([_A-Za-z]*)\\", "TradeSkillMaster%1\\")
			stackLine = gsub(stackLine, "%.%.%.", "")
			stackLine = strtrim(stackLine)
			local strStart = strfind(stackLine, "in function")
			local functionName = nil
			if strStart then
				stackLine = gsub(stackLine, "`", "<", 1)
				stackLine = gsub(stackLine, "'", ">", 1)
				local inFunction = strmatch(stackLine, "<[^>]*>", strStart)
				if inFunction then
					inFunction = gsub(gsub(inFunction, ".*\\", ""), "<", "")
					if inFunction ~= "" then
						local str = strsub(stackLine, 1, strStart-2)
						str = strsub(str, strfind(str, "TradeSkillMaster") or 1)
						if strfind(inFunction, "`") then
							inFunction = strsub(inFunction, 2, -2)..">"
						end
						str = gsub(str, "TradeSkillMaster([^%.])", "TSM%1")
						functionName = strsub(inFunction, 1, -2)
						stackLine = str.." <"..inFunction
					end
				end
			end
			if strfind(stackLine, "Class%.lua:190") then
				-- ignore stack frames from the class code's wrapper function
				stackLine = ""
				if functionName and not strmatch(functionName, "^.+:[0-9]+$") and #stackInfo > 0 then
					local prevFunctionName = strmatch(stackInfo[#stackInfo], "[^\n]+<([^>]+)>\n")
					if prevFunctionName and strmatch(prevFunctionName, "^.+:[0-9]+$") then
						-- this stack frame includes the class method we were accessing in the previous one, so go back and fix it up
						local locals = debuglocals(i)
						local className = locals and strmatch(locals, "\n +str = \"([A-Za-z_0-9]+):[0-9A-F]+\"\n") or "?"
						functionName = className.."."..functionName
						stackInfo[#stackInfo] = gsub(stackInfo[#stackInfo], gsub(prevFunctionName, "%.", "%."), functionName)
					end
				end
			end
			if stackLine ~= "" then
				local localsInfo = {}
				-- add locals for addon functions (debuglocals() doesn't always work - or ever for threads)
				local locals = debuglocals(i)
				if locals and not strmatch(stackLine, "^%[") then
					locals = gsub(locals, "<([a-z]+)> {[\n\t ]+}", "<%1> {}")
					locals = gsub(locals, " = <function> defined @", "@")
					locals = gsub(locals, "<table> {", "{")
					local fileName = strmatch(stackLine, "([A-Za-z]+)%.lua")
					local isPrivateTable, isLocaleTable, isPackageTable = false, false, false
					for localLine in gmatch(locals, "[^\n]+") do
						local shouldIgnoreLine = false
						if strmatch(localLine, "^ *%(") then
							shouldIgnoreLine = true
						elseif strmatch(localLine, "Class%.lua:179") then
							-- ignore class methods
							shouldIgnoreLine = true
						elseif strmatch(localLine, "<unnamed> {}$") then
							-- ignore internal WoW frame members
							shouldIgnoreLine = true
						end
						if not shouldIgnoreLine then
							local level = #strmatch(localLine, "^ *")
							localLine = strrep("  ", level + 4)..strtrim(localLine)
							localLine = gsub(localLine, "Interface\\[aA]dd[Oo]ns\\TradeSkillMaster", "TSM")
							localLine = gsub(localLine, "\124", "\\124")
							if level > 0 then
								if strmatch(stackLine, "Interface\\FrameXML\\") then
									-- for Blizzard stack frames, only include level 0 locals
									shouldIgnoreLine = true
								elseif isPrivateTable and strmatch(localLine, "^ *[A-Z].+@TSM") then
									-- ignore functions within the private table
									shouldIgnoreLine = true
								elseif isLocaleTable then
									-- ignore everything within the locale table
									shouldIgnoreLine = true
								elseif isPackageTable then
									-- ignore the package table completely
									shouldIgnoreLine = true
								end
							end
							if not shouldIgnoreLine then
								tinsert(localsInfo, localLine)
							end
							if level == 0 then
								isPackageTable = strmatch(localLine, "%s*"..fileName.." = {") and true or false
								isPrivateTable = strmatch(localLine, "%s*private = {") and true or false
								isLocaleTable = strmatch(localLine, "%s*L = {") and true or false
							end
						end
					end
				end
				if #localsInfo > 0 then
					stackLine = stackLine.."\n|cffaaaaaa"..table.concat(localsInfo, "\n").."|r"
				end
				tinsert(stackInfo, stackLine)
			end
		end
	end
	if addonName ~= "TradeSkillMaster" then
		return false
	end

	-- add error message
	tinsert(errMsgParts, color.."Message:|r "..msg)

	-- add current date/time
	tinsert(errMsgParts, color.."Time:|r "..date("%m/%d/%y %H:%M:%S").." ("..floor(errorTime)..")")

	-- add current client version number
	tinsert(errMsgParts, color.."Client:|r "..GetBuildInfo())

	-- add locale name
	tinsert(errMsgParts, color.."Locale:|r "..GetLocale())

	-- is player in combat
	tinsert(errMsgParts, color.."Combat:|r "..tostring(InCombatLockdown()))

	-- add the error number
	private.num = private.num + 1
	tinsert(errMsgParts, color.."Error Count:|r "..private.num)

	-- add stack info
	tinsert(errMsgParts, table.concat(stackInfo, "\n    "))

	-- add temp table info
	local status, tempTableInfo = pcall(TSMAPI_FOUR.Util.GetTempTableDebugInfo)
	if status then
		tinsert(errMsgParts, color.."Temp Table Info:|r")
		for _, info in ipairs(tempTableInfo) do
			tinsert(errMsgParts, "  "..info)
		end
	end

	-- add object pool info
	local objectPoolInfo = nil
	status, objectPoolInfo = pcall(TSMAPI_FOUR.ObjectPool.GetDebugInfo)
	if status then
		tinsert(errMsgParts, color.."Object Pool Info:|r")
		for name, objectInfo in pairs(objectPoolInfo) do
			tinsert(errMsgParts, format("  %s (%d created, %d in use)", name, objectInfo.numCreated, objectInfo.numInUse))
			for _, info in ipairs(objectInfo.info) do
				tinsert(errMsgParts, "    "..info)
			end
		end
	end

	-- add TSM thread info
	local threadInfo = nil
	status, threadInfo = pcall(TSMAPI_FOUR.Thread.GetDebugInfo)
	if status then
		tinsert(errMsgParts, color.."TSM Thread Info:|r\n    "..table.concat(threadInfo, "\n    "))
	end

	-- add recent TSM debug log entries
	local logEntries = nil
	status, logEntries = pcall(function() return TSMAPI_FOUR.Logger.GetRecentLogEntries(200, 150) end)
	if status then
		tinsert(errMsgParts, color.."TSM Debug Log:|r\n    "..table.concat(logEntries, "\n    "))
	end

	-- add addons
	local hasAddonSuite = {}
	local addons = { color.."Addons:|r" }
	for i = 1, GetNumAddOns() do
		local name, _, _, loadable = GetAddOnInfo(i)
		if loadable then
			local version = GetAddOnMetadata(name, "X-Curse-Packaged-Version") or GetAddOnMetadata(name, "Version") or ""
			local loaded = IsAddOnLoaded(i)
			local isSuite
			for _, commonTerm in ipairs(ADDON_SUITES) do
				if strsub(name, 1, #commonTerm) == commonTerm then
					isSuite = commonTerm
					break
				end
			end
			local commonTerm = "TradeSkillMaster"
			if isSuite then
				if not hasAddonSuite[isSuite] then
					tinsert(addons, name.." ("..version..")"..(loaded and "" or " [Not Loaded]"))
					hasAddonSuite[isSuite] = true
				end
			elseif strsub(name, 1, #commonTerm) == commonTerm then
				name = gsub(name, "TradeSkillMaster", "TSM")
				tinsert(addons, name.." ("..version..")"..(loaded and "" or " [Not Loaded]"))
			else
				tinsert(addons, name.." ("..version..")"..(loaded and "" or " [Not Loaded]"))
			end
		end
	end
	tinsert(errMsgParts, table.concat(addons, "\n    "))

	-- show the error message if applicable
	msg = gsub(msg, "%%", "%%%%")
	if not private.errorFrame:IsVisible() then
		if TSM.LOG_ERR and TSM.AnalyticsEvent and not IS_DEV_VERSION and not isManual then
			TSM:LOG_ERR(msg)
			TSM.AnalyticsEvent("ERROR", msg)
		end
		print("|cffff0000TradeSkillMaster:|r "..L["Looks like TradeSkillMaster has encountered an error. Please help the author fix this error by following the instructions shown."])
		private.errorFrame.error = table.concat(errMsgParts, "\n")
		private.errorFrame.isManual = isManual
		private.errorFrame:Show()
	elseif not private.errorSuppressed then
		private.errorSuppressed = true
		if TSM.LOG_ERR then
			TSM:LOG_ERR(msg)
		end
		print("|cffff0000TradeSkillMaster:|r "..L["Additional error suppressed"])
	end

	private.ignoreErrors = false
	return true
end

function private.IsTSMAddon(str)
	if strfind(str, "Auc-Adcanced\\CoreScan.lua") then
		-- ignore auctioneer errors
		return nil
	elseif strfind(str, "Core\\Lib\\TooltipLib%.lua") then
		-- ignore tooltip lib errors
		return nil
	elseif strfind(str, "Master\\Libs\\") then
		-- ignore errors from libraries
		return nil
	elseif strfind(str, "Master\\Core\\API.lua") then
		-- ignore errors from public APIs
		return nil
	elseif strfind(str, "Master_AppHelper\\") then
		return "TradeSkillMaster_AppHelper"
	elseif strfind(str, "lMaster\\") then
		return "TradeSkillMaster"
	elseif strfind(str, "ster\\Core\\UI\\") then
		return "TradeSkillMaster"
	end
	return nil
end

function private.AddonBlockedEvent(event, addonName, addonFunc)
	if not strmatch(addonName, "TradeSkillMaster") then return end
	-- just log it - it might not be TSM
	if TSM.LOG_ERR then
		TSM:LOG_ERR("[%s] AddOn '%s' tried to call the protected function '%s'.", event, addonName or "<name>", addonFunc or "<func>")
	end
end

function private.SantizeErrorReportString(str)
	str = gsub(str, "\124cff[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]([^\124]+)\124r", "%1")
	str = gsub(str, "\\", "/")
	str = gsub(str, "\"", "'")
	return str
end



-- ============================================================================
-- Create Error Frame
-- ============================================================================

do
	local STEPS_TEXT = "Steps leading up to the error:\n1) List\n2) Steps\n3) Here"
	local frame = CreateFrame("Frame", nil, UIParent)
	private.errorFrame = frame
	frame:Hide()
	frame:SetWidth(500)
	frame:SetHeight(400)
	frame:SetFrameStrata("FULLSCREEN_DIALOG")
	frame:SetPoint("RIGHT", -100, 0)
	frame:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8X8",
		edgeFile = "Interface\\Buttons\\WHITE8X8",
		edgeSize = 2,
	})
	frame:SetBackdropColor(0, 0, 0, 1)
	frame:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
	frame:SetScript("OnShow", function(self)
		self.showingError = self.isManual or IS_DEV_VERSION
		self.details = STEPS_TEXT
		if self.showingError then
			-- this is a dev version so show the error (only)
			self.text:SetText("Looks like TradeSkillMaster has encountered an error.")
			self.switchBtn:SetText("Hide Error")
			self.editBox:SetText(self.error)
		else
			self.text:SetText("Looks like TradeSkillMaster has encountered an error. Please provide the steps which lead to this error to help the TSM team fix it, then click either button at the bottom of the window to automatically report this error.")
			self.switchBtn:SetText("Show Error")
			self.editBox:SetText(self.details)
		end
	end)
	frame:SetScript("OnHide", function()
		local details = private.errorFrame.showingError and private.errorFrame.details or private.errorFrame.editBox:GetText()
		local changedDetails = details ~= STEPS_TEXT
		if (not IS_DEV_VERSION and not private.errorFrame.isManual and (changedDetails or private.num == 1)) or IsShiftKeyDown() then
			tinsert(private.errorReports, {
				errMsg = private.SantizeErrorReportString(private.errorFrame.error),
				details = private.SantizeErrorReportString(details),
				timestamp = time()
			})
		end
		private.errorSuppressed = nil
	end)

	local title = frame:CreateFontString()
	title:SetHeight(20)
	title:SetPoint("TOPLEFT", 0, -10)
	title:SetPoint("TOPRIGHT", 0, -10)
	title:SetFontObject(GameFontNormalLarge)
	title:SetTextColor(1, 1, 1, 1)
	title:SetJustifyH("CENTER")
	title:SetJustifyV("MIDDLE")
	title:SetText("TSM Error Window")

	local hLine = frame:CreateTexture(nil, "ARTWORK")
	hLine:SetHeight(2)
	hLine:SetColorTexture(0.3, 0.3, 0.3, 1)
	hLine:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -10)
	hLine:SetPoint("TOPRIGHT", title, "BOTTOMRIGHT", 0, -10)

	local text = frame:CreateFontString()
	frame.text = text
	text:SetHeight(40)
	text:SetPoint("TOPLEFT", hLine, "BOTTOMLEFT", 8, -8)
	text:SetPoint("TOPRIGHT", hLine, "BOTTOMRIGHT", -8, -8)
	text:SetFontObject(GameFontNormal)
	text:SetTextColor(1, 1, 1, 1)
	text:SetJustifyH("LEFT")
	text:SetJustifyV("MIDDLE")

	local switchBtn = CreateFrame("Button", nil, frame)
	frame.switchBtn = switchBtn
	switchBtn:SetPoint("TOPRIGHT", -4, -10)
	switchBtn:SetWidth(100)
	switchBtn:SetHeight(20)
	local fontString = switchBtn:CreateFontString()
	fontString:SetFontObject(GameFontNormalSmall)
	fontString:SetJustifyH("LEFT")
	switchBtn:SetFontString(fontString)
	switchBtn:SetScript("OnClick", function(self)
		private.errorFrame.showingError = not private.errorFrame.showingError
		if private.errorFrame.showingError then
			private.errorFrame.details = private.errorFrame.editBox:GetText()
			self:SetText("Hide Error")
			private.errorFrame.editBox:SetText(private.errorFrame.error)
		else
			self:SetText("Show Error")
			private.errorFrame.editBox:SetText(private.errorFrame.details)
		end
	end)

	local hLine2 = frame:CreateTexture(nil, "ARTWORK")
	hLine2:SetHeight(2)
	hLine2:SetColorTexture(0.3, 0.3, 0.3, 1)
	hLine2:SetPoint("TOPLEFT", text, "BOTTOMLEFT", -4, -4)
	hLine2:SetPoint("TOPRIGHT", text, "BOTTOMRIGHT", 4, -4)

	local scrollFrame = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
	scrollFrame:SetPoint("TOPLEFT", hLine2, "BOTTOMLEFT", 8, -4)
	scrollFrame:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -26, 38)

	local editBox = CreateFrame("EditBox", nil, scrollFrame)
	frame.editBox = editBox
	editBox:SetWidth(scrollFrame:GetWidth())
	editBox:SetFontObject(ChatFontNormal)
	editBox:SetMultiLine(true)
	editBox:SetAutoFocus(false)
	editBox:SetMaxLetters(0)
	editBox:SetTextColor(1, 1, 1, 1)
	editBox:SetScript("OnUpdate", function(self)
		local offset = scrollFrame:GetVerticalScroll()
		self:SetHitRectInsets(0, 0, offset, self:GetHeight() - offset - scrollFrame:GetHeight())
	end)
	editBox:SetScript("OnEditFocusGained", function(self)
		self:HighlightText()
	end)
	editBox:SetScript("OnCursorChanged", function(self)
		if private.errorFrame.showingError and self:HasFocus() then
			self:HighlightText()
		end
	end)
	editBox:SetScript("OnEscapePressed", function(self)
		if private.errorFrame.showingError then
			self:HighlightText(0, 0)
		end
		self:ClearFocus()
	end)
	scrollFrame:SetScrollChild(editBox)

	local hLine3 = frame:CreateTexture(nil, "ARTWORK")
	hLine3:SetHeight(2)
	hLine3:SetColorTexture(0.3, 0.3, 0.3, 1)
	hLine3:SetPoint("BOTTOMLEFT", frame, 0, 35)
	hLine3:SetPoint("BOTTOMRIGHT", frame, 0, 35)

	local reloadBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
	frame.reloadBtn = reloadBtn
	reloadBtn:SetPoint("BOTTOMLEFT", 4, 4)
	reloadBtn:SetWidth(120)
	reloadBtn:SetHeight(30)
	reloadBtn:SetText(RELOADUI)
	reloadBtn:SetScript("OnClick", function()
		frame:Hide()
		ReloadUI()
	end)

	local closeBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
	frame.closeBtn = closeBtn
	closeBtn:SetPoint("BOTTOMRIGHT", -4, 4)
	closeBtn:SetWidth(120)
	closeBtn:SetHeight(30)
	closeBtn:SetText(DONE)
	closeBtn:SetScript("OnClick", function()
		frame:Hide()
	end)

	local stepsText = frame:CreateFontString()
	frame.stepsText = stepsText
	stepsText:SetWidth(200)
	stepsText:SetHeight(30)
	stepsText:SetPoint("BOTTOM", 0, 4)
	stepsText:SetFontObject(GameFontNormal)
	stepsText:SetTextColor(1, 0, 0, 1)
	stepsText:SetJustifyH("CENTER")
	stepsText:SetJustifyV("MIDDLE")
	stepsText:SetText("Please enter steps before submitting")
end



-- ============================================================================
-- Register Error Handler
-- ============================================================================

do
	private.origErrorHandler = geterrorhandler()
	seterrorhandler(function(errMsg)
		local errorTime = debugprofilestop()
		local tsmErrMsg = strtrim(tostring(errMsg))
		if private.ignoreErrors then
			-- we're ignoring errors
			tsmErrMsg = nil
		elseif strmatch(tsmErrMsg, "auc%-stat%-wowuction") or strmatch(tsmErrMsg, "TheUndermineJournal%.lua") or strmatch(tsmErrMsg, "\\SavedVariables\\TradeSkillMaster") or strmatch(tsmErrMsg, "AddOn TradeSkillMaster[_a-zA-Z]* attempted") then
			-- explicitly ignore these errors
			tsmErrMsg = nil
		end
		if tsmErrMsg then
			-- look at the stack trace to see if this is a TSM error
			for i = 2, MAX_STACK_DEPTH do
				local stackLine = debugstack(i, 1, 0)
				local oldModule = strmatch(stackLine, "(lMaster_[A-Za-z]+)")
				if oldModule and tContains(TSM.CONST.OLD_TSM_MODULES, "TradeSkil"..oldModule) then
					-- ignore errors from old modules
					return
				end
				if not strmatch(stackLine, "^%[C%]:") and not strmatch(stackLine, "^%(tail call%):") and not strmatch(stackLine, "^%[string \"") then
					if not private.IsTSMAddon(stackLine) then
						tsmErrMsg = nil
					end
					break
				end
			end
		end
		if tsmErrMsg then
			local status, ret = pcall(private.ErrorHandler, tsmErrMsg, nil, errorTime)
			if status and ret then
				return ret
			end
		end
		local oldModule = strmatch(errMsg, "(lMaster_[A-Za-z]+)")
		if oldModule and tContains(TSM.CONST.OLD_TSM_MODULES, "TradeSkil"..oldModule) then
			-- ignore errors from old modules
			return
		end
		return private.origErrorHandler and private.origErrorHandler(errMsg) or nil
	end)
	TSMAPI_FOUR.Event.Register("ADDON_ACTION_FORBIDDEN", private.AddonBlockedEvent)
	TSMAPI_FOUR.Event.Register("ADDON_ACTION_BLOCKED", private.AddonBlockedEvent)
end
