# !/bin/sh
xrandr --output HDMI1 --auto --output eDP1 --auto
xrandr --output eDP1 --below HDMI1
i3-msg restart
