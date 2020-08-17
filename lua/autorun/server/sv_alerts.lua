util.AddNetworkString("sendPlyAlert")

function sendAlert(time, msg)
	net.Start("sendPlyAlert")
		net.WriteInt(time, 10)
		net.WriteString(msg)
	net.Broadcast()
end


concommand.Add("alertall", function(ply, cmd, args)
	if not ply:IsSuperAdmin() then return end
	if args[1] == nil or args[2] == nil then ply:PrintMessage(HUD_PRINTCONSOLE, [[There is an issue with your syntax! Make sure to follow this format: alertall <seconds> "<text>"]]) return end
	ply:PrintMessage(HUD_PRINTCONSOLE, "Sending alert '"  .. args[2] .. "' for " .. args[1] .. " seconds.")
	print(ply:Nick() .. " sent alert '"  .. args[2] .. "' for " .. args[1] .. " seconds.")
	sendAlert(args[1], args[2])
end)
