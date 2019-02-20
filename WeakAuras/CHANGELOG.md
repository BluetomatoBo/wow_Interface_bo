# [2.11.4](https://github.com/WeakAuras/WeakAuras2/tree/2.11.4) (2019-02-17)

[Full Changelog](https://github.com/WeakAuras/WeakAuras2/compare/2.11.3...2.11.4)

## Highlights

 Rewritten Spell Cooldown tracking and bug fixes! 

## Commits

InfusOnWoW (12):

- AuraBar: Add a SetIcon method whether Icon is enabled or not
- Fix regressions in Cooldown tracking
- Fix Texts width Fixed Width in Dynamic Groups
- Fix Spell Charges being overwritten by GetSpellCount
- Rewrite Spell Cooldown Tracking
- Add a way to add collapsed options to triggers
- Reorder Cooldown Progress Options
- Fix Cooldown + Charges Spells switch from CD to charge CD
- Try fixing the Item Equipment Slot Cooldown Tracking initial state
- BuffTrigger2: Fix Multi Target clearing too much data
- Fix collapse setting on multi selection
- Wrap more functions in xpcall

emptyrivers (3):

- Fix userValue generation
- fix user mode value retrieval
- enforce that max >= min

mrbuds (5):

- Merge pull request #1173 from mrbuds/smallfix2
- Templates: add overlayGlow for Lava Burst
- Fix cast trigger not untriggering correctly Fix UNIT_TARGET event registered when not needed
- add current tier zoneId and zoneGroupId list in tooltips #1151
- Templates: sham elem buffs update #1153 (#1154)

