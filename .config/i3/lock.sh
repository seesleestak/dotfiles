#!/bin/bash

# Take a screenshot:
SCREENSHOT=/tmp/screen.png
scrot $SCREENSHOT

# Lock image and blur type variables
LOCK_IMAGE=~/.config/i3/lock.png
BLURTYPE="0x4"

# Create a blur on the shot:
convert $SCREENSHOT -blur $BLURTYPE $SCREENSHOT

# Add the lock to the blurred image:
[[ -f ~/.config/i3/lock.png ]] && convert $SCREENSHOT $LOCK_IMAGE -gravity center -composite -matte $SCREENSHOT

# Pause music (mocp and mpd):
playerctl pause

# Lock it up!
i3lock -e -f -c 000000 -i $SCREENSHOT
