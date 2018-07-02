# !/bin/sh
FILE_NAME=clip-$(date -u '+%Y-%m-%d-%H:%M:%S').png
import $FILE_NAME && mv $FILE_NAME /home/calvin/Pictures/screenshots && notify-send 'Screenshot taken'
