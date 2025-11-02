#!/bin/bash
pipewire
sleep 1
pactl set-sink-volume @DEFAULT_SINK@ 100%
mpv /mnt/0df76e2c-45d5-44d2-ad7e-91488ebcafba/music-flac/ -shuffle --no-video --audio-device=pipewire/alsa_output.pci-0000_00_1f.3.analog-stereo
