--[[

****************************************************************************************
LibStrataFix

Author: oscarucb

****************************************************************************************

]]--

local _G = _G
local UIParent, pairs, string, select, type = 
      UIParent, pairs, string, select, type

local MAJOR, MINOR = "LibStrataFix", 10000+tonumber(string.match("$Revision: 3$","%d+"))
local lib, oldminor
if LibStub then
  lib, oldminor = LibStub:NewLibrary(MAJOR, MINOR)
else
  lib = {}
end
if not lib then return end
_G["LibStrataFix"] = lib

lib.debug = false
lib.spamfilter = setmetatable({}, {__mode = "k"})

local function chatMsg(msg)
     DEFAULT_CHAT_FRAME:AddMessage(MAJOR..": "..msg)
end

local function debug(msg)
  if lib.debug then chatMsg(msg) end
end

local function SetLevel(frame, level, context)
  local parent = frame:GetParent()
  if not frame.SetFrameLevel then
    debug("Missing frame.SetFrameLevel on "..(frame:GetName() or "<unnamed>").." in "..(context or "unknown"))
    return
  end
  if lib.debug then
   local msgcnt = lib.spamfilter[frame] or 0
   if msgcnt < 5 then
    debug("Fixing level of "..(frame:GetName() or "<unnamed>")..":"..(frame:GetFrameLevel() or "nil")..
          " child of "..(parent and parent:GetName() or "<unnamed>")..":"..(parent and parent:GetFrameLevel() or "nil")..
          " in "..(context or "unknown"))
   end
   lib.spamfilter[frame] = msgcnt + 1
  end
  frame:SetFrameLevel(level)
end

local function CheckOne(frame, parent, context)
  local p = parent.GetFrameLevel and parent:GetFrameLevel()
  local c = frame.GetFrameLevel and frame:GetFrameLevel()
  if not c or not p then return end
  if c <= p then
    SetLevel(frame, p+1, context)
  end
end

-- template exceptions: Templates can have a parent attribute that overrides the CreateFrame argument
-- This is an awful programming practice which is thankfully also very rare. We handle such cases here.
lib.templateExceptions = {
  -- template name = parent frame ("name" or reference)
  ["TaxiButtonTemplate"] = "TaxiFrame",
}
--------------------------------------------------------------------
local function GetChild(parent,num)
  return select(num,parent:GetChildren())
end
--------------------------------------------------------------------
-- upgradeable hooks
function lib.CreateFrameHook(frameType, name, parent, template)
  local te = template and lib.templateExceptions[template]
  if te then 
     if type(te) == "string" and _G[te] then
       te = _G[te]
     end
     if type(te) == "table" and te.IsObjectType and te:IsObjectType("Frame") then 
       parent = te
     end
  end
  if parent and parent ~= UIParent then
    local num = parent:GetNumChildren()
    if not num or (num <= 0) then -- should never happen
      debug("Something very strange happenned in CreateFrameHook: num="..(num or "nil"))
    else
      -- ticket 3: In extreme cases, Frame:GetChildren() can cause an internal stack overflow
      -- for frames with too many children. Unfortunately, there is no other way to retrieve the last child
      -- So we use pcall to catch the potential overflow and ignore it
      local ok, frame = pcall(GetChild,parent,num)
      if ok and frame then
        CheckOne(frame, parent, "CreateFrame")
      elseif lib.debug then
        debug("Skipped check for CreateFrame on "..(parent:GetName() or "<unnamed>").." due to "..(frame or "nil"))
      end
    end
  end
end

function lib.SetParentHook(self,parent)
  if type(parent) == "string" then -- handle Frame:SetParent("name")
    parent = _G[parent]
  end
  if parent then
    CheckOne(self, parent, "SetParent")
  end
end

--------------------------------------------------------------------
-- hook init
local function SetParentHookWrap(...)
  return lib.SetParentHook(...)
end
local function CreateFrameHookWrap(...)
  return lib.CreateFrameHook(...)
end

lib.hookDone = lib.hookDone or {}

lib.hookTypes = {
  "Frame",
  "Button",
  "CheckButton",
  "Cooldown",
  "ColorSelect",
  "Slider",
  "EditBox",
  "SimpleHTML",
  "StatusBar",
  "ScrollFrame",
  "MessageFrame",
  "ScrollingMessageFrame",
}

-- ensure we only hook once despite library upgrades
local function InitHooks()
  if not lib.hookDone["CreateFrame"] then
    lib.hookDone["CreateFrame"] = true
    hooksecurefunc("CreateFrame", CreateFrameHookWrap)
  end
  for _,t in pairs(lib.hookTypes) do
    if not lib.hookDone[t] then
      lib.hookDone[t] = true
      local o = CreateFrame(t)
      local mt = getmetatable(o)
      if mt.__index and mt.__index.SetParent then
        hooksecurefunc( mt.__index, "SetParent", SetParentHookWrap)
      end
      o:Hide()
      o:UnregisterAllEvents()
    end
  end
  debug(" v"..MINOR.." loaded.")
end

InitHooks()

