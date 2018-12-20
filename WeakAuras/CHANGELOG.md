# [2.10.11](https://github.com/WeakAuras/WeakAuras2/tree/2.10.11) (2018-12-18)

[Full Changelog](https://github.com/WeakAuras/WeakAuras2/compare/2.10.10...2.10.11)

## Highlights

 Bugfixes! 

## Commits

InfusOnWoW (8):

- Rewrite mount check for Status/Conditions trigger
- Fix smooth progress bar behaviour with inverse
- Make Dynamic Groups Hybrid Checkboxes single column again
- Fix SetRegion hiding groups
- Remove the chat filterFunc for guild chat
- Print a error message on trying to share a aura via guild chat
- Remove SetWidth workarounds for texts
- Fix isStealable check for BuffTrigger 2

emptyrivers (3):

- Teach SetRegion to create regions initially hidden
- remove duplicated function
- guarantee uid on all auras

mrbuds (11):

- make RefreshGroupUpdateIcon iterate only on its children
- template: fix aura active = glow when trigger use Show On = Aura Found
- BuffTrigger2 "ownOnly" also match pet as source
- fix Call Lightning template
- Icon region: use cooldownSwipe for spells with charges
- fix migration error
- match companion data with uid instead of url moved update matching to HasUpdate()
- check that WeakAurasCompanion is loaded before RefreshGroupUpdateIcon
- add skipWagoUpdate & ignoreWagoUpdate to WeakAuras.internal_fields
- move version from wago url to it's own field and bump internalVersion
- add an indicator on Groups to show if there is an update from Wago in his childs

