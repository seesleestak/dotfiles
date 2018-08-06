# !/bin/sh
FILE_NAME=clip-$(date -u '+%Y-%m-%d-%H:%M:%S').png
SLOP=$(slop -f "%g") || exit 1
import -window root -crop $SLOP /home/calvin/Pictures/screenshots/${FILE_NAME} && notify-send 'Screenshot taken'
