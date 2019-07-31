# Deadly Boss Mods Core

## [8.2.10](https://github.com/DeadlyBossMods/DeadlyBossMods/tree/8.2.10) (2019-07-31)
[Full Changelog](https://github.com/DeadlyBossMods/DeadlyBossMods/compare/8.2.9...8.2.10)

- Prep for release  
- Fixed a lot of incorrect timers on engage for Queens court on some difficulties  
    Fixed Fanatical Charge timer being too slow on 3 of the 4 difficulties of Queens court  
    Fixed Decree timer in LFR Court, which is MUCH slower and only has 3 types  
    Fixed missing detection of LFR version of Repeat Performance on Queens Court  
- Added support for Danath Trollbane - Horde  
- try to fix rare case where hidden stuff (such as quest tooltips) are not restored after a boss kill/wipe. The only explanation i could find was a bad return in stats nil check. (of course this doesn't even explain HOW stats could have been nil, since that hasn't been an issue since blizzard removed script ran too long from loadaddon)  
- Few mythic Za'qul fixes. really need a transcriptor log to review and fix more.  
- Cleanup unused stuff and outdated comments on azshara mod.  
    Fixed AI timer for divide and conquer so it correctly AI generates in Stage 3 and Stage 4 transitions.  
    Pruned Arcane Burst fading warning, since it's very subjective and not up to DBM to decide when is "safe" time to LoS. You get warned when you get debuff, it's up to you to figure out WHEN to run it out based on your strat.  
- If player is dead, they can't interrupt or dispel. now both filters check for this.  
- Looks like at some point a couple very minor ashvane adjustments were made to make timers more consistent, allowing me to purge some of my condition checks, which will fix the new issue that suddenly bash timer was 1.1 seconds slow and briny timer being 0.6 seconds slow.  
- Oops, revert that, it's a redundant check  
- Fix nil error if minToc doesn't exist  
- Remove some no longer needed Min-Interface tocs (still required by DBM-Core, so leave it there)  
- Change this to 5  
- Fix Arcing yells showing in all difficulties, apparently that's something blizzard changed on live to be mythic only mechanic  
- Fix stanzilla's fix, so it doesn't break mod.  
- adjust packager call  
- fix a few warnings  
- Really just to force a newer file to appear in twitch client that's for correct game version  
- move to the BigWigs community packager  
- KR Update (#48)  
    * KR Update  
    * KR Update  
    * KR Update  
    * KR Update  
    * KR Update  
    * KR Update  
    * KR Update  
    * KR Update  
    * KR Update  
    * KR Update  
- Minor fix to last  
- Fix it so dbms built in media is once again available as custom media sounds for drop down menus for boss mod specific special warning sounds. Closes #47  
- Add tomorrows 3 min adds berserk timer. I could technically put the 2 min one in now, but might as well just get ahead of it.  
- Added missing taunt warning for Briny Bubble, I thought that was already in mod, my mistake!  
    Also made the bash taunt warning smarter so it doesn't tell you to swap needlessly after 2nd bash. If bubble is next then you'll swap at bubble when it happens, NOT after 2nd bash.  
    Also, if you are doing a tank strat where one tank just takes both bash, just disable the bash taunt warning, the new bubble warning is all you need.  
