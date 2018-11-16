# !/bin/sh

# Kill all commonly used apps
killall -g chrome
killall -g spotify
killall -g urxvt
killall -g telegram-desktop
killall -g libreoffice

# Go to first workspace
i3-msg workspace "1"
