#!/bin/sh
xrandr --output DVI-D-0 --off --output HDMI-0 --mode 3840x2160 --pos 0x0 --rotate normal --output DP-0 --mode 3840x2160 --pos 3840x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --mode 2560x1440 --pos 7680x720 --rotate normal --output DP-5 --off

# Fix screen tearing.
nvidia-settings --assign CurrentMetaMode="\
    HDMI-0: nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }, \
    DP-0: nvidia-auto-select +3840+0 { ForceFullCompositionPipeline = On }, \
    DP-4: nvidia-auto-select +7680+0 { ForceFullCompositionPipeline = On }"

# Randomly fetch a wallpaper from ~/Pictures/Wallpapers and set it.
WALLPAPER_PATH="$(find -L ~/Pictures/Wallpapers -type f,l | shuf -n 1)"
feh --bg-scale "$WALLPAPER_PATH"

