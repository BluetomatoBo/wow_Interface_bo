if not WoWUnit then
  return
end

local Search =  LibStub('LibItemSearch-1.2')
local Tests = WoWUnit('LibItemSearch-1.2')
local IsTrue = WoWUnit.IsTrue

function Tests:ArtifactRelic()
  local item = '\124cffa335ee\124Hitem:140040::::::::120:::::\124h[Comet Dust]\124h\124r'

  IsTrue(Search:Matches(item, 'relic'))
  IsTrue(Search:Matches(item, 'artif'))
  IsTrue(Search:Matches(item, 'artifact'))

  IsTrue(Search:Tooltip(item, 'relic'))
  IsTrue(Search:Tooltip(item, 'artifact'))
end

function Tests:Azerite()
  local shoulder = '\124cffa335ee\124Hitem:161391::::::::120::::2:4822:1477:\124h[Deathshambler\'s Shoulderpads]\124h\124r'
  local heart = '\124cffe5cc80\124Hitem:158075::::::::120:::::\124h[Heart of Azeroth]\124h\124r'

  IsTrue(Search:Matches(shoulder, 'azer'))
  IsTrue(Search:Matches(shoulder, 'azerite'))

  IsTrue(Search:Matches(heart, 'azer'))
  IsTrue(Search:Matches(heart, 'azerite'))
end

function Tests:ChampionEquipment()
  local item = '\124cffff8000\124Hitem:147556::::::::120:::::\124h[Cloak of Concealment]\124h\124r'

  IsTrue(Search:Matches(item, 'champ'))
  IsTrue(Search:Matches(item, 'champion'))
  IsTrue(Search:Matches(item, 'follow'))
  IsTrue(Search:Matches(item, 'follower'))
end
