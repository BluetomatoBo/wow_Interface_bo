# [2.8.0](https://github.com/WeakAuras/WeakAuras2/tree/2.8.0) (2018-09-30)

[Full Changelog](https://github.com/WeakAuras/WeakAuras2/compare/2.7.10...2.8.0)

## Highlights

 In this release, we switched our compression library from LibCompress to LibDeflate by @SafeteeWoW. This is approximately a 80% decrease in the size of large string exports, and a further decrease in the size of addon channel transmissions. Yes, we will no longer freeze your client when you export huge groups, this is for you Tehr, Reloe, Causese, Sloot, etc.

This implementation is backwards compatible with legacy strings, which were compressed and encoded using LibCompress, and older versions without LibDeflate will correctly detect that they cannot decode and decompress the data.

This means that starting today, if you export an aura, the person you want to give it to has to be running at least WeakAuras 2.8.0 or higher as well. This is also true for wago.io, which has been updated to support the new format and even displays a warning message for users.

Otherwise this release includes the usual round of bugfixes and template additions while we continue to work on our new buff trigger system that will bring way better performance for buff/debuff checking auras.

**NOTE: THIS UPDATE REQUIRES A GAME RESTART** 

## Commits

Benjamin Staneck (1):

- bufftrigger: use RegisterUnitEvent for UNIT_PET instead

Buds (6):

- templates: prot-pal added "Redoubt" buff
- templates: more consistent coding style,
- fix buff "always show" template
- improved cast template  - inverse = false  - condition: uninterruptible = red
- improved Health and Power templates  - added types "power" and "health  - left text and icon removed  - inverse = false  - Health show incoming heal and absorb  - Power show cost of casts
- templates: removed shaman's totem category

Causese (1):

- removes placeholder trait

Infus (12):

- Fix a error on Deleting auras
- Send ENCOUNTER_START event triggers with a encounter load option
- Change GetRange to check unit visibility
- Fix nil error
- Fix percent power for Soul Shards
- BuffTrigger: Fix ShowOn and Own Only being on the same line
- Add a Talent Selected trigger
- Fix Action Usable for unknown spells
- Fix Conditions not being reset on ReloadAll
- Add Uldir Azerite Trait to Templates
- Fix BuffTrigger for tracking pet buffs/debuffs
- Fix Charges Changed trigger

Vardex (1):

- Added Condition:Attackable Target (#785)

emptyrivers (2):

- fix WA_IterateGroupMembers again (#798)
- implement LibDeflate (#784)

