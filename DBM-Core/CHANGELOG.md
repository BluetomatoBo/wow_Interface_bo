# Deadly Boss Mods Core

## [8.2.13](https://github.com/DeadlyBossMods/DeadlyBossMods/tree/8.2.13) (2019-08-16)
[Full Changelog](https://github.com/DeadlyBossMods/DeadlyBossMods/compare/8.2.12...8.2.13)

- Prep a release  
- Fix another error  
- Fix error  
- Queen Azshara P4 timer rework, improving accuracy in all difficulties thanks to longer pull data available. Just about all abilities in that phase are sequenced so most of timers in that phase are now sequenced.  
    TODO, more sequence data and combine sequence tables into cleaner format.  
    Also fixed a couple LFR timers  
- Fixed a bug that'd cause timer update code for :RemoveTime timer object to put a timer into negative instead of canceling it if it falls below zero  
    Renamed "other boss mods" to "other mods" to reflect that some of those mods (such as pvp) aren't boss mods.  
    Updated Mythic azshara timers  
    Revamped za'qul with timer correction code on stage changes that account for several of hidden logics that cause spells to delay, or in one niche case come sooner.  
    Fixed a bug where Za'qul horiffic summoner timer would start faded in phase 1 after a wipe on heroic/mythic difficulty.  
    Fixed a bug where during Phase 4 Za'qul you could end up getting a dread AND a manic dread timer. There should now only be one dread timer.  
- Adjust add berserk some, apparently it's not a 3 min berserk, it's a 2min 54.2 second one :D (i mean technically 3 since blizzard counst the 5.8 seconds adds are not attackable against the player)  
- Added missing heal interrupt spell to Eternal Palace trash  
    Adjusted a couple timers for Phase 2 that were 2.8 seconds slow  
    Added a combat timer to Azshara engage for the window of time you have to time prepot  
    Added respawn to queens Court  
- Update alpha version and update embed  
- CN Update  
