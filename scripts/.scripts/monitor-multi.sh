# !/bin/sh
xrandr --output HDMI1 --off
xrandr --output LVDS1 --auto --output VGA1 --auto
xrandr --output LVDS1 --below VGA1
xrandr --output VGA1 --primary

i3-msg restart
