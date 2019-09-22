# Deadly Boss Mods Core

## [8.2.19](https://github.com/DeadlyBossMods/DeadlyBossMods/tree/8.2.19) (2019-09-16)
[Full Changelog](https://github.com/DeadlyBossMods/DeadlyBossMods/compare/8.2.18...8.2.19)

- Fix Ai timer clear logic, with better logic  
- Fixed bad logic with timer auto correction so it does NOT run for debug mode and ignore users preferences. Debug mode is supposed to find timer errors, it can't do that as accurately if timer correction is forced to on when debug mode is on.  
    Added a logic check to AI timers that should wipe last cast timestamp if last cast was from an earlier pull. This should wipe out any further issues of AI timers generating ridiculously long CDs for abilities by comparing time stamps between two completely different pulls.  
- Fix invalid global write caused by missing arg (cat) in new EditboxOption.  
- Same as last commit, only actually in correct spot this time  
- Fix last remaining scroll bar bug with drop down. Arrow not being clickable on a first created drop down, until mouse wheeling or grabbing knob.  
- Fixed a lua error during a raid dbm version check that could occur if user has a voice pack selected, that's not currently installed.  
- Fixed dropdown not expanding enough initially do to width calculations not accounting for 16 pixel wide scrollbar  
    Fixed dropdown expanding not accounting for 16 pixel wide scrollbar  
    Fixed dropdown aggressively expanding more than it needs to for non font entries  
- Local updates & set an alpha that actually matches aesthetics of DBM GUI  
- Fix regression that broke GUI frames do to bad template logic (that caused it to only ever run dropdown code on scrollbars)  
- GUI Updates (#68)  
    * Added the ability to display edit boxes defined by mods  
    * Added the ability to display sliders (because AddSliderOption has existed for ages, but never actually injected anything... WHY?)  
    * Little bit of cleanup, prevent duplicating work.  
    * Few more tweaks for GUI  
    * AddButton now supports width, height, and font object  
    * AddButton doesn't require a func, because it has onClick argument... which is the same?  
    * Added AddEditboxOption  
    * Added func argument for AddSliderOption  
    * Supported func argument for AddDropdownOption, which now actually fires  
    * Hopefully fix the slidebar issue also?  
    * Finally fixed all of the dropdown scrollbar issues  
- AntiSpam Bioelectric Blast if Wekemara stutter casts it  
    Adjusted Wekemara timers slightly  
