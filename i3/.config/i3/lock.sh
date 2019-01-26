#!/bin/sh
# SCREENSHOT=/tmp/blurwall.png
# WALLPAPER=~/wallpaper/plant-resize.png
LOCK_IMAGE=~/.config/i3/lock-image.png

# convert $WALLPAPER $LOCK_IMAGE -gravity center -composite -matte $SCREENSHOT

# Pause music
playerctl pause

# Colors
BLACK="000000FF"
BLUE="5E81ACFF"
CYAN="8FBCBBFF"
DARK="2E3440FF"
GREEN="A3BE8CFF"
RED="BF616AFF"
TEAL="88C0D0FF"
WHITE="FFFFFFFF"
MUTED="FFFFFF7F"
TRANSPARENT="00000000"

# Lock it up!
i3lock \
  -e \
  -c 000000 \
  -t \
  --clock \
  --timestr="%I:%M:%S %p" \
  --time-font="Roboto" \
  --timesize=68 \
  --timecolor=$WHITE \
  --datesize=36 \
  --datepos="tx:ty+40" \
  --datecolor=$MUTED \
  --date-font="Roboto" \
  --radius 230 \
  --ring-width 10 \
  --ringcolor=$MUTED \
  --ringvercolor=$TEAL \
  --ringwrongcolor=$RED \
  --veriftext="" \
  --insidevercolor=$TRANSPARENT \
  --noinputtext="" \
  --wrongtext="incorrect" \
  --insidecolor=$TRANSPARENT \
  --insidewrongcolor=$TRANSPARENT \
  --keyhlcolor=$WHITE \
  --bshlcolor=$WHITE \
  --line-uses-inside
