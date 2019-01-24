#!/bin/sh
SCREENSHOT=/tmp/blurwall.png
WALLPAPER=~/wallpaper/plant-resize.png
LOCK_IMAGE=~/.config/i3/lock-icon.png

convert $WALLPAPER $LOCK_IMAGE -gravity center -composite -matte $SCREENSHOT

# Pause music
playerctl pause

# Lock it up!
i3lock \
  -e \
  -f \
  -c 000000 \
  -i $SCREENSHOT \
  -t \
  --clock \
  --timepos="960:740" \
  --time-font="DejaVu Sans Mono" \
  --timesize=42 \
  --datesize=20 \
  --radius 140 \
  --ring-width 10 \
  --veriftext="" \
  --insidevercolor=00000000 \
  --noinputtext="" \
  --insidecolor=00000000 \
  --insidewrongcolor=00000000
