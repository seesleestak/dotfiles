# !/bin/sh
xrandr --output eDP1 --dpi 124
xrandr --output HDMI1 --off --output eDP1 --auto && i3-msg restart
