#WIFI_SSID="RGIPT_WLAN"
#nmcli dev wifi connect "$WIFI_SSID"
#sleep 5
#LOGIN_URL="http://192.168.100.1:8090/"
#username="22mc3042"
#password="pss@123"

#firefox "$LOGIN_URL" &
#this will open the browser 

#sleep 1 

#xdotool search --sync --onlyvisible --class "firefox" windowactivate

#sleep 1

#xdotool key Tab

#sleep 1
#xdotool type "$username"

#xdotool key Tab

#sleep 1

#xdotool type "$password"

#xdotool key Return


# NEW         SCRIPT      HELOOOOOOOOOO


#!/bin/bash
WIFI_SSID="RGIPT_WLAN"
LOGIN_URL="http://192.168.100.1:8090/"
username="22mc3042"
password="pss@123"

while true; do
    CONNECTION_STATUS=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | grep -w "$WIFI_SSID")

    if [ -z "$CONNECTION_STATUS" ]; then
        echo "Not connected to $WIFI_SSID. Attempting to connect..."
        nmcli dev wifi connect "$WIFI_SSID"
        sleep 5
    else
        echo "Already connected to $WIFI_SSID."
    fi

    if ! ping -c 1 -W 2 google.com >/dev/null; then
        echo "Not logged in. Attempting to log in..."
        
        firefox "$LOGIN_URL" &
        sleep 5
        
        xdotool search --sync --onlyvisible --class "firefox" windowactivate
        sleep 1
        
        xdotool key Tab
        sleep 1
        
        xdotool type "$username"
        xdotool key Tab
        sleep 1
        
        xdotool type "$password"
        xdotool key Return
        
        sleep 5
        
        pkill firefox
    else
        echo "Already logged in."
    fi

    sleep 1200000
done
     
