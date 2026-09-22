local function respawnPlayer(client)
	spawnPlayer(client, {-362.94, 239.359, 60.654}, 0, 0)
end

addEventHandler("OnPlayerJoined", function(event, client)
	respawnPlayer(client)
	fadeCamera(client, true)
end)

addEventHandler("onPedWasted", function(event, wastedPed)
	local client = getClientFromPlayerElement(wastedPed)
	if not client then return end

	local pos = wastedPed.position
	local deathPosition = {pos.x, pos.y, pos.z}

	setTimeout(function()
		spawnPlayer(client, deathPosition, 0, 0)
		fadeCamera(client, true)
	end, 3000)
end)

addEventHandler("OnPlayerCommand", function(event, client, command, parameters)
	if command ~= "weapons" and command ~= "guns" then return end

	local tier = tonumber(parameters) or 1
	if tier < 1 or tier > 3 then
		messageClient("Usage: /weapons <1-3>", client)
		return
	end

	-- giveWeapon must run client-side (server-side ped.giveWeapon is broken in this build)
	triggerNetworkEvent("giveWeaponSet", client, tier)
	messageClient("Received weapon set " .. tier, client)
end)
