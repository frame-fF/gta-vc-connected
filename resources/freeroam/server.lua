local function respawnPlayer(client)
	spawnPlayer(client, {-592.0, 670.0, 11.0}, 0, 0)
end

addEventHandler("OnPlayerJoined", function(event, client)
	respawnPlayer(client)
	fadeCamera(client, true)
end)
