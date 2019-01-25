#!/bin/sh
# SCREENSHOT=/tmp/blurwall.png
# WALLPAPER=~/wallpaper/plant-resize.png
LOCK_IMAGE=~/.config/i3/lock-image.png

# convert $WALLPAPER $LOCK_IMAGE -gravity center -composite -matte $SCREENSHOT

# Pause music
playerctl pause

# Lock it up!
i3lock \
  -e \
  -f \
  -c 000000 \
  -i $LOCK_IMAGE \
  -t \
  --clock \
  --timepos="ix:iy+210" \
  --timestr="%I:%M:%S %p" \
  --time-font="Roboto" \
  --timesize=42 \
  --timecolor=E5E9F0FF \
  --datesize=24 \
  --datecolor=4C566AFF \
  --date-font="Roboto" \
  --radius 135 \
  --ring-width 10 \
  --veriftext="" \
  --insidevercolor=00000000 \
  --noinputtext="" \
  --wrongtext="incorrect" \
  --insidecolor=00000000 \
  --insidewrongcolor=00000000
