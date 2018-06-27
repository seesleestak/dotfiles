# !/bin/sh

# Kill all commonly used programs
killall slack
killall chromium
killall spotify
killall urxvt
killall telegram-desktop
killall libreoffice

# Go to first workspace
i3-msg workspace "1"
