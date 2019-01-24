#!/bin/sh
SCREENSHOT=/tmp/blurwall.png
WALLPAPER=~/wallpaper/plant-resize.png
LOCK_IMAGE=~/.config/i3/lock-icon.png

convert $WALLPAPER $LOCK_IMAGE -gravity center -composite -matte $SCREENSHOT

# Pause music
playerctl pause

# Lock it up!
i3lock -e -f -c 000000 -i $SCREENSHOT -t
