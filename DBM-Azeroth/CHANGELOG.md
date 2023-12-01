# <DBM Mod> Azeroth (Classic)

## [1.15.1](https://github.com/DeadlyBossMods/DBM-Classic/tree/1.15.1) (2023-11-30)
[Full Changelog](https://github.com/DeadlyBossMods/DBM-Classic/compare/1.15.0...1.15.1) [Previous Releases](https://github.com/DeadlyBossMods/DBM-Classic/releases)

- Prep classic era tag  
- Remove bad language on dispel alerts. most dispels aren't spellstealable and it's misleading  
- Fix invald stats type  
- Drycode some obvious boss warnings. many will require just seeing bosses as finding the remaining spells is not worth effort (over 1100 new spells in 1.15.0, faster to just wait til tomorrow)  
- Support Season of Discovery instance difficulty Ids  
- Fully template the SoD BFD raid, complete with creature IDs and encounter Ids for working combat detection  
- set EnableMouse on parent frame, to allow clickthrough.  
- Revert CheckBossDistance check to using Item apis on bosses again, with blizzard reverting nerf on hostile targets for this purpose. (range check still dead, distance on players still forbidden). This is just a concession blizzard agreed was a reasonable one.  
- Actually check vulnerability on emote, instead of only on engage then never again because emote was never registered. Closes https://github.com/DeadlyBossMods/DBM-Classic/issues/776  
- use correct spellid for plague in AQ40, Closes https://github.com/DeadlyBossMods/DBM-Classic/issues/777  
- Remove unused localization Re-add some that was missing though  
- Fix a bug where wrong language was in mx file for AQ20  
- Since it's early tier, will be updating the version check more often for checking if other raiders mods are out of date.  
- bump alpha  
- Prep new tag, time to push out more bug fixes before reset  
- Update commonlocal.ru.lua (#318)  
- Update localization.ru.lua (#319)  
- Change default core behavior for pulling timer locals to make the short text disable work better. It shouldn't break anything, but if it does it'll be fixed case by case.  
- no code changes, just notes  
- bump alpha  
- prep new tag to fix another breaking fyrak bug  
- rebump alpha  
- prep to remake 10.2.6 tag  
- bump alpha  
- prep new tag with last few days of fixes/updates  
- begin templating new dungeon difficulty type (follower). still some stats support to finalize  
- Slim out checkboss distance to just be a direct forwarder and nothing more.  
- Update commonlocal.tw.lua (#317)  
- Update koKR (#316)  
- Update localization.tw.lua (#315)  
- add CL  
- Language fixes/clarification  
- fix bug causing range to be reverse in all modes  
- Partially restore range frame for classic only in instances and outside instances even let retail use the radar.  
- Update koKR (#313)  
- Remove nearby alerrts from vanilla and tbc raids  
- Massively clean up range API to leave just the bare minimum that's still useful and fix usefulness of what's left somewhat to at least be able to check if within 43 or not and still work completely outdoors  
- Bump alpha  
- Prep new tag  
- Seventh pass on killing range frame and distance calculation apis, may have missed some. Full deletion will occure later but right now way way too many modules directly call these apis so right now they're hacked to just return non erroring values. Modules will need hand review to remove features that no longer make sense like warning if something is near you.  
- bump alphas  
