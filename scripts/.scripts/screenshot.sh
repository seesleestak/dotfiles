# !/bin/sh
scrot -d 1 screenshot-$(date -u '+%Y-%m-%d-%H:%M:%S').png && notify-send 'Screenshot taken'
