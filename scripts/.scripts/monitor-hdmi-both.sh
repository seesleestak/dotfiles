#!/bin/bash
xrandr --output eDP1 --off
xrandr --output HDMI1 --primary --auto 
xrandr --output HDMI2 --auto
xrandr --output HDMI2 --right-of HDMI1
