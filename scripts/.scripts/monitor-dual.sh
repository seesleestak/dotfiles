# !/bin/sh
xrandr --output eDP1 --auto --output HDMI1 --auto
xrandr --output eDP1 --below HDMI1
xrandr --output HDMI1 --primary

i3-msg restart
