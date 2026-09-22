## Project

GTA Connected server (`Server.exe` + `server.xml`), currently configured for `gta:iii` (`<game>` in
[server.xml](server.xml)). Resources live under `resources/<name>/` with a `meta.xml` registering
`server.lua` (type="server") and/or `client.lua` (type="client"). Only resources listed in
`server.xml`'s `<resources>` block actually load.

## Working conventions

- Verify GTA Connected scripting API facts (function signatures, event args, server vs. client
  availability) via the `gtaconnected-wiki` MCP first. Do not guess — this engine's behavior diverges
  from MTA/SA-MP in ways training data gets wrong.
- **Method calls need colon syntax, not dot.** `obj:method(...)`, never `obj.method(...)` — dot-call
  drops the native `self`/`this` binding. This silently no-ops on the client and throws
  `'this' is null` on the server. Plain functions (`spawnPlayer`, `fadeCamera`, `messageClient`,
  `triggerNetworkEvent`, `setTimeout`, ...) are unaffected — only `obj:method()`-style calls need this.
- **`ped.giveWeapon` (and likely other ped-mutating methods) don't work server-side** in this build.
  Do it client-side: server calls `triggerNetworkEvent(name, client, ...)`, the client's
  `addNetworkHandler` does `localPlayer:giveWeapon(...)`. See `resources/gameplay/client.lua`.
- **`onPedWasted` hands you a `Player`/`Ped`, not a `Client`.** Functions like `spawnPlayer` want a
  `Client`. Convert with `getClientFromPlayerElement(ped)`.
- Timers are `setTimeout(fn, ms)` (JS-style), not MTA's `setTimer`.
- Weapon IDs and spawn coordinates are game-specific (III vs VC vs SA use different tables/maps) —
  don't reuse one game's IDs/coords when switching `<game>` in server.xml.
