# [2.6.1](https://github.com/WeakAuras/WeakAuras2/tree/2.6.1) (2018-07-22)

[Full Changelog](https://github.com/WeakAuras/WeakAuras2/compare/2.6.0...2.6.1)

Allen (5):

- localize table before modifying it
- debug is local to this file, no need to access the main WeakAuras object
- delete ancient commented code, which will never be uncommented
- make the triggerstate entry creation atomic
- simplify AddMany slightly

Allen Faure (3):

- remove unnecessary OR statements
- reuse result from last GetSpecialization() call
- exclude additional_triggers when copying display settings

Benjamin Staneck (4):

- add format.bat to gitignore
- increase buff loop again
- Actually fix trigger.itemSlot nil
- loop 40 auras

Causese (2):

- Fix nil error in group zoneId
- adds zone group ID load condition (#494)

Infus (10):

- Fix stacks condition for Cooldown Progress (Spell)
- Add a "Pet Specialization" trigger to the Pet Behavior trigger
- Add Spell Id to Status/Cast trigger
- Fix debuffClass filters for fullscan
- Add a "In Encounter" load condition and also rework couldBeLoaded
- Optimize Cooldown Progress(Equipment Slot) name function
- Observe the enabled flag of GetItemCooldown
- Fix %s showing a 1 even if the ability had no charges
- Workaround more Blizzard's inability to get text sizes correctly.
- Fix IconPicker with "inf" and similar inputs

Rehok (1):

- trigger.itemSlot can be nil

emptyrivers (1):

- add a static popup to confirm deletion of auras (#478)

