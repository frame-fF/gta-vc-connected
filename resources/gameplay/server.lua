local function respawnPlayer(client)
	spawnPlayer(client, {-592.0, 670.0, 11.0}, 0, 0)
end

addEventHandler("OnPlayerJoined", function(event, client)
	respawnPlayer(client)
	fadeCamera(client, true)
end)

addEventHandler("onPedWasted", function(event, wastedPed)
	local pos = wastedPed.position
	local deathPosition = {pos.x, pos.y, pos.z}

	setTimeout(function()
		spawnPlayer(wastedPed, deathPosition, 0, 0)
		fadeCamera(wastedPed, true)
	end, 3000)
end)
