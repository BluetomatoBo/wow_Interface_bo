# Deadly Boss Mods Core

## [8.2.21](https://github.com/DeadlyBossMods/DeadlyBossMods/tree/8.2.21) (2019-09-25)
[Full Changelog](https://github.com/DeadlyBossMods/DeadlyBossMods/compare/8.2.20...8.2.21)

- Bump version and prepare a new tag, with the yew SendChatMessage restrictions in place  
- Prune all forms of chat yells from outdoor world bosses, no longer permitted in 8.2.5  
    Added protection to core to prevent non updated mods from throwing errors as well.  
    Fixed status whisper not replying to bnet friends who send a battle.net whisper.  
- Fix to last  
- Added C\_BattleNet to luacheck  
    Refactored all of the bnet stuff in dbm-core to use 8.2.5 methods (this makes me ever grateful that I chose to have classic and retail use diff forks, because the compat code to support this kind of api fragmentation between classic and retail in a single core, would be UGLY)  
