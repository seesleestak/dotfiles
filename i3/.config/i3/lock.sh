#!/bin/bash

# Take a screenshot:
SCREENSHOT=/tmp/screen.png
scrot $SCREENSHOT

# Lock image and blur type variables
LOCK_IMAGE=~/.config/i3/antergos.png
BLURTYPE="0x4"

# Create a blur on the shot:
convert $SCREENSHOT -blur $BLURTYPE $SCREENSHOT

# Find number of currently connected monitors
NUMCONNECTED=$(xrandr | grep -w connected | wc -l)

# Add the lock to the blurred image:
if [ NUMCONNECTED -eq 2 ]; then
  [[ -f $LOCK_IMAGE ]] && convert $SCREENSHOT $LOCK_IMAGE -gravity center -composite -matte $SCREENSHOT
else
  [[ -f $LOCK_IMAGE ]] && convert $SCREENSHOT $LOCK_IMAGE -gravity center -composite -matte $SCREENSHOT
fi

# Pause music (mocp and mpd):
playerctl pause

# Lock it up!
i3lock -u -e -f -c 000000 -i $SCREENSHOT
