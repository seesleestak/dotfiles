# !/bin/sh
xrandr --output eDP1 --auto --output HDMI1 --scale 1.25x1.25
xrandr --output eDP1 --below HDMI
xrandr --output HDMI1 --primary

i3-msg restart
