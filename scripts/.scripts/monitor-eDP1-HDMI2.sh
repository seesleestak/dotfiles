# !/bin/sh
xrandr --output HDMI2 --auto --output eDP1 --auto --output HDMI1 --off
xrandr --output eDP1 --below HDMI2
i3-msg restart
