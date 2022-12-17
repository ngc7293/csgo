#!/bin/bash

if [[ -z "$STEAM_TOKEN" ]]; then
    export STEAM_TOKEN="+sv_setsteamaccount $STEAM_TOKEN";
else
    export STEAM_TOKEN=""
fi

/home/steam/csgo/srcds_run -console -game csgo -usercon +game_type 0 +game_mode 0 +mapgroup mg_dust +map de_dust2 $STEAM_TOKEN -autoupdate -port 27015