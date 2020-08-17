
net.Receive("sendPlyAlert", function()
	local time = net.ReadInt(10)
	local msg = net.ReadString()
	surface.PlaySound("buttons/button2.wav")
	alertOpenGUI(time, msg)
end)



function alertOpenGUI(time, msg)
	timer.Simple(time, function() alertCloseGUI() end)
	alertActive = true
	hook.Add("HUDPaint", 'AlertNotice', function()
		if alertActive == true then
			surface.SetDrawColor( 0, 0, 255, 200 )

			local midx = (ScrW()/2)
			local midy = (ScrH()/2)
			surface.DrawRect( 0, midy-50, ScrW(), 100 )
			draw.SimpleText(msg, "DermaLarge", midx, midy, whit, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end)
end

function alertCloseGUI()
	alertActive = false
end


concommand.Add("alert_help", function(ply, cmd, args)
    MsgC(Color(0,130,255),"-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n")
    MsgC(Color(255,255,255),"                Alerts by romtec123\n")
    MsgC(Color(0,130,255),"-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n")
    MsgC(Color(255,0,0),"All commands are admin only!\n\n")
    MsgC(Color(0,255,0),[[alertall <time in seconds> "<Message>"]],Color(255,255,255)," - Sends an alert to all players. Make sure the message is in quotes! \n\n")
    MsgC(Color(255,0,0),"The alertall command does not work in the server side console! Use the next comamnd to use server-side. \n\n")
    MsgC(Color(0,255,0),[[lua_run sendAlert(<time in seconds>, "<Message>")]],Color(255,255,255)," - Run this command to send an alert from the server side console. \n\n")
    MsgC(Color(0,255,0),[[closealerts]],Color(255,255,255)," - Run this command to force any active alerts to close. \n")
    MsgC(Color(0,130,255),"-------------------------------------------------------------\n")
end)

concommand.Add("closealerts", function(ply, cmd)
	ply:PrintMessage(HUD_PRINTCONSOLE, "Closing active alerts.\n")
	alertCloseGUI()
end)
