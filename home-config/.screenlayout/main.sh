#!/bin/sh
xrandr --output DVI-D-0 --off --output HDMI-0 --mode 2560x1440 --pos 0x360 --rotate normal --output DP-0 --mode 3840x2160 --pos 2560x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --mode 3840x2160 --pos 6400x0 --rotate normal --output DP-5 --off

# Fix screen tearing.
nvidia-settings --assign CurrentMetaMode="\
    HDMI-0: nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }, \
    DP-0: nvidia-auto-select +2560+0 { ForceFullCompositionPipeline = On }, \
    DP-4: nvidia-auto-select +6400+0 { ForceFullCompositionPipeline = On }"

feh --bg-scale ~/Pictures/_wallpaper.png

