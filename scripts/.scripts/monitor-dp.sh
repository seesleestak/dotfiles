# !/bin/sh
xrandr --output HDMI1 --dpi 96
xrandr --output HDMI1 --auto --output eDP1 --off && i3-msg restart
