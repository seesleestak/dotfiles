# !/bin/sh
scrot -d 1 /home/calvin/Pictures/screenshots/screenshot-$(date -u '+%Y-%m-%d-%H:%M:%S').png && notify-send 'Screenshot taken'
