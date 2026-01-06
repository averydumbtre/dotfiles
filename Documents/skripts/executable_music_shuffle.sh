#!/bin/bash
pipewire
sleep 1
wpctl set-volume @DEFAULT_SINK@ 0.35
mpv /mnt/0df76e2c-45d5-44d2-ad7e-91488ebcafba/music-flac/ -shuffle --no-video --af=lavfi=[loudnorm=i=-16.0:lra=5.0:tp=-1.0] --audio-device=pipewire/alsa_output.pci-0000_00_1f.3.analog-stereo --volume=69
