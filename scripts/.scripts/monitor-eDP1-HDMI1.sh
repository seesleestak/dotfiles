#!/bin/bash
xrandr --output HDMI2 --off
xrandr --output HDMI1 --primary --auto 
xrandr --output eDP1 --auto 
xrandr --output eDP1 --below HDMI1
