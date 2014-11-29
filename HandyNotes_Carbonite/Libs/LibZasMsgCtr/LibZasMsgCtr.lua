--=========================================================================================================================
-- Library: Zasurus' Message Controls
--[[=======================================================================================================================
	See History.txt, ChangeLog-LibZasMsgCtr-#######.txt and Curse for more infomation
=========================================================================================================================]]


-----------------------------------------------------------------
-- Header
-----------------------------------------------------------------
	local MajorNum, Major, Minor, ZMC; -- Pulls locals out of do hidder
	do
		MajorNum = "1.1";
		Minor = 10;
		
		Major = "LibZasMsgCtr-"..MajorNum;
		
		ZMC = LibStub:NewLibrary(Major, Minor)
		
		if not(ZMC) then
			return;	-- already loaded and no upgrade necessary
		end;
	end;
-----------------------------------------------------------------


-----------------------------------------------------------------
-- Libraries
-----------------------------------------------------------------
	local TableCount, returnChatFrame; -- Registering local variables outside hider do
	do
		TableCount, returnChatFrame = LibStub("LibZasUsefulFuncs-0.1"):GetFunctions("TableCount", "returnChatFrame"); -- Get some useful functions and store them locally to make it easyer to use them
	end;
-----------------------------------------------------------------


-----------------------------------------------------------------
-- Chat Frame Colours
-----------------------------------------------------------------
	do -- Colours
		--OK FOR MOST USERS--
		ZMC.COLOURS				= {};
		
		ZMC.COLOURS.WHITE		= "|cffffffff";
		ZMC.COLOURS.YELLOW		= "|cffffff00";
		ZMC.COLOURS.LTGREY		= "|cffaaaaaa";
		ZMC.COLOURS.MEDGRAY		= "|cff808080";
		ZMC.COLOURS.BLUEGREY	= "|cffa6a6ff";
		ZMC.COLOURS.LTBLUE		= "|cff00d7e4";
		ZMC.COLOURS.BLUE 		= "|cff3366ff";
		ZMC.COLOURS.TEAL		= "|cff00ffbb";
		ZMC.COLOURS.BLUGREEN	= "|cffa4d7ea";
		ZMC.COLOURS.LTGREEN		= "|cff70ff6d";
		ZMC.COLOURS.GREEN 		= "|cff00ff00";
		ZMC.COLOURS.PINK		= "|cffff00ff";
		ZMC.COLOURS.LTPURPLE	= "|cffb56dff";
		ZMC.COLOURS.PURPLE		= "|cffaa00ff";
		ZMC.COLOURS.RED 		= "|cffff0000";
		ZMC.COLOURS.ORANGE		= "|cffff9900";
		
		--DARK FOR MOST USERS--
		ZMC.COLOURS.DKGRAY		= "|cff555555";
		ZMC.COLOURS.DKBLUE		= "|cff0000ff";
		ZMC.COLOURS.DKPURPLE	= "|cff742fff";
		ZMC.COLOURS.DKRED		= "|cff6e0002";
		
		--TO DARK FOR MOST USERS--
		ZMC.COLOURS.DRKGREEN	= "|cff005000";
		ZMC.COLOURS.BROWN		= "|cff764e31";
		ZMC.COLOURS.BLACK		= "|cff000000";
		
		ZMC.COLOURS.CLOSE 		= "|r"; -- Used at end of text you want to have coloured to tell it to stop colouring text
	end;
-----------------------------------------------------------------


-----------------------------------------------------------------
-- Defaults & Variable Declarations
-----------------------------------------------------------------
	do
		ZMC.MaxDebugLogEntrys = 200000; -- This is the maximum number of entries we will alow in the DebugLog. High values cause errors...
		ZMC.Ask2DisableDebug = true; -- This is the default value so it always asks to disable the debug if it's on on load
		ZMC.Ask2WipeDebug = true; -- This is the default value so it always asks to wipe debug logs if they exist and the debug log is turned off on load
		
		ZMC.DefaultAddonNameColour = ZMC.COLOURS.WHITE; -- Default Colour for the AddOn's Name/Alias Before Standard Messages
		ZMC.DefaultMsgColour = ZMC.COLOURS.GREEN; -- Default Colour for Standard Messages
		ZMC.DefaultDBugMsgColour = ZMC.COLOURS.YELLOW; -- Default Colour for Standard Debug Messages
		ZMC.DefaultErrorMsgColour = ZMC.COLOURS.RED; -- Default Colour for Standard Err Messages
		ZMC.DefaultDBugErrorMsgColour = ZMC.COLOURS.RED; -- Default Colour for Debug Err Messages
		
		ZMC.DefaultMsgFrameNum = 1; -- The default chat window that normal messages will be printed in
		ZMC.DefaultDebugMsgFrameNum = 1; -- The default chat window that debug messages will be printed in
		
		ZMC.DefaultShowAddonName = true; -- Whether to show the addon name before the message by default
		ZMC.DefaultShowAddonVersion = true; -- Whether to show the addon version before the message by default
		ZMC.DefaultShowAddonVersionType = true; -- Whether to show the addon version type (if known) after the message (and Version if shown) by default
		ZMC.DefaultSpecialAddonVersionColour = true; -- Whether to change the addon version to a colour dependent on the type of addon by default (e.g. ALPHA = RED, BETA = ORANGE, RELEASE = GREEN)
		ZMC.DefaultInvertDBugState = false; -- The default function for the DBState() function if it isn't specified
		ZMC.DefaultGetAlphaReleaseStateFromRInVersion = true; -- The default behaviour for alpha release versions e.g. "r1234". If true it will asume any versions in this format "r" then a number are alpha releases
		ZMC.DefaultRemoveRFromAlphaStateInVersion = false; -- The default behaviour when the version is and alpha release versions e.g. "r1234". If true it will remove the "r" from the begining
		ZMC.DefaultTrimHashFromEndVersionNum = true; -- The default behaviour when there is a suspected hash in a file name e.g. the format is "####-###-#####" the last "-" and everything after it are removed
		
		ZMC.DefaultAlphaVersionColour = ZMC.COLOURS.RED; -- The default colour for the version details of ALPHA releases
		ZMC.DefaultBetaVersionColour = ZMC.COLOURS.ORANGE; -- The default colour for the version details of BETA releases
		ZMC.DefaultReleaseVersionColour = ZMC.COLOURS.GREEN; -- The default colour for the version details of RELEASE releases
	end;
-----------------------------------------------------------------


-----------------------------------------------------------------
-- Local Functions
-----------------------------------------------------------------
	local function GetColour(Colour) -- Takes a colour variable and if it is a valid HTML colour or predefined colour return the relevent colour string. If not error
		if (Colour) then
			if(type(Colour) == "string") then
				Colour = strupper(Colour); -- Ensures it is upper case
				Colour = gsub(Colour, "COLOR", "COLOUR"); -- CORRECTS spelling from US to English :P
				
				if ((strsub(Colour, 0, 2) == "|c") and (strlen(Colour) == 8)) then -- They have specified a HTML colour directly so return it
					return Colour;
				elseif ((strsub(Colour, 0, 7) == "COLOUR_") and ZMC.COLOURS[strsub(Colour, 8)]) then -- They have specified a predefined colour so use it
					return ZMC.COLOURS[strsub(Colour, 8)];
				else
					error("Colour ("..tostring(Colour)..") is not a valid value. It must be ether a string made up of |c followed by a HTML colour or as string containing the name of a predefined colour provided with this library e.g. COLOUR_RED");
				end;
			else
				error("Colour is not a string it is: '"..tostring(type(Colour)).."'. It must be ether a string made up of |c followed by a HTML colour or as string containing the name of a predefined colour provided with this library e.g. COLOUR_RED");
			end;
		end;
	end;
-----------------------------------------------------------------


function ZMC:Initialize(CallingAddon, AddonName, DefaultAddonNameColour, DefaultMsgColour, DefaultDBugMsgColour, DefaultErrorMsgColour, DefaultDBugErrorMsgColour, DebugMsgFrameNum, MsgFrameNum, AddonAlias, AddonVersion, VersionType, bShowAddonName, bShowAddonVersion, bSpecialAddonVersionColour, bInvertDBugState, bShowAddonReleaseType, bGetAlphaReleaseStateFromRInVersion, bRemoveRFromAlphaStateInVersion, bTrimHashFromEndVersionNum) -- Initialize the calling addon's settings storing them in a table we will send back to the addon with pointers to this library in there aswell!
	------------------------------------------------------------------------------------------
	-- Ensure minimum variables have been passed correctly
	------------------------------------------------------------------------------------------
		assert(type(CallingAddon) == "table", "Bad argument #1 (CallingAddon) to 'Initialize' (table expected got '"..tostring(type(CallingAddon)).."')") -- Check that CallingAddon is a table (normally a frame but always reports as a table) and not null etc...
		
		if not(AddonName and type(AddonName) == "string") then -- AddonName hasn't been provided. Check if the CallingAddon has a variable called "Name" or "AddonName" and if so use that
			if (CallingAddon.Name and (type(CallingAddon.Name) == "string")) then -- There is a string stored in the CallingAddon called "Name" so use that
				AddonName = CallingAddon.Name; -- Store CallingAddon.Name into AddonName
			end;
		end;
		
		assert(type(AddonName) == "string", "Bad argument #2 (AddonName) to 'Initialize' (string expected got '"..tostring(type(AddonName)).."')") -- Checks to ensure that a valid addon name has been passed
	------------------------------------------------------------------------------------------
	
	
	
	------------------------------------------------------------------------------------------
	-- Setup Addon Alias (name that will be printed before messages)
	------------------------------------------------------------------------------------------
		if not(AddonAlias and type(AddonAlias) == "string") then -- AddonName hasn't been provided. Check if the CallingAddon has a variable called "Alias" or "AddonName" and if so use that
			if (CallingAddon.Alias and (type(CallingAddon.Alias) == "string")) then -- There is a string stored in the CallingAddon called "Alias" so use that
				AddonAlias = CallingAddon.Alias; -- Store CallingAddon.Alias into AddonAlias
			else -- No alias has been provided so use the addon's name
				AddonAlias = AddonName; -- Store tha Addon's TOC file name into the addon alias
			end;
		end;
	------------------------------------------------------------------------------------------
	
	
	
	------------------------------------------------------------------------------------------
	-- Setup any missing optional variables with default values
	------------------------------------------------------------------------------------------
		local Settings = {}; -- An array to store the values in so we can pass it easyer
		Settings.DefaultAddonNameColour = GetColour(DefaultAddonNameColour) or self.DefaultAddonNameColour; -- Default Colour for the AddOn's Name/Alias Before Standard Messages
		Settings.DefaultMsgColour = GetColour(DefaultMsgColour) or self.DefaultMsgColour; -- Default Colour for Standard Messages
		Settings.DefaultDBugMsgColour = GetColour(DefaultDBugMsgColour) or self.DefaultDBugMsgColour; -- Default Colour for Standard Debug Messages
		Settings.DefaultErrorMsgColour = GetColour(DefaultErrorMsgColour) or self.DefaultErrorMsgColour; -- Default Colour for Standard Err Messages
		Settings.DefaultDBugErrorMsgColour = GetColour(DefaultDBugErrorMsgColour) or self.DefaultDBugErrorMsgColour; -- Default Colour for Debug Err Messages
		
		Settings.MsgFrameNum = MsgFrameNum or self.DefaultMsgFrameNum; -- Sets the frame that messages will be printed in by default (If not overwritten on calling msg function).
		Settings.DebugMsgFrameNum = DebugMsgFrameNum or self.DefaultDebugMsgFrameNum; -- Stores the addon Name for the msg function. This is what is printed at the start of the message
		
		if not(type(bInvertDBugState) == "boolean") then
			bInvertDBugState = self.DefaultInvertDBugState;
		end;
		
		if not(type(bShowAddonName) == "boolean") then
			bShowAddonName = self.DefaultShowAddonName;
		end;
		
		if not(type(bShowAddonVersion) == "boolean") then
			bShowAddonVersion = self.DefaultShowAddonVersion;
		end;
		
		if not(type(bShowAddonReleaseType) == "boolean") then
			bShowAddonReleaseType = self.DefaultShowAddonVersionType;
		end;
		
		if not(type(bSpecialAddonVersionColour) == "boolean") then
			bSpecialAddonVersionColour = self.DefaultSpecialAddonVersionColour;
		end;
		
		if not(type(bGetAlphaReleaseStateFromRInVersion) == "boolean") then
			bGetAlphaReleaseStateFromRInVersion = self.DefaultGetAlphaReleaseStateFromRInVersion;
		end;
		
		if not(type(bRemoveRFromAlphaStateInVersion) == "boolean") then
			bRemoveRFromAlphaStateInVersion = self.DefaultRemoveRFromAlphaStateInVersion;
		end;
		
		if not(type(bTrimHashFromEndVersionNum) == "boolean") then
			bTrimHashFromEndVersionNum = self.DefaultTrimHashFromEndVersionNum;
		end;
	------------------------------------------------------------------------------------------
	
	
	
	------------------------------------------------------------------------------------------
	-- Workout Addon Version and Version Type (Alpha, Beta or Release)
	------------------------------------------------------------------------------------------
		local AddonVersion = AddonVersion or GetAddOnMetadata(AddonName, "Version");
		local VersionType = VersionType or GetAddOnMetadata(AddonName, "X-VersionType");
		
		if (not(VersionType) and AddonVersion) then -- No addon version type could be pulled back from the TOC file. Look to see if it is in the version string
			AddonVersion = strupper(AddonVersion);
			
			if (AddonVersion == "@PROJECT-VERSION@") then -- This is a dev or not packaged version
				AddonVersion = "DEV Ver!"; -- Say this is a development release
				VersionType = "ALPHA"; -- Say this is a development release so ALPHA
				bShowAddonReleaseType = false; -- As the version type is already in the version we don't need to add it
			elseif not(strfind(AddonVersion, "RELEASE") == nil) then -- This is must be an alpha version
				VersionType = "RELEASE"; -- Say this is a release;
				bShowAddonReleaseType = false; -- As the version type is already in the version we don't need to add it
			elseif not(strfind(AddonVersion, "BETA") == nil) then -- This is must be an alpha version
				VersionType = "BETA"; -- Say this is a release;
				bShowAddonReleaseType = false; -- As the version type is already in the version we don't need to add it
			else
				local LastHyphenLoc = strfind(strrev(AddonVersion), "%-", 1); -- Pulls back the last "-" in the AddonVersion string (will use it if we suspect this is a Git ALPHA Version to remove the Hash)
				
				if not(strfind(AddonVersion, "ALPHA") == nil) then
					VersionType = "ALPHA"; -- Say this is a release;
					bShowAddonReleaseType = false; -- As the version type is already in the version we don't need to add it
				elseif ((strsub(strlower(AddonVersion), 0, 1) == "r") and (bGetAlphaReleaseStateFromRInVersion or bRemoveRFromAlphaStateInVersion)) then -- This could be an ALPHA Release
					local EndNumber = strsub(strlower(AddonVersion), 2);
					local bEndIsNumber = not(tonumber(EndNumber) == nil);
					
					if (bEndIsNumber) then -- The start is r and the rest is a number so asume it is an alpha release (maybe by an SVN)
						if (bRemoveRFromAlphaStateInVersion) then
							AddonVersion = EndNumber; -- Set the version to JUST the number
						end;
						
						if (bGetAlphaReleaseStateFromRInVersion) then
							VersionType = "ALPHA"; -- Say this is a release;
						end;
					end;
				elseif ((select(2, gsub(AddonVersion, "%-", "")) > 1) and LastHyphenLoc and (bGetAlphaReleaseStateFromRInVersion)) then -- This looks like an ALPHA release from Git
					VersionType = "ALPHA"; -- Say this is a release;
					
					if (bTrimHashFromEndVersionNum) then
						AddonVersion = strsub(AddonVersion, 1, (strlen(strrev(AddonVersion)) - LastHyphenLoc)); 
					end;
				else -- version type not found in the version string
					bShowAddonReleaseType = false; -- As the version type is not known we can't add it!
				end;
			end;
		elseif (VersionType) then
			VersionType = strupper(VersionType);
		end;
	------------------------------------------------------------------------------------------
	
	
	
	------------------------------------------------------------------------------------------
	-- Initialize the addon's debug log variables encase they are stored in it's toc
	-- file. (If they arn't it doesn't matter they will just be lost on exit)
	------------------------------------------------------------------------------------------
		_G[AddonName.."_ZMCDebugLog"] = _G[AddonName.."_ZMCDebugLog"] or {}; -- Initializes the DebugLog if it isn't initialized or is nil (We can't tell if it's in the toc file's "SavedVariablesPerCharacter" or "SavedVariables" list so if it's not it will just be lost on exit.
		
		if not(_G[AddonName.."_ZMCStoreDebugMsgs"] == true) then -- Initializes the DebugLog if it isn't initialized or is nil (We can't tell if it's in the toc file's "SavedVariablesPerCharacter" or "SavedVariables" list so if it's not it will just be lost on exit.
			_G[AddonName.."_ZMCStoreDebugMsgs"] = false;
		end;
	------------------------------------------------------------------------------------------
	
	
	
	------------------------------------------------------------------------------------------
	-- Debug log check. This checks to see if there is a debug log and warns the user if it's
	-- there encase they whern't told to turn it on by the author
	------------------------------------------------------------------------------------------
		if (_G[AddonName.."_ZMCStoreDebugMsgs"]) then -- The DebugLog is enabled
			self:PrintMessage(CallingAddon, "WARNING! The debuglog is on. This should only be on if an author has asked you to do this! To disable and wipe it type '/ZMC-"..MajorNum.." WipeDebugLog "..tostring(AddonName).."' to clear this log and reduce memory usage.", nil, nil, true);
		elseif #(_G[AddonName.."_ZMCDebugLog"]) > 0 then -- The DebugLog is disabled but the log file still exists
			self:PrintMessage(CallingAddon, "WARNING! The debuglog is switched off BUT the log its self still exists! If you don't know what this is or if you don't need it then type '/ZMC-"..MajorNum.." WipeDebugLog "..tostring(AddonName).."' to clear this log and reduce memory usage.", nil, nil, true);
		end;
	------------------------------------------------------------------------------------------
	
	
	
	------------------------------------------------------------------------------------------
	-- Create local functions to point to main messages function
	------------------------------------------------------------------------------------------
		local function Msg(sMessage, bSimple, FrameOverride) -- Controls the displaying of standard messages to the user.
			self:PrintMessage(CallingAddon, sMessage, Settings.DefaultAddonNameColour, Settings.DefaultMsgColour, Settings.MsgFrameNum, nil, nil, bSimple, FrameOverride, AddonName, AddonAlias, bShowAddonName, bShowAddonVersion, bSpecialAddonVersionColour, bShowAddonReleaseType, bGetAlphaReleaseStateFromRInVersion, bRemoveRFromAlphaStateInVersion, AddonVersion, VersionType);
		end;
		
		local function ErrMsg(sMessage, bSimple, FrameOverride) -- Controls the displaying of ERROR messages to the user.
			self:PrintMessage(CallingAddon, sMessage, Settings.DefaultAddonNameColour, Settings.DefaultErrorMsgColour, Settings.MsgFrameNum, nil, nil, bSimple, FrameOverride, AddonName, AddonAlias, bShowAddonName, bShowAddonVersion, bSpecialAddonVersionColour, bShowAddonReleaseType, bGetAlphaReleaseStateFromRInVersion, bRemoveRFromAlphaStateInVersion, AddonVersion, VersionType);
		end;
		
		local function DBugMsg(sMessage, bSimple, FrameOverride) -- Controls the displaying of debugging messages to the user.
			self:PrintMessage(CallingAddon, sMessage, Settings.DefaultAddonNameColour, Settings.DefaultDBugMsgColour, Settings.DebugMsgFrameNum, true, nil, nil, FrameOverride, AddonName, AddonAlias, bShowAddonName, bShowAddonVersion, bSpecialAddonVersionColour, bShowAddonReleaseType, bGetAlphaReleaseStateFromRInVersion, bRemoveRFromAlphaStateInVersion, AddonVersion, VersionType);
		end;
		
		local function ErrDBugMsg(sMessage, bSimple, FrameOverride) -- Controls the displaying of debugging ERROR messages to the user.
			self:PrintMessage(CallingAddon, sMessage, Settings.DefaultAddonNameColour, Settings.DefaultDBugErrorMsgColour, Settings.DebugMsgFrameNum, true, nil, bSimple, FrameOverride, AddonName, AddonAlias, bShowAddonName, bShowAddonVersion, bSpecialAddonVersionColour, bShowAddonReleaseType, bGetAlphaReleaseStateFromRInVersion, bRemoveRFromAlphaStateInVersion, AddonVersion, VersionType);
		end;
		
		local function InitDBug(bDBug, bInvert)
			if not(type(bInvert) == "boolean") then -- bInvert wasn't provided so use default
				bInvert = bInvertDBugState; -- Use default for bInvert
			end;
			
			local function DBugMsg(sMessage, bSimple, FrameOverride) -- Controls the displaying of debugging messages to the user.
				self:PrintMessage(CallingAddon, sMessage, Settings.DefaultAddonNameColour, Settings.DefaultDBugMsgColour, Settings.DebugMsgFrameNum, true, bDBug, nil, FrameOverride, AddonName, AddonAlias, bShowAddonName, bShowAddonVersion, bSpecialAddonVersionColour, bShowAddonReleaseType, bGetAlphaReleaseStateFromRInVersion, bRemoveRFromAlphaStateInVersion, AddonVersion, VersionType);
			end;
			
			local function ErrDBugMsg(sMessage, bSimple, FrameOverride) -- Controls the displaying of debugging ERROR messages to the user.
				self:PrintMessage(CallingAddon, sMessage, Settings.DefaultAddonNameColour, Settings.DefaultDBugErrorMsgColour, Settings.DebugMsgFrameNum, true, bDBug, bSimple, FrameOverride, AddonName, AddonAlias, bShowAddonName, bShowAddonVersion, bSpecialAddonVersionColour, bShowAddonReleaseType, bGetAlphaReleaseStateFromRInVersion, bRemoveRFromAlphaStateInVersion, AddonVersion, VersionType);
			end;
			
			local function DBState(bState) -- Changes the debug state for this function
				local OldState = bDBug;
				
				if (type(bState) == "boolean") then -- The new state was specified so use it
					bDBug = bState; -- Update the state to the new state
				elseif (bInvert) then -- The user wants to invert the state if one isn't provided so invert it!
					bDBug = not(bDBug); -- Invert the Debug state
				end;
				
				return OldState;
			end;
			
			return DBugMsg, ErrDBugMsg, DBState;
		end;
	------------------------------------------------------------------------------------------
	
	return Msg, ErrMsg, DBugMsg, ErrDBugMsg, InitDBug, ZMC.COLOURS, Settings; -- Return the local functions As they have access to there parents values!
end

function ZMC:PrintMessage(CallingAddon, sMessage, AliasColour, MessageColour, ChatFrame, bDebug, bDebugOn, bSimple, FrameOverride, AddonName, AddonAlias, bShowAddonName, bShowAddonVersion, bSpecialAddonVersionColour, bShowAddonReleaseType, bGetAlphaReleaseStateFromRInVersion, bRemoveRFromAlphaStateInVersion, AddonVersion, VersionType) -- Controls the displaying of messages to the user and debugging messages.
	----------------------------------------------------------------------------------------
	-- Defaults and checks
	----------------------------------------------------------------------------------------
		bDebug = bDebug or false; -- Set up Defaults encase this wasn't passed
		bDebugOn = bDebugOn or false; -- Set up Defaults encase this wasn't passed
		
		if (not(_G[AddonName.."_ZMCStoreDebugMsgs"]) and (bDebug and not(bDebugOn))) then -- Check to see if this function is needs to run...
			return; -- Exit function nice and quick as it isn't needed...
		end;
		
		local AddonDetails = "";
		
		if not(bSimple) then -- Addon HAS been initialized and simple mode is not wanted so use the addon's values.
			-----------------------------------------------
			-- Ensure the AddonVersion Variable exists
			-----------------------------------------------
				if (bShowAddonVersion and AddonVersion and (strlen(AddonVersion) > 0)) then
					if not(((tonumber(strsub(strupper(AddonVersion),0,1))) == nil) or (VersionType == "ALPHA")) then -- The first char is a number and this is not an ALPHA so add a V to it
						AddonVersion = "V"..tostring(AddonVersion)
					end;
				else
					AddonVersion = ""
				end;
			-----------------------------------------------
			
			
			
			-----------------------------------------------
			-- Add any ALPHA or BETA tags and/or colours
			-----------------------------------------------
				if (bShowAddonReleaseType and VersionType) then -- The user want's to add the version type to the end of the version string and it does exits so add it
					AddonVersion = tostring(AddonVersion).." "..tostring(VersionType);
				end;
				
				if (bSpecialAddonVersionColour and VersionType and (strlen(AddonVersion) > 0)) then -- There is a Version Type specified and the user wants the version coloured based on the type and there is a version to colour so...
					if (VersionType == "ALPHA") then -- If this is a ALPHA version then
						AddonVersion = self.DefaultAlphaVersionColour..AddonVersion..self.COLOURS.CLOSE;
					elseif (VersionType == "BETA") then -- If this is a BETA version then
						AddonVersion = self.DefaultBetaVersionColour..AddonVersion..self.COLOURS.CLOSE;
					elseif (VersionType == "RELEASE") then -- If this is a RELEASE version then colour it 
						AddonVersion = self.DefaultReleaseVersionColour..AddonVersion..self.COLOURS.CLOSE;
					end;
				end;
			-----------------------------------------------
			
			
			
			-----------------------------------------------
			-- Create AddonDetails variable
			-----------------------------------------------
				if (bShowAddonName) then
					AddonDetails = tostring(AddonAlias);
				end;
			-----------------------------------------------
			
			
			
			-----------------------------------------------
			-- Create AddonDetails variable
			-----------------------------------------------
				if (strlen(AddonVersion) > 0) then
					if (strlen(AddonDetails) > 0) then
						AddonDetails = tostring(AddonDetails).." "..tostring(AddonVersion)..": ";
					else
						AddonDetails = tostring(AddonVersion)..": ";
					end;
				elseif (strlen(AddonDetails) > 0) then
					AddonDetails = tostring(AddonDetails)..": ";
				end;
			-----------------------------------------------
		end;
		
		local Local_MsgFrame = returnChatFrame(ChatFrame); -- Stores the Message Frame to use from ether the one passed and if there isn't one then the default for this addon
		if (Local_MsgFrame == false) then
			Local_MsgFrame = ChatFrame1;
		end;
		
		if (sMessage == nil) then
			error(AddonDetails.."Message function called with a nil value(No message sent to print)!");
		end;
	----------------------------------------------------------------------------------------
	
	
	
	----------------------------------------------------------------------------------------
	-- Sets the colour of the messages
	----------------------------------------------------------------------------------------
		local sFullMessage = AliasColour..AddonDetails..self.COLOURS.CLOSE..tostring(MessageColour)..tostring(sMessage)..self.COLOURS.CLOSE;
	----------------------------------------------------------------------------------------
	
	
	
	--------------------------------------------------------------------------------------------
	-- Prints all normal messages in the normal chat window
	--------------------------------------------------------------------------------------------
		if not(bDebug and not(bDebugOn)) then -- This isn't a debug message when we arn't debugging
			Local_MsgFrame:AddMessage(tostring(sFullMessage)); --Print the message in a Main chat frame
		end;
	--------------------------------------------------------------------------------------------
	
	
	
	--------------------------------------------------------------------------------------------
	-- Stores all messages in the debug log if it's turned on
	--------------------------------------------------------------------------------------------
		---------------------------------------------------------
		-- Disable Debug Log Static Popup Dialog
		---------------------------------------------------------
			StaticPopupDialogs["DisableDebugLog"] = {
				text = "The debug log for "..tostring(AddonName).." is enabled. If the Author didn't tell you to enable it then you should disable and wipe it now. Do you want to disable it?",
				button1 = "Yes",
				button2 = "No",
				OnAccept = function()
					self:DisableDebugLog(tostring(AddonName)); -- Disables the Debug Log
				end,
				timeout = 0,
				whileDead = true,
				hideOnEscape = true,
			}
		---------------------------------------------------------
		
		
		
		---------------------------------------------------------
		-- Wipe Debug Log Static Popup Dialog
		---------------------------------------------------------
			StaticPopupDialogs["WipeDebugLog"] = {
				text = "The debug log for "..tostring(AddonName).." exists. If the Author didn't tell you to enable it then you should wipe it now to save memory. Do you want to wipe it?",
				button1 = "Yes",
				button2 = "No",
				OnAccept = function()
					self:WipeDebugLog(tostring(AddonName)); -- Wipes the Debug Log
				end,
				timeout = 0,
				whileDead = true,
				hideOnEscape = true,
			}
		---------------------------------------------------------
		
		
		
		if (bDebugLogEnabled) then -- If the debugLog is enabled then
			local CurrentDebugLogNum = #(_G[AddonName.."_ZMCDebugLog"]); -- Gets the number of entrys in the debug log
			
			if (Ask2DisableDebug) then
				Ask2DisableDebug = false; -- Say we have asked!
				StaticPopup_Show ("DisableDebugLog"); -- Shows the Reset WorldExplorer Settings warning question dialog box
			end;
			
			if CurrentDebugLogNum > MaxDebugLogEntrys then -- The array is HUGE! Stop debugging until this is deleted and inform the user
				_G[AddonName.."_ZMCStoreDebugMsgs"] = false; -- Stops storing the debug msgs
				
				self:PrintMessage(CallingAddon, "WARNING: The DebugLog is HUGE! To prevent errors debugging has been switched off. If you wern't asked to turn it on by an author then you should wipe this log and reduce memory usage.", nil, nil, true);
				self:PrintMessage(CallingAddon, "WARNING: The DebugLog is HUGE! To prevent errors debugging has been switched off. If you wern't asked to turn it on by an author then you should wipe this log and reduce memory usage.", AliasColour, self.DefaultErrorMsgColour, self.DefaultMsgFrameNum, nil, nil, nil, AddonName, AddonAlias, true, bShowAddonVersion, bSpecialAddonVersionColour, bShowAddonReleaseType, bGetAlphaReleaseStateFromRInVersion, bRemoveRFromAlphaStateInVersion, AddonVersion, VersionType) -- Controls the displaying of messages to the user and debugging messages.
			else -- Log is not to big so add to it as normal
				if (_G[AddonName.."_ZMCDebugLog"][CurrentDebugLogNum + 1] == nil) then
					_G[AddonName.."_ZMCDebugLog"][CurrentDebugLogNum + 1] = {};
				end;
				
				_G[AddonName.."_ZMCDebugLog"][CurrentDebugLogNum + 1][time()] = sMessage
			end;
		elseif ((_G[AddonName.."_ZMCDebugLog"] ~= nil) and (type(_G[AddonName.."_ZMCDebugLog"]) == "table") and (#(_G[AddonName.."_ZMCDebugLog"]) > 0) and Ask2WipeDebug) then
			Ask2WipeDebug = false; -- Say we have asked so not to ask again until a reload
			
			StaticPopup_Show ("WipeDebugLog"); -- Shows the Reset WorldExplorer Settings warning question dialog box
		end;
	--------------------------------------------------------------------------------------------
end;

--[ [
function ZMC:WipeDebugLog(CallingAddon) -- This function disables and wipes the debug log for the specified addon.
	if (type(CallingAddon) == "table") then
		if (type(CallingAddon.Name) == "string") then
			CallingAddon = CallingAddon.Name; -- Pull out the name of the calling function 
		else
			self:PrintMessage(_G[CallingAddon], "ERROR: Argument #1 ('"..tostring(CallingAddon).."') for function ZMC:WipeDebugLog() is not a string or an addon frame with a .name variable that is a string. Can't get the name of the addon so can't disable debuggin for the addon!", nil, nil, true);
			
			return false;
		end;
	elseif (type(CallingAddon) ~= "string") then
		self:PrintMessage(_G[CallingAddon], "ERROR: Argument #1 = '"..tostring(CallingAddon).."' for function ZMC:WipeDebugLog() is not valid! It should be the addon frame or it's name but it is of type '"..tostring(type(CallingAddon)).."'!", nil, nil, true);
		
		return false;
	end;
	
	if ((_G[CallingAddon.."_ZMCDebugLog"] ~= nil) and ((type(_G[CallingAddon.."_ZMCDebugLog"]) == "table") or (_G[CallingAddon.."_ZMCStoreDebugMsgs"] == true))) then
		_G[CallingAddon.."_ZMCStoreDebugMsgs"] = false; -- Stores the local copy back over the the addon's StoreDebugMsgs boolean (It's now definatly inishilized even if it's not going to be stored!)
		_G[CallingAddon.."_ZMCDebugLog"] = {}; -- Stores the local copy back over the the addon's DebugLog (It's now definatly inishilized even if it's not going to be stored!)
		
		self:PrintMessage(_G[CallingAddon], "Debugging disabled and debuglog wiped");
		
		return true;
	else
		self:PrintMessage(_G[CallingAddon], ZMC.COLOURS.ORANGE.."Warning: Addon: '"..tostring(CallingAddon).."' doesn't have a debug log and the debug logging is disabled or addon doesn't exist!"..self.COLOURS.CLOSE);
		
		return false;
	end;
end;

function ZMC:EnableDebugLog(CallingAddon)
	if (type(CallingAddon) == "table") then
		if (type(CallingAddon.Name) == "string") then
			CallingAddon = CallingAddon.Name; -- Pull out the name of the calling function 
		else
			self:PrintMessage(CallingAddon, "ERROR: Argument #1 ('"..tostring(CallingAddon).."') for function ZMC:EnableDebugLog() is not a string or an addon frame with a .name variable that is a string. Can't get the name of the addon so can't disable debuggin for the addon!", nil, nil, true);
			
			return false;
		end;
	elseif (type(CallingAddon) ~= "string") then
		self:PrintMessage(CallingAddon, "ERROR: Argument #1 = '"..tostring(CallingAddon).."' for function ZMC:EnableDebugLog() is not valid! It should be the addon frame or it's name but it is of type '"..tostring(type(CallingAddon)).."'!", nil, nil, true);
		
		return false;
	elseif (_G[CallingAddon] == nil) then
		self:PrintMessage(CallingAddon, "ERROR: Argument #1 = '"..tostring(CallingAddon).."' for function ZMC:EnableDebugLog() is not valid! It should be the addon frame or it's name. The string you provided is not a valid frame name. Please check spelling and case as it is case sensitive. E.G. 'MyAddon' and 'myAddon' are not the same as the m is lower case in the second example.", nil, nil, true);
		
		return false;
	end;
	
	_G[CallingAddon.."_ZMCStoreDebugMsgs"] = true; -- Stores the local copy back over the the addon's StoreDebugMsgs boolean (It's now definatly inishilized even if it's not going to be stored!)
	_G[CallingAddon.."_ZMCDebugLog"] = _G[CallingAddon.."_ZMCDebugLog"] or {}; -- Stores the local copy back over the the addon's DebugLog (It's now definatly inishilized even if it's not going to be stored!)
	self:PrintMessage(_G[CallingAddon], "Debugging enabled");
	
	return true;
end;

function ZMC:DisableDebugLog(CallingAddon)
	if (type(CallingAddon) == "table") then
		if (type(CallingAddon.Name) == "string") then
			CallingAddon = CallingAddon.Name; -- Pull out the name of the calling function 
		else
			self:PrintMessage(CallingAddon, "ERROR: Argument #1 ('"..tostring(CallingAddon).."') for function ZMC:EnableDebugLog() is not a string or an addon frame with a .name variable that is a string. Can't get the name of the addon so can't disable debuggin for the addon!", nil, nil, true);
			
			return false;
		end;
	elseif (type(CallingAddon) ~= "string") then
		self:PrintMessage(CallingAddon, "ERROR: Argument #1 = '"..tostring(CallingAddon).."' for function ZMC:EnableDebugLog() is not valid! It should be the addon frame or it's name but it is of type '"..tostring(type(CallingAddon)).."'!", nil, nil, true);
		
		return false;
	elseif (_G[CallingAddon] == nil) then
		self:PrintMessage(CallingAddon, "ERROR: Argument #1 = '"..tostring(CallingAddon).."' for function ZMC:EnableDebugLog() is not valid! It should be the addon frame or it's name. The string you provided is not a valid frame name. Please check spelling and case as it is case sensitive. E.G. 'MyAddon' and 'myAddon' are not the same as the m is lower case in the second example.", nil, nil, true);
		
		return false;
	end;
	
	_G[CallingAddon.."_ZMCStoreDebugMsgs"] = false; -- Stores the local copy back over the the addon's StoreDebugMsgs boolean (It's now definatly inishilized even if it's not going to be stored!)
	self:PrintMessage(_G[CallingAddon], "Debugging disabled");
	
	return true;
end;

function ZMC:SlashCmdHandler(msg)
	local errorMsg = "Please use enabledebuglog, disabledebuglog or wipedebuglog followed by the addon's name. E.G. /ZMC-"..MajorNum.." disabledebuglog MyAddon";
	
	if (msg == nil or msg == "") then
		self:PrintMessage(nil, errorMsg);
	elseif (strlower(strsub(msg,1,14)) == "enabledebuglog") then
		--self:PrintMessage(self, "EnableDebugLog("..tostring(msg)..")");
		local CallingAddonName = strsub(msg,16)
		if (strlen(CallingAddonName) > 0) then
			self:EnableDebugLog(CallingAddonName);
		else
			self:PrintMessage(nil, errorMsg);
		end;
	elseif (strlower(strsub(msg,1,14)) == "disabledebuglog") then
		--self:PrintMessage(self, "DisableDebugLog("..tostring(msg)..")");
		local CallingAddonName = strsub(msg,16)
		if (strlen(CallingAddonName) > 0) then
			self:DisableDebugLog(CallingAddonName);
		else
			self:PrintMessage(nil, errorMsg);
		end;
	elseif (strlower(strsub(msg,1,12)) == "wipedebuglog") then
		--self:PrintMessage(self, "EnableDebugLog("..tostring(msg)..")");
		local CallingAddonName = strsub(msg,14)
		if (strlen(CallingAddonName) > 0) then
			self:WipeDebugLog(CallingAddonName);
		else
			self:PrintMessage(nil, errorMsg);
		end;
	else
		self:PrintMessage(nil, errorMsg);
	end;
end;


do -- Slash Command Handler
	SLASH_ZMC1 = "/ZMC-"..MajorNum;
	SlashCmdList["ZMC-"..MajorNum] = function(msg)
		ZMC:SlashCmdHandler(msg);
	end;
	
	-- Make /rl reloadui (not really msg related but soo useful and added by lots of addons already)
	SLASH_RELOAD1 = "/rl";
	SlashCmdList["RELOAD"] = function(msg)
		ReloadUI();
	end;
end;--]]