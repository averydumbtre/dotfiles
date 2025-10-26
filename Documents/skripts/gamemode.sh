#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:inactive_opacity 1;\
        keyword cursor:use_cpu_buffer 0;\
        keyword cursor:no_hardware_cursors true;\
        keyword render:direct_scanout true;\
        keyword monitor DP-2, 1920x1080@60, 20000x0, 1.0;\
        keyword plugin:dynamic-cursors:enabled false;\
        keyword decoration:rounding 0"
    pkill hyprpaper
    exit
fi
hyprctl reload
hyprpaper
