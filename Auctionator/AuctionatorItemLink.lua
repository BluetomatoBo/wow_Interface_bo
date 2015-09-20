Auctionator.ItemLink = {
  item_link = '',
  item_string = nil,
  parsed_item_link = nil,
  item_id_string = nil,
  pet_id_string = nil
}

-- TODO: Create a BattlePetLink that inherits from this, and correctly calculates an IdString

function Auctionator.ItemLink:new( options )
  -- Auctionator.Debug.Message( 'ItemLink:new', options.item_link )

  options = options or {}
  setmetatable( options, self )
  self.__index = self

  return options
end

function Auctionator.ItemLink:ItemString()
  if not self.item_string then
    _, _, self.item_string = self.item_link:find( '^|c%x+|H(.+)|h%[.*%]' )
  end

  return self.item_string
end

function Auctionator.ItemLink:ParsedItemLink()
  if not self.parsed_item_link and self:ItemString() then
    self.parsed_item_link = { strsplit( ':', self:ItemString() ) }
  end

  return self.parsed_item_link
end

function Auctionator.ItemLink:GetField( field_id )
  return (self:ParsedItemLink() or {})[ field_id ] or 0
end

function Auctionator.ItemLink:IdString()
  local item_type = self:GetField( Auctionator.Constants.ItemLink.TYPE )

  if item_type == 'item' then
    return self:ItemIdString()
  elseif item_type == 'battlepet' then
    return self:BattlePetIdString()
  end
end

function Auctionator.ItemLink:ItemIdString()
  if not self.item_id_string then
    self.item_id_string = self:GetField( Auctionator.Constants.ItemLink.ID ) .. ':' ..
      self:GetField( Auctionator.Constants.ItemLink.SUFFIX_ID ) .. ':' ..
      self:GetField( Auctionator.Constants.ItemLink.BONUS_ID_COUNT ) .. ':' ..
      self:GetField( Auctionator.Constants.ItemLink.BONUS_ID_3 )
  end

  return self.item_id_string
end

function Auctionator.ItemLink:BattlePetIdString()
  if not self.pet_id_string then
    self.pet_id_string = self:GetField( Auctionator.Constants.ItemLink.ID )


    Auctionator.Debug.Message( 'Created BattlePetIdString', self.pet_id_string )
    Auctionator.Util.Print( self.parsed_item_link )
  end

  return self.pet_id_string
end

function Auctionator.ItemLink:BonusIdCount()
  return tonumber( self:GetField( Auctionator.Constants.ItemLink.BONUS_ID_COUNT ) )
end

function Auctionator.ItemLink:BonusIdString()
  local bonus_id_string = ''

  for offset = 1, self:BonusIdCount() do
    bonus_id_string = bonus_id_string .. ':' .. self:GetField( Auctionator.Constants.ItemLink.BONUS_ID_COUNT + offset )
  end

  return bonus_id_string
end

function Auctionator.ItemLink:Print()
  for index = 1, Auctionator.Constants.ItemLink.MAX do
    print( self.item_link, index, self:ParsedItemLink()[ index ] )
  end
end