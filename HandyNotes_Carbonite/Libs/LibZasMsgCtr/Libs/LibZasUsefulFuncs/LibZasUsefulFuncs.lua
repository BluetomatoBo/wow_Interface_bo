--=========================================================================================================================
-- Library: Zasurus' Useful Functions
--[[=======================================================================================================================
	See History.txt and http://wow.curseforge.com/addons/LibZasUsefulFuncs/ for more infomation
=========================================================================================================================]]


---------------------------------------------------------------------------------------------------------------------------
-- Header
---------------------------------------------------------------------------------------------------------------------------
	local ZUF = LibStub:NewLibrary("LibZasUsefulFuncs-0.1", 9)
	if not(ZUF) then
		-- already loaded and no upgrade necessary
		return
	end;
---------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------------------------------
-- Useful Functions
---------------------------------------------------------------------------------------------------------------------------
	-- We will put the useful functions in here so we can tell these apart from functions for this library
	ZUF.Functions = {};
	-- TableCount: Counts table members
	function ZUF.Functions.tablecount(tableToCount)
		-- This is a table so count it and return number
		if (type(tableToCount) == "table") then
			local TableCount=0;
			
			for _ in pairs(tableToCount) do
				TableCount=TableCount+1;
			end;
			
			return TableCount;
		-- This is NOT a table so return 0
		else
			return 0;
		end;
	end;
	-- TableMax: Pulls back the maximun number (index) for the table specified (Like TableCount() but works when all the table entrys are not in sequencial or contain none Numbers
	function ZUF.Functions.tablemax(tableToGetMax)
		-- This is a table so count it and return number
		if (type(tableToGetMax) == "table") then
			local MaxNum=0;
			
			for Key,Values in pairs(tableToGetMax) do
				if (type(Key) == "number") then
					if (Key > MaxNum) then
						MaxNum = Key
					end;
				end;
			end;
			
			return MaxNum;
		-- This is NOT a table so return 0
		else
			return 0;
		end;
	end;
	-- TblLowCheck: Checks a table to see if the key is the "TestValue" in any case
	function ZUF.Functions.tbllowcheck(TestTable, TestValue)
		-- This is a table so count it and return number
		if (type(TestTable) == "table") then
			local returnValues = {};
			local nextValueNum = 1;
			
			for Key, Value in pairs(TestTable) do
				-- Checks if the test 
				if (strlower(Key) == strlower(TestValue)) then
					returnValues[nextValueNum] = Key;
					nextValueNum = nextValueNum + 1;
				end;
			end;
			-- returns the contence of returnValues that can be picked up like: Value1, Value2, Value3 = TblLowCheck(...);
			return unpack(returnValues);
		else -- This is NOT a table so return 0
			return 0;
		end;
	end;
	-- CopyTable: Copys a table (instead of just pointing to it!)
	function ZUF.Functions.copytable(src)
		local dest = {}
		
		if (type(src) == "table") then
			for k,v in pairs(src) do
				if type(k) == "table" then
					k = CopyTable(k)
				end
				if type(v) == "table" then
					v = CopyTable(v)
				end
				dest[k] = v
			end
		else
			dest = scr;
		end;
		
		return dest;
	end
	-- StrFirstUpper: Returns the string with the first letter in upper case and the rest in lower case
	function ZUF.Functions.strfirstupper(str)
		return strupper(strsub(str,0,1))..strlower(strsub(str,2))
	end;
	-- ReturnChatFrame: Given a number this returns the ChatFrame for that number. e.g. if 1 is given it will return ChatFrame1
	function ZUF.Functions.returnchatframe(ChatFrameNumber)
		local FrameToReturn;
		if (ChatFrameNumber == 1) then
			FrameToReturn = ChatFrame1;
		elseif (ChatFrameNumber == 2) then
			FrameToReturn = ChatFrame2;
		elseif (ChatFrameNumber == 3) then
			FrameToReturn = ChatFrame3;
		elseif (ChatFrameNumber == 4) then
			FrameToReturn = ChatFrame4;
		elseif (ChatFrameNumber == 5) then
			FrameToReturn = ChatFrame5;
		elseif (ChatFrameNumber == 6) then
			FrameToReturn = ChatFrame6;
		elseif (ChatFrameNumber == 7) then
			FrameToReturn = ChatFrame7;
		else
			FrameToReturn = false;
		end;
		
		return FrameToReturn;
	end;	
	-- Round: Round to # dicimal places and convert to number
	function ZUF.Functions.round(Number, DecimalPlaces, Type)
		Type = Type or "Number";
		
		Number = (("%%.%df"):format(DecimalPlaces)):format(Number);
		
		if (strlower(Type) == "string") then
			Number = tostring(Number);
		else
			Number = tonumber(Number);
		end;
		
		return Number;
	end;
	-- GetAddonVersion: This returns the current AddOn version worked out from the versions metadata...
	--####################################################################################
	-- This needs looking at as it apears full of flags that arn't set (likely from before
	-- I pulled it out of it's original addon and put it here!!!
	--####################################################################################
	function ZUF.Functions.getaddonversion(AddonName)
		------------------------------------------------------------------------------------------
		-- Workout Addon Version and Version Type (Alpha, Beta or Release)
		------------------------------------------------------------------------------------------
			local AddonVersion = GetAddOnMetadata(AddonName, "Version");
			local VersionType = GetAddOnMetadata(AddonName, "X-VersionType");
			-- No addon version type could be pulled back from the TOC file. Look to see if it is in the version string
			if (not(VersionType) and AddonVersion) then
				AddonVersion = strupper(AddonVersion);
				-- See if this is a RELEASE version
				if not(strfind(AddonVersion, "RELEASE") == nil) then
					-- Say this is a RELEASE version
					VersionType = "RELEASE";
					-- As the version type is already in the version we don't need to add it
					bShowAddonReleaseType = false;
				-- See if this is a BETA version
				elseif not(strfind(AddonVersion, "BETA") == nil) then
					-- Say this is a BETA
					VersionType = "BETA";
					-- As the version type is already in the version we don't need to add it
					bShowAddonReleaseType = false;
				-- AddonVersion not specified or not release / beta
				else
					-- Check if this is a dev release "V0.1-9 BETA"
					if not(strfind(tostring(AddonVersion), "@PROJECT-VERSION@", nil,true) == nil) then
						-- Say this is an DEV version
						VersionType = "DEV";
						-- As the version type is already in the version we don't need to add it
						bShowAddonReleaseType = false;
					-- Not dev so try another method
					else
						-- Pulls back the last "-" in the AddonVersion string (will use it if we suspect this is a Git ALPHA Version to remove the Hash)
						local LastHyphenLoc = strfind(strrev(AddonVersion), "%-", 1);
						-- This is must be an ALPHA version
						if not(strfind(AddonVersion, "ALPHA") == nil) then
							-- Say this is a ALPHA version;
							VersionType = "ALPHA";
							-- As the version type is already in the version we don't need to add it
							bShowAddonReleaseType = false;
						-- This could be an ALPHA version
						elseif ((strsub(strlower(AddonVersion), 0, 1) == "r")) then
							local EndNumber = strsub(strlower(AddonVersion), 2);
							local bEndIsNumber = not(tonumber(EndNumber) == nil);
							-- The start is r and the rest is a number so asume it is an alpha release (maybe by an SVN)
							if (bEndIsNumber) then
								-- Set the version to JUST the number
								AddonVersion = EndNumber;
								-- Say this is an ALPHA version;
								VersionType = "ALPHA";
							end;
						-- This looks like an ALPHA release from Git
						elseif ((select(2, gsub(AddonVersion, "%-", "")) > 1) and LastHyphenLoc and (bGetAlphaReleaseStateFromRInVersion)) then
							VersionType = "ALPHA";
							
							if (bTrimHashFromEndVersionNum) then
								AddonVersion = strsub(AddonVersion, 1, (strlen(strrev(AddonVersion)) - LastHyphenLoc)); 
							end;
						-- version type not found in the version string
						else
							-- As the version type is not known asume it's a dev!
							bShowAddonReleaseType = true;
							-- Say this is an DEV version
							VersionType = "DEV";
						end;
					end;
				end;
			elseif (VersionType) then
				VersionType = strupper(VersionType);
			end;
			
			-- Work out a traffic light colour scheme for the version types
			local VersionTypeColour = "GREEN";
			if (VersionType == "ALPHA" or VersionType == "DEV") then
				VersionTypeColour = "RED"
			elseif (VersionType == "BETA") then
				VersionTypeColour = "ORANGE"
			end;
			
			return AddonVersion, VersionType, VersionTypeColour;
		------------------------------------------------------------------------------------------
	end;
	-- SetRotation: Rotates the given texture to the angle given. NOTE: Not BY the angel given but TO the angle given.
	-- Positive numbers move it Counter Clock Wise. So 90 will move a picture of a vertical line going from the center of the image to the top of the image point from the center to the left (3 o'clock)
	-- The third variable "bmirror" will invert the texture before rotating it (save having two textures!)
	function ZUF.Functions.setrotation(Texture, Angle, bMirror, bInvertRotation)
		-- check if the texture is to be mirroed but not the rotation
		if (bMirror and not(bInvertRotation)) then
			-- swop the angle's sign (plus to minus & minus to plus)
			Angle = Angle * -1;
		end;
		
		-- Do angle calculations (thanks to wowpedia.org for the code!)
		local function CalculateCorner(Angle)
			local s2 = sqrt(2);
			local cos, sin, rad = math.cos, math.sin, math.rad;
			local r = rad(Angle);
			return 0.5 + cos(r) / s2, 0.5 + sin(r) / s2;
		end;
		
		--declare the points outside of the if
		local ULx, ULy, LLx, LLy, URx, URy, LRx, LRy;
		-- check if mirror flag is set
		if (bMirror) then
			-- mirror the texture during the rotaion
			LRx, LRy = CalculateCorner(Angle + 135);
			LLx, LLy = CalculateCorner(Angle + 45);
			ULx, ULy = CalculateCorner(Angle - 45);
			URx, URy = CalculateCorner(Angle + 225);
		else
			-- just a normal rotaion
			LRx, LRy = CalculateCorner(Angle + 45);
			LLx, LLy = CalculateCorner(Angle + 135);
			ULx, ULy = CalculateCorner(Angle + 225);
			URx, URy = CalculateCorner(Angle - 45);
		end;
		
		Texture:SetTexCoord(ULx, ULy, LLx, LLy, URx, URy, LRx, LRy);
	end;
	-- CreateMinimapButton: Creates and Returns a minimap icon. Can take name, IconPicturePath, Array to store settings
	--  Tooltip contence, and functions to call on: Click, MouseDown, MouseUp & MouseWheel!
	function ZUF.Functions.createminimapbutton(AddonName, IconsPath, SavedIconSettings, TooltipMsg, OnClickFunc, OnMouseDownFunc, OnMouseUpFunc, OnMouseWheelFunc)
		----------------------------------------------------
		-- Make sure variables are valid
		----------------------------------------------------
			assert(type(AddonName) == "string","First parameter must be a string with the name of the addon/icon ('_MiniMapButton' will be added)");
			assert(type(IconsPath) == "string","Second parameter must be a string with the path to the texture for the icon");
			assert(type(SavedIconSettings) == "table","Third parameter must be a table to store icon settings");
		----------------------------------------------------
		
		
		-- Store the Icon's Name
		local IconsName = AddonName.."_MiniMapButton";
		-- Initialize the default position of the minimap icon in degrees
		SavedIconSettings.MinimapPos = SavedIconSettings.MinimapPos or -35;
		
		
		---------------------------------------
		-- Create Main Button Frame
		---------------------------------------
			local MiniMapButton = CreateFrame("Button", IconsName, Minimap);
			MiniMapButton:SetFrameStrata("MEDIUM");
			MiniMapButton:SetWidth(31);
			MiniMapButton:SetHeight(31);
			MiniMapButton:SetFrameLevel(8);
			MiniMapButton:SetHighlightTexture([[Interface\Minimap\UI-Minimap-ZoomButton-Highlight]]);
			MiniMapButton:RegisterForClicks("AnyUp");
			MiniMapButton:RegisterForDrag("LeftButton");
		---------------------------------------
		
		
		---------------------------------------
		-- Create OVERLAY
		---------------------------------------
			local overlay = MiniMapButton:CreateTexture(nil, "OVERLAY");
			overlay:SetWidth(53);
			overlay:SetHeight(53);
			overlay:SetTexture([[Interface\Minimap\MiniMap-TrackingBorder]]);
			overlay:SetPoint("TOPLEFT");
		---------------------------------------
		
		
		---------------------------------------
		-- Create BACKGROUND
		---------------------------------------
			local background = MiniMapButton:CreateTexture(nil, "BACKGROUND");
			background:SetWidth(20);
			background:SetHeight(20);
			background:SetTexture([[Interface\Minimap\UI-Minimap-Background]]);
			background:SetPoint("TOPLEFT", 7, -5);
		---------------------------------------
		
		
		---------------------------------------
		-- Create Icon's Main Texture (ARTWORK)
		---------------------------------------
			local icon = MiniMapButton:CreateTexture(nil, "ARTWORK");
			icon:SetWidth(17);
			icon:SetHeight(17);
			icon:SetTexture(IconsPath);
			icon:SetPoint("TOPLEFT", 7, -6);
			MiniMapButton.icon = icon;
		---------------------------------------
		
		
		------------------------------------------------------------------------------
		-- Create Function to Reposition the minimap button
		------------------------------------------------------------------------------
			local function MinimapButton_Reposition()
				local XPos = 52-(80*cos(SavedIconSettings.MinimapPos));
				local YPos = (80*sin(SavedIconSettings.MinimapPos))-52;
				MiniMapButton:SetPoint("TOPLEFT", "Minimap", "TOPLEFT", XPos, YPos);
			end;
		------------------------------------------------------------------------------
		
		
		---------------------------------------
		-- Create Dragging Update Frame
		---------------------------------------
			MiniMapButton.DragUpdateFrame = CreateFrame("Frame", nil, MiniMapButton);
			-- Hiding Drag Frame so it's OnUpdate function/script is disabled
			MiniMapButton.DragUpdateFrame:Hide();
			-- Creating OnUpdate function
			MiniMapButton.DragUpdateFrame:SetScript("OnUpdate", function()
				local xpos, ypos = GetCursorPosition();
				local xmin = Minimap:GetLeft();
				local ymin = Minimap:GetBottom();
				-- get coordinates as differences from the center of the minimap
				xpos = xmin-xpos/UIParent:GetScale()+70;
				ypos = ypos/UIParent:GetScale()-ymin-70;
				-- Save the degrees we are relative to the minimap center
				SavedIconSettings.MinimapPos = math.deg(math.atan2(ypos,xpos));
				-- Reposition the minimap button
				MinimapButton_Reposition();
			end);
		---------------------------------------
		
		
		------------------------------------------------------------------------------
		-- Setup Scripts
		------------------------------------------------------------------------------
			---------------------------------------
			-- Popup Setup
			---------------------------------------
				-- Make sure a tooltip msg was passed before enabling the tooltip code
				if ((type(TooltipMsg) == "string") and (strlen(TooltipMsg) > 0)) then
					MiniMapButton:SetScript("OnEnter", function(self)
						-- Make it apear next to the minimap icon
						GameTooltip:SetOwner(self, "ANCHOR_LEFT");
						-- Clear any existing tooltip
						GameTooltip:ClearLines();
						-- Add our data
						GameTooltip:AddLine(TooltipMsg);
						-- Show the tooltip
						GameTooltip:Show();
					end);
					MiniMapButton:SetScript("OnLeave", function(self)
						-- Hide the tooltip
						GameTooltip:Hide();
					end);
				end;
			---------------------------------------
			
			
			---------------------------------------
			-- Dragging setup
			---------------------------------------
				MiniMapButton:SetScript("OnDragStart", function()
					MiniMapButton:LockHighlight();
					MiniMapButton.DragUpdateFrame:Show();
				end);
				MiniMapButton:SetScript("OnDragStop", function()
					MiniMapButton:UnlockHighlight();
					MiniMapButton.DragUpdateFrame:Hide();
				end);
			---------------------------------------
			
			
			---------------------------------------
			-- Use passed in functions
			---------------------------------------
				if (type(OnClickFunc) == "function") then
					MiniMapButton:SetScript("OnClick", OnClickFunc);
				end;
				if (type(OnMouseDownFunc) == "function") then
					MiniMapButton:SetScript("OnMouseDown", OnMouseDownFunc);
				end;
				if (type(OnMouseUpFunc) == "function") then
					MiniMapButton:SetScript("OnMouseUp", OnMouseUpFunc);
				end;
				if (type(OnMouseWheelFunc) == "function") then
					MiniMapButton:EnableMouseWheel(true);
					MiniMapButton:SetScript("OnMouseWheel", OnMouseWheelFunc);
				end;
			---------------------------------------
		------------------------------------------------------------------------------
		
		
		-- Position the minimap button to it's saved position
		MinimapButton_Reposition();
		--Showing New Icon!
		MiniMapButton:Show();
		-- Returning the minimap to the calling function
		return MiniMapButton;
	end;
---------------------------------------------------------------------------------------------------------------------------

-- Returns all the local functions as an array
function ZUF:GetFunctions(...)
	local count = select('#',...)
	-- Check and if required apply the interface options frame level fix
	self:ApplyInterfaceOptionsFrameLevelFix();
	-- Check if the user specified what to return and return those if so
	if (count > 0) then
		-- Array that we will populate with the functions the user asked for
		local ReturnArray = {};
		-- The number of values in the array
		local NextReturnArrayNum = 0;
		
		for i = 1, count do
			local Value = select(i, ...);
			
			NextReturnArrayNum = NextReturnArrayNum + 1;
			
			if (ZUF and ZUF.Functions and ZUF.Functions[strlower(Value)]) then
				ReturnArray[NextReturnArrayNum] = ZUF.Functions[strlower(Value)];
			end;
		end;
		-- Return the array of functions asked for. If a function name wasn't found a nil will be returned for that function.
		return unpack(ReturnArray);
	-- Nothing specified so return them all
	else
		return ZUF.Functions.tablecount, ZUF.Functions.tablemax, ZUF.Functions.tbllowcheck, ZUF.Functions.copyyable, 
		-- Return the newest versions of the local useful functions
		ZUF.Functions.strfirstupper, ZUF.Functions.returnchatframe, ZUF.Functions.round;
	end;
end;

-- Check and if required apply the interface options frame level fix
function ZUF:ApplyInterfaceOptionsFrameLevelFix()
	-- Store what the default InterfaceOptionsFrameStrata is
	local DefaultInterfaceOptionsFrameStrata = "HIGH";
	-- Check that the user hasn't set a flag to disable this...
	if not(DisableZasInterfaceOptionsFrameStrata) then
		-- Check if the InterfaceOptionsFrameStrata has changed
		if not(InterfaceOptionsFrame:GetFrameStrata() == DefaultInterfaceOptionsFrameStrata) then
			-- Storing current Strata encase someone asks to disable this in another addon!
			self.OrigInterfaceOptionsFrameStrata = InterfaceOptionsFrame:GetFrameStrata();
			-- Repair InterfaceOptionsFrame Strata as other addon's make it above dialogs!!! You know who you are "LibBetterBlizzOptions"
			InterfaceOptionsFrame:SetFrameStrata(DefaultInterfaceOptionsFrameStrata);
		end;
	-- Request to disable this feature found so check if we have already done it!
	elseif (self.OrigInterfaceOptionsFrameStrata) then
		-- Storing current Strata
		local CurrentInterfaceOptionsFrameStrata = InterfaceOptionsFrame:GetFrameStrata();
		-- Check if the CurrentInterfaceOptionsFrameStrata is the same as the OrigInterfaceOptionsFrameStrata
		if (CurrentInterfaceOptionsFrameStrata == DefaultInterfaceOptionsFrameStrata) then
			-- Restore OrigInterfaceOptionsFrameStrata
			InterfaceOptionsFrame:SetFrameStrata(self.OrigInterfaceOptionsFrameStrata);
			-- Wipe stored OrigInterfaceOptionsFrameStrata as we are done with it
			self.OrigInterfaceOptionsFrameStrata = nil;
		end;
	end;
end;