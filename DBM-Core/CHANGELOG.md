# Deadly Boss Mods Core

## [8.2.11](https://github.com/DeadlyBossMods/DeadlyBossMods/tree/8.2.11) (2019-08-07)
[Full Changelog](https://github.com/DeadlyBossMods/DeadlyBossMods/compare/8.2.10...8.2.11)

- Oh yeah, one more thing, filter void slam if not in D realm  
- Fix couple mistakes and prep release  
- expand the unit target scanner to support more than one unit at a time  
    Switched king mechagon to use the faster unittargetscanner method, since based on logs, not only will it work, it'll work hella fast.  
    Updated Trixie/Naeno and Tussle Tonks from logs with improved timers and warnings.  
- Fix missing =  
- Prune redundant function that's only used by two mods in all of DBMs history, when that function can be merged into original boss HP function like it should have been to begin with.  
- Actually update divide and conquer timer in correct object  
- Horray, no longer a dead project. (#51)  
- Make council of captains more robust to bad combat detection  
- KR Update (#50)  
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
    * KR Update  
- Updated HK8, KUJ0, and Garden mods with real timers, and fixes. HK8 still needs a longer log to get initial timers for a 2nd cycle though.  
- Fix diferred sentence warnings so they actually go off and changed warning text to be non instructive.  
    Removed the Pashmars touch taunt warning, for same reason Silivaz touch warning was removed. Two diff bosses with two diff stacking debuffs that stack up at diff rates and have multiple opinioins on WHEN/how many stacks they should be swapped, it's better to not warn at all than to warn incorrectly. The general stack warnings for both bosses will always be shown, and from that hopefully tanks can communicate their own taunts.  
- Mythic azshara update, it's just about got everything except for the spells blizzard didn't put in combat log in stage 4. That'll be done once I have a stage 4 transcriptor log, or blizzard pulls head out of their own ass, whichever happens first.  
- Prevent error when pulling a world boss in 8.2.5 ptr  
- Push hard mode king mechagon support  
    rest of zone still incoming but wanted to push this one first.  
- Handle when blizzard uses invalid spell Ids in emotes, in the new debug code  
- Fix death filters being backwards on interrupt and dispels  
- prune this  
    and also bump alpha revision.  
- Fade the summoner/portal bar in phase 2 and 3 za'qul. The timer will still start/exist in these phases because it's still useful to know where timer is at when we enter P4, but the fade will help identify that it doesn't apply to current phase of fight.  
- Fixed a bug, where the countdown on a timer would not correctly update when :AddTime call was used on an existing timer  
    Fixed a bug where nightmares timer was canceled on za'qul incorrectly on P3 start  
    Added dread correction timer to phase 4 transition. when boss transitions from regular dread to manic, 10 seconds are removed from timer (can be verified in just about any log, just check time between first manic cast and non manic dread cast, it's almost always 65 instead of 75. when P3 starts, timer = existing time - 10  
- Fix invalid arg order. Closes #49  
