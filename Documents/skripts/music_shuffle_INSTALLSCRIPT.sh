#!/bin/bash 
pipewire 
sleep 1 
pactl set-sink-volume @DEFAULT_SINK@ 100% 
mpv /mnt/Game_Disk/music_flacs/ -shuffle --no-video --audio-device=pipewire/alsa_output.pci-0000_00_1f.3.analog-stereo
