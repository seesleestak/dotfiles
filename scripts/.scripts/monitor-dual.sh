# !/bin/sh
xrandr --output eDP1 --below HDMI1
xrandr --output HDMI1 --auto --output eDP1 --auto

i3-msg restart
