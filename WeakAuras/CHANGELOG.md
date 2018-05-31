# [2.5.12](https://github.com/WeakAuras/WeakAuras2/tree/2.5.12) (2018-05-24)

[Full Changelog](https://github.com/WeakAuras/WeakAuras2/compare/2.5.11...2.5.12)

Benjamin Staneck (5):

- move master builds to the BigWigs packager as well.
- package 8.0 branch tags using the BigWigs packager
- add a prettyPrint function and use it in a few places
- add names to the profiling keybinds
- add prints to pstart and pstop

Infus (21):

- Fix error handling.
- Prevent actions from conditions if the auras aren't shown. Take 2
- Add a maxCharges condition to Cooldown Progress
- Ajust conditions to trigger reorderings automatically
- Improve layout for merge options
- Tweak error handling some more
- Handle errors again
- Fix overlays not updating if nothing else changed
- Workaround a issue in LibSpellRange
- Convert region types of clones too
- Special case FRAME_UPDATE event also for custom triggers
- Fix nil error on empty nameinfo
- Reset xOffset and yOffset on adding to a dynamic group
- Fix Load conditions for encounter ids
- Fix a few bugs, remove TODOs
- Don't early return if before potentially enabling rune watching
- Fix Overlay colors not resetting after Condition
- Fix issues with profiling and some animations
- Add a "loadFunc" to Prototypes which is called on loading a aura
- Add Profiling Support to WeakAuras
- Merge RegionOptions on multi selection

