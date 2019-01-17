# [2.11.0](https://github.com/WeakAuras/WeakAuras2/tree/2.11.0) (2019-01-06)

[Full Changelog](https://github.com/WeakAuras/WeakAuras2/compare/2.10.11...2.11.0)

## Highlights

 - Companion integration
- New options layout on the display tab
- Re-enable aura linking in guild chat
- Tons of improvements to custom options 

## Commits

InfusOnWoW (14):

- Fix generating clones for states that are removed
- Fix GetFrameLevel after a aura rename
- Add a option to ignore the SpellKnown check
- Tweak check for insignificant cooldown to <= 1 instead of <1
- Fix Shield of the Righteous cooldown tracking
- Import: Fix lua error in StringToTable
- Add a mirror property for Textures and Progress Textures
- Ensure that childs have the right parent
- Change fallback icons/names for BuffTrigger 2
- Remove Workaround for Ascendance + Lavabursts speecial case
- Fix GetSpellCooldownUnified for Rune of Power
- Fix ordering of options on multi-selection
- Fix Textures being wonky
- Adjust CheckRange to use the same fallback as the trigger

Stanzilla (5):

- add Battle for Dazar'alor encounter ids
- change changelog script again so versions show up as we want them to
- bump minor of widget
- Revert "Print a error message on trying to share a aura via guild chat"
- Revert "Remove the chat filterFunc for guild chat"

emptyrivers (20):

- add height controls to space option
- add duplicate button
- fix default values for multiselect
- add formatting to select/multiselect display names
- change multi-select resolution to favor collapsed groups
- update visibility on conversion between regionTypes
- remove new feature indicators on old features
- Allow custom options to format text
- fix Copy URL and Set Description
- index the correct table when shunting anchor -> arrangement
- tweak name auto-generation
- fix up/down disablefuncs
- fix missing config value validation
- add multiselect option
- fix Copy Settings
- add uid to old data when updating
- don't automatically assign a uid to existing auras just yet
- Only copy config once
- Update Import API
- Collapsible Option Groups in Display tab (#1010)

mrbuds (8):

- Migration did not update "version" if field was already set
- fix nil error in version comparison
- use boolean value for "notCheckable" and "notClickable" menu options
- fix wago menu at same position for auras and groups rename "Ignore this Update" to "Skip this Version" rename "Stop ignoring this Update" to "Don't skip this Version" show skip version option, and update option, only if aura as update data
- set LDB type to launcher #1068
- Show semver version from Wago if available + fix changelog display (#1058)
- fix cast trigger remaining time #1054
- Stop showing update icons on every child of a group when possible (#1046)

