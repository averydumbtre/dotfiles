#!/bin/bash

if systemctl --user status plasma-plasmashell | grep -q -i dead; then
systemctl --user start --now plasma-plasmashell

else
    systemctl --user stop --now plasma-plasmashell

fi
echo cum
