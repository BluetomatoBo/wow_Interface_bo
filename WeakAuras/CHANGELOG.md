# [2.6.5](https://github.com/WeakAuras/WeakAuras2/tree/2.6.5) (2018-07-28)

[Full Changelog](https://github.com/WeakAuras/WeakAuras2/compare/2.6.4...2.6.5)

Allen Faure (2):

- allow arbitrary return values from custom text function
- default to ratio of 1 if the aspect ratio is undefined

Benjamin Staneck (2):

- better fix for profiling prints
- Fix profiling prints

Buds (2):

- fix hiding adjusted timers on obselete timers (#541)
- Add "Adjust Timer" option to DBM and BigWigs timers

Causese (6):

- Improve templates by adding General/PvP Azerite Traits
- adds class+specc specific azerite traits
- fix microstutter by removing non-existing items
- removed enchants that share id through name
- added enchants
- adds raid/dungeon/worldboss/pvp-trinket templates

Infus (10):

- Item Cooldown: Also fix onCooldown check in trigger
- Power trigger: Update spell cost on UNIT_DISPLAYPOWER events
- Fix tooltip scanning for fullscan auras
- Add the enabled state for item cooldowns
- Fix General and Azerite traits
- Fix renaming forgetting about customActionsFunctions
- Fix Aspect Ratio code if height or width is 0
- Fix setting of number values if the actual value is nil
- Add id to Condition Functions
- Abort the enrichDatabase in templates

