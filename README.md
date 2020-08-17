# gmod_alerts
Simple player alert system.

Run the alertall command with the time and message arguments to have a large message appear on every player's screen.

# Commands
Time is in seconds.
alertall [time] "Message" - Send an alert to every player on the server (client side console only, must be superadmin)
closealerts - Run this command to force any active alerts to close.
lua_run sendAlert([time], "Message") - Run this if you want to send alerts from the server side console.

# Contributing
I know my code is bad, so instead of talking shit how about you contribute. Submit a pull request!

#Support
Contact me on discord: romtec#6969
