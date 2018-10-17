# !/bin/sh
xrandr --output eDP1 --off
xrandr --output HDMI1 --auto --output HDMI2 --auto
xrandr --output HDMI2 --right-of HDMI1
i3-msg restart
