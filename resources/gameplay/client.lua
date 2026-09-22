-- weapon id, ammo, setAsCurrent (ids per GTA III weapon list)
local weaponSets = {
	[1] = { -- Weapon Set 1
		{1, 1, false},   -- Bat
		{2, 100, true},  -- Pistol
		{4, 50, false},  -- Shotgun
	},
	[2] = { -- Weapon Set 2
		{3, 200, true},  -- Uzi
		{5, 300, false}, -- AK47
		{10, 10, false}, -- Molotov
	},
	[3] = { -- Weapon Set 3
		{6, 300, true},  -- M16
		{7, 50, false},  -- Sniper Rifle
		{8, 10, false},  -- Rocket Launcher
		{9, 100, false}, -- Flamethrower
	},
}

addNetworkHandler("giveWeaponSet", function(tier)
	local set = weaponSets[tier]
	if not set then return end

	for _, weapon in ipairs(set) do
		localPlayer:giveWeapon(weapon[1], weapon[2], weapon[3])
	end
end)
