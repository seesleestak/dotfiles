# !/bin/sh
xrandr --output HDMI1 --off
xrandr --output HDMI2 --primary --auto
xrandr --output eDP1 --auto
xrandr --output eDP1 --below HDMI2
i3-msg restart
