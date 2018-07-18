# [2.6.0](https://github.com/WeakAuras/WeakAuras2/tree/2.6.0) (2018-07-17)

[Full Changelog](https://github.com/WeakAuras/WeakAuras2/compare/2.5.12...2.6.0)

Aigars Bedeicis (1):

- Add Scale option to groups

Allen Leigh Faure (1):

- partial reversion 0128295

Andrew Scott (1):

- LibSpellRange-1.0 is now on GitHub

Benjamin Staneck (23):

- correct formatting of new HelperFunctions file
- LibSpellRange-1.0 is now on GitHub
- clean up a few unused upvalues
- Bring back accidently deleted charges function
- Check if path is a string instead
- add a nil check in SetTextureOrAtlas() since name can be nil sometimes
- Fix nil value error
- fix variable shadowing
- Update issue templates
- Fix tooltip truncation
- Fix nil error
- oops 2
- oops
- make the "cannot load addon" messages a bit nicer
- change some print formats
- Pull LibRangeCheck in via pkgmeta again since it was updated.
- clarify that a few load conditions support more than one entry
- re-enable zone id load condition by using the new map API
- package 8.0 branch tags using the BigWigs packager
- remove LibChatAnims
- change to simpler url format in pkgmeta since we don't use the other options anyway.
- use the new STAT_STAGGER constant to translate Stagger
- update changelog

Buds (3):

- OnHide code was run on frame creation, fix #474 (#476)
- oops
- fix CheckPvpTalentByIndex nil index error (#453)

Infus (23):

- Simplify stacks code for Cooldown Progress
- Fix ESC handling
- Make Raid Buffs not use ownOnly
- Revert "Workaround a issue in LibSpellRange"
- Fine tune templates
- Update templates for BfA
- Add initial templates for some classes
- Fix display options for multi-selection and overlays
- Add Bar Alpha to Conditions
- AuraBar: Add Icon Desaturate to Conditions
- Fix tooltip scanning and improve the functionality
- Fix Charges not updating on talent changes
- Move Registering of Events from Add to Load
- Fix models not showing up
- Register the Options window in UISpecialFrames
- Document another place as a WORKAROUND around a Blizzard bug
- Add Atlas texture support for Textures, Progress Textures and Sparks
- Fix Aura not showing on ScanAll in certain cases
- Fix showing of wrong icon in a corner case
- Fix BuffTrigger's CanHaveDuration
- Fix setting glow on a aura moves it around
- Fix Range Trigger + Range Conditions
- Fix charges Changed trigger

Rehok (1):

- Cooldown Progress (Equipment Slot): Add Name function

asakawa-k (1):

- Add functions commonly used by custom WA authors

emptyrivers (4):

- include maghar orc in race_types
- Fix anchored auras in dynamic groups
- Ignore Load tab when copying display
- [Feature] Add HSV color animations (#408)

