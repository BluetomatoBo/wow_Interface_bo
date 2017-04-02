----------------------------------------------------------------------------------------------------
-- version module, controls addon version
--

--get the engine and create the module
local Engine = select(2,...)
local mod = Engine.AddOn:NewModule("version")

--debug
local debug = Engine.AddOn:GetModule("debug")

--get locale
local L = Engine.Locale;

--get a version table from a version string
function mod:GetVersion(versionStr)

	local Version = {};

	Version.Label = versionStr;
	Version.Major,Version.Minor,Version.Release = strsplit(".",versionStr);

	return Version;
end


--compare our version and returns : 0 if are equals, 1 if we higher, or 2 if we are lower
function mod:CompareVersions(version)

	if (mod.Major>version.Major) then
		return 1;
	elseif mod.Major<version.Major then
		return 2;
	--equal Major version
	else
		if (mod.Minor>version.Minor) then
			return 1;
		elseif mod.Minor<version.Minor then
			return 2;
		--equal Major and Minor version
		else
			if (mod.Release>version.Release) then
				return 1;
			elseif mod.Release<version.Release then
				return 2;
			--equal Major, Minor and Release version
			else
				return 0;
			end
		end
	end

end

--we recieve a message from other player addon
function mod.VersionRecived(prefix, message, distribution, sender)
	--if we get a version
	if prefix == Engine.VERSION_PREFIX then
		debug("VersionRecived from '%s' : %s", sender,message);

		--don't compare versions if we know that we are outdated
		if mod.OutDated then return; end

		--compare versions
		local otherVersion = mod:GetVersion(message);
		local compare = mod:CompareVersions(otherVersion);

		--if our version is higher than the other player, we notify him that has a wrong version
		if (compare==1) then

			mod.VersionSend(sender);
			print(string.format(L["PLAYER_VERSION"],mod.Title,sender,message));

		--if our version its lower thant the other player, we print a message and we set that we have
		-- an outdated version, so we do not display the message anymore during this session
		elseif (compare==2) then

			mod.OutDated=true
			print(string.format(L["WRONG_VERSION"],mod.Title,message));

		end

	end
end

--send our addon version, if not target just send to the instance group
function mod.VersionSend(target)

	--do not send messages if we are outdated
	if mod.OutDated then return; end

	--if we do not have a target send to instance chat, that works as well for user created group
	if not target or target == "" then
		debug("Version %s send to instance chat", mod.Label);

		--set the message to the right chat
		if IsInRaid() then
			Engine.AddOn:SendCommMessage(Engine.VERSION_PREFIX,mod.Label, (not IsInRaid(LE_PARTY_CATEGORY_HOME) and IsInRaid(LE_PARTY_CATEGORY_INSTANCE)) and "INSTANCE_CHAT" or "RAID");
		elseif IsInGroup() then
			Engine.AddOn:SendCommMessage(Engine.VERSION_PREFIX,mod.Label, (not IsInGroup(LE_PARTY_CATEGORY_HOME) and IsInGroup(LE_PARTY_CATEGORY_INSTANCE)) and "INSTANCE_CHAT" or "PARTY");
		end

	else
		debug("Version %s send to char: %s",mod.Label,target);
		Engine.AddOn:SendCommMessage(Engine.VERSION_PREFIX,mod.Label,"WHISPER",target);
	end

end

--party has change
function mod.PartyMembersChanged()

	--get group members, first from instance group, ifnot from player created group
	local numGroup = GetNumGroupMembers();

	--if we have players in the group
	if numGroup>0 then

		--if we were not grouped before
		if not mod.inGroup then

			debug("join a new group")
			--send our version to the group
			mod.VersionSend("");

			--now we are in a group
			mod.inGroup = true;
		end

	else
		--means we have leave the group or disbanded
		mod.inGroup = false;

		debug("leaving a group")
	end

end

--store the addon version
function mod:OnInitialize()

	--get if we are in Legion
  local _, _, _, Toc = _G.GetBuildInfo()
  self.Legion = ( Toc >= 70000)

	--default values
	mod.Label = "0.0.0";
	mod.Major = 0;
	mod.Minor = 0;
	mod.Release = 0;

	--get the version from metadata
	local versionStr = GetAddOnMetadata(Engine.Name, "Version");

	--parse the version
	if(versionStr) then

		local Version = mod:GetVersion(versionStr);

		mod.Label 	= Version.Label;
		mod.Major 	= Version.Major;
		mod.Minor 	= Version.Minor;
		mod.Release = Version.Release;

	end

	--get addon title
	local title = GetAddOnMetadata(Engine.Name, "Title");

	if (title) then
		mod.Title = title;
	else
		mod.Title = Engine.Name;
	end

	--we register the version message based on our slash that is based on the addon anme
	-- for example for addon named Cecile_ExampleAddon will be CEA_VER
	Engine.VERSION_PREFIX = string.upper(Engine.slash1).."_VER"

	--register prefix for version checking and setup the listener function
	Engine.AddOn:RegisterComm(Engine.VERSION_PREFIX,mod.VersionRecived);

	debug("Registered addon message %s",Engine.VERSION_PREFIX);

	--control if we are in a group
	mod.inGroup = false;

	--we are not outdated, yet
	mod.OutDated=false;

	--listen to group changes
	Engine.AddOn:RegisterEvent("GROUP_ROSTER_UPDATE",mod.PartyMembersChanged);

end
