#!/bin/bash
xrandr --output HDMI2 --off
xrandr --output HDMI1 --off
xrandr --output eDP1 --auto 
i3-msg restart
