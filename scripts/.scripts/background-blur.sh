#!/bin/bash
# vim:ts=4:sw=4:expandtab
set -eu

xprop -spy -root _NET_ACTIVE_WINDOW | while read -r line; do
    focused=$(echo "${line}" | awk -F' ' '{print $NF}')

    if test "${focused}" = "0x0"; then
        feh --bg-fill /home/calvin/curr-wallpaper/rossi-qatar.jpg
    else
        feh --bg-fill /home/calvin/curr-wallpaper/rossi-qatar-blur.jpg
    fi
done
