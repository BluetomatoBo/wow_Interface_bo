--
--
-- GreySeller by Elba @ Nemesis - Europe
-- A wow addon that simply tries to sell any grey item to every vendor
-- you will encounter.
-- This will hopefully help you in keeping your bags to become cluttered
-- with useless things... and will save you some clicks along the way.
-- 
-- Licensed under GPL v3 (lol)
--
-- Based on the event handler tutorial seen at http://www.wowwiki.com
--
-- ChangeLog:
--	see changelog file

-- ===========================================================================
-- Initial housekeeping and addon-wide global constants
-- ===========================================================================


-- The addon name... as constant
local GS_NAME = "GreySeller"

-- Keeping track of version in an internal var. May be useful in the future.
local GS_VERSION = GetAddOnMetadata(GS_NAME, "Version") 

-- Name of the frame
local GS_EVENTS_FRAME_TYPE = "Frame"

-- Number of bags a player has, think it's safe to hardcode it.
local GS_PLAYER_BAG_COUNT = 5

-- Colors
local GS_DEFAULT_CHAT_TEXT_MSG_COLOR = {r = .7, g = .7, b = .7 }

-- ===========================================================================
-- Helper functions
-- ===========================================================================
-- A small collection of function with an utility role: printing to the 
-- default chat frame, looping over, bags, doing string pattern matching...
-- and the like.

-- Helper to print to the chat frame with a given prefix
local function GS_logToChatWithPrefix(prefix, text, color)
  -- if color wasn't passed to the function we take
  -- the global default
  if (not color) then
    color = GS_DEFAULT_CHAT_TEXT_MSG_COLOR
  end

  -- if the default chat frame isn't available we dont' do anything.
  if (DEFAULT_CHAT_FRAME) then
    DEFAULT_CHAT_FRAME:AddMessage(prefix .. " " .. text, color.r, color.g, color.b);
  end
end 

-- Helper to print to the chat frame prefixed with the addon name
local function GS_logToChat(text)
  GS_logToChatWithPrefix(GS_NAME .. ":", text)
end 

-- Helper to format the money count in golds, silver, coppers.
-- returns an array with the following keys: gold, silver, copper.
local function GS_copperToMoney(price)
  g = math.floor(price/(100*100))
  s = math.floor((price- 100*100*g)/100)
  c = math.floor(price- 100*s- 100*100*g)
  return { gold=g, silver=s, copper=c }
end

-- Helper that takes an array with the keys: gold, silver, copper
-- and returns a (hopefully) nicely formatted string suitable to 
-- be printed in chat frames.
local function GS_moneyToString(money) 
  out = ""
  if money["gold"] > 0 then
    out = out .. money["gold"] .. "g "
  end
  if money["silver"] > 0 then
    out = out .. money["silver"] .. "s "
  end
  if money["copper"] > 0 then
    out = out .. money["copper"] .. "c"
  end
  return out
end 

-- Creating the barebone frame that will be used to subscribe
-- the game events, alongside with the dict that will hold our event-handling
-- code.
local frame, events = CreateFrame(GS_EVENTS_FRAME_TYPE), {};


-- ===========================================================================
-- Events handlers
-- ===========================================================================
-- We define the single event handling function as slots of the 'event'
-- dictionary. Later on this will permit us to elegantly subscribe
-- the events we're interested in, with the help of a bit of metaprogramming 
-- magic.


-- MERCHANT_SHOW event handler
-- Loop shamelessly over all the bags and their slots and "use" the item
-- which means "sell" since we're doing that when we have a merchant window
-- open.
function events:MERCHANT_SHOW(...)
  local soldItemCount = 0 -- keep track of how many greys we've sold in the last
                          -- visit to a vendor.
  local soldMoney = 0     -- keep track of how much we gain by selling greys...

  -- we loop over the bag indexes
  for bag = 0, GS_PLAYER_BAG_COUNT - 1, 1 do

    -- for each bag, we iterate over their slots, the last one is the the one
    -- at index GetContainerNumSlots(bag).
    for bagSlot = 1, GetContainerNumSlots(bag), 1 do

      -- we get the item link from the bag slot
      local item = GetContainerItemLink(bag, bagSlot);
      -- we need also to know how many items are there in that particular bagSlot
      -- the first value returned is not really used... the name reflects that
      local unusedTexture, itemCount = GetContainerItemInfo(bag, bagSlot);

      -- looping that way over bags will yield also nil items, 
      -- that is to say emtpy bag slots. For some reason
      -- i don't like the not equal operator in lua... 
      if (not (item == nil)) then 

        -- we need to retrieve everything from itemInfo since the
        -- information on how much the item is valued is found only
        -- as the last argument.
        local itemName, itemLink, itemRarity,
        itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
        itemEquipLoc, itemTexture, vendorPrice = GetItemInfo(item)

        -- if the item is a junk thing... i.e. grey
        if (itemRarity == 0) then 
          -- we actively sell the junk
          UseContainerItem(bag, bagSlot);
          soldItemCount = soldItemCount + itemCount 
          if (vendorPrice) then
            soldMoney = soldMoney + vendorPrice * itemCount
          end
        end

      end -- closing if item is not nil
    end -- closing the looping inside a bag
  end -- closing the looping over all bags
  
  -- if we sold something we notify the user writing in the
  -- default chatframe
  if ((soldItemCount) and (soldItemCount > 0)) then
    moneyString = GS_moneyToString(GS_copperToMoney(soldMoney))
    GS_logToChat(string.format("Gained %s from %d greys", moneyString, soldItemCount))
  end
end

-- ===========================================================================
-- Event subscribing and event handlers setup
-- ===========================================================================

-- Registrering OnEvent with an anonimous function that wraps
-- a call to our event handler code.
frame:SetScript("OnEvent", function(self, event, ...)
  events[event](self, ...); -- call one of the functions above
end);

for k, v in pairs(events) do
  -- Register all events for which handlers have been defined
  frame:RegisterEvent(k);
end

-- We greet the user, finally our addon is live and enabled.
-- this will be printed when the addon is loaded into memory
-- i.e. when you reload the ui or when you login.
GS_logToChat(string.format("version %s enabled", GS_VERSION))
