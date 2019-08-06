#!/bin/bash
scrot $HOME/Pictures/screenshots/screenshot-$(date -u '+%Y-%m-%d-%H:%M:%S').png && notify-send 'Screenshot taken'
