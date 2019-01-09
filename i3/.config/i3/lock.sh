#!/bin/bash
LOCK_IMAGE=~/.config/i3/screen.png

# Pause music (mocp and mpd):
playerctl pause

# Lock it up!
i3lock -u -e -f -c 000000 -i $LOCK_IMAGE -t
