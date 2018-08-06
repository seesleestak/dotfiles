# !/bin/sh

# Kill all commonly used apps
killall slack
killall chrome
killall spotify
killall urxvt
killall telegram-desktop
killall libreoffice
killall gpicview

# Go to first workspace
i3-msg workspace "1"
