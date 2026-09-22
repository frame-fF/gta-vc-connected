-- weapon id, ammo, setAsCurrent (ids per GTA VC weapon list)
local weaponSets = {
	[1] = { -- Weapon Set 1
		{1, 1, false},    -- Brass Knuckle
		{2, 1, false},    -- Screwdriver
		{17, 100, true},  -- Colt 45
		{19, 50, false},  -- Chrome Shotgun
		{23, 200, false}, -- Uzi 9mm
		{15, 10, false},  -- Molotov
	},
	[2] = { -- Weapon Set 2
		{5, 1, false},    -- Knife
		{18, 100, true},  -- Python .357
		{20, 50, false},  -- Spaz Shotgun
		{22, 200, false}, -- Tec-9
		{25, 200, false}, -- MP5
		{12, 10, false},  -- Grenade
	},
	[3] = { -- Weapon Set 3
		{11, 1, false},   -- Chainsaw
		{10, 1, false},   -- Katana
		{26, 300, true},  -- M4
		{27, 300, false}, -- Ruger
		{28, 50, false},  -- Sniper Rifle
		{30, 10, false},  -- Rocket Launcher
		{31, 100, false}, -- Flame Thrower
		{33, 500, false}, -- Minigun
	},
}

addNetworkHandler("giveWeaponSet", function(tier)
	local set = weaponSets[tier]
	if not set then return end

	for _, weapon in ipairs(set) do
		localPlayer.giveWeapon(weapon[1], weapon[2], weapon[3])
	end
end)
