# [2.9.0](https://github.com/WeakAuras/WeakAuras2/tree/2.9.0) (2018-11-04)

[Full Changelog](https://github.com/WeakAuras/WeakAuras2/compare/2.9.0-beta2...2.9.0)

## Highlights

 ### BuffTrigger2 (@InfusOnWoW)

We built a new buff trigger system to compensate for a change Blizzard made with Battle for Azeroth, you can read all about it on our [Patreon](https://www.patreon.com/posts/22272340) page.

You can mass-convert auras that are using the old aura trigger by <kbd>Shift</kbd> (new!) or <kbd>Ctrl</kbd> selecting them and then hitting the red button. Do note though that only the first, or rather the selected, trigger gets converted, if your aura has multiple triggers, you have switch between triggers and press the button for each of them. Every new aura you create, will use `BuffTrigger2` by default, in the trigger dropdown, the new system is called `Aura` whereas the old one is called `Legacy Aura`. In addition, the old system is now deprecated, meaning it will not receive any features or bug fixes unless they are critical and it will be removed completely with the release of patch 9.0 at the earliest.

We did a lot of testing ourselves and with our crew of alpha testers (still recruiting!) and we are now at a point where we can say that this is ready for the masses.

**TLDR**: New trigger system, convert your auras by pressing the big red `Convert to New Aura Trigger` button on each `Trigger` page, enjoy better performance, report bugs if you find them. We love you long time. :heart:


-### Other Changes

- Added a condition to change icon zoom. (@Irame)
- Templates got their usual round of fixes and additions. (@PatrM, @mrbuds)
- You can now shift-click select auras in the list inside of the same groups or when not grouped. (@mrbuds)
- The options now open where you left off the last time. (@mrbuds)
- There are now different types of glows you can apply to icons, powered by LibCustomGlow. (@emptyrivers)
- The [Art Contest](https://github.com/WeakAuras/WeakAuras2/wiki/First-WeakAuras-Art-Contest) winner submissions have been added. (@InfusOnWoW)
- There is a new minimap icon. You can turn it off by middle-clicking on the icon or by typing `/wa minimap`. (@mrbuds)
- It is now possible to share auras via chat links to cross-realm players if they are in your group. (@mrbuds)


### Patreon

We've had a Patreon page for a long time, but it was never active and was also not a team-wide effort. We've now changed this and you can read more about that [here](https://www.patreon.com/posts/team-wide-22391241). If you always wanted to support us, now you can! 

## Commits

Benjamin Staneck (3):

- add some spaces to trigger replacement strings
- ignore beta tags during changelog generation
- Update README.md

Infus (3):

- Adjust some BuffTrigger2 options to the Asakawa's suggestions
- Fix unevent for in GenericTrigger.Add
- BuffTrigger2: Fix scanFunc for if matchData has no tooltip

