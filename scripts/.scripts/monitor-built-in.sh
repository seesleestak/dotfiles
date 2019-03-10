#!/bin/bash
xrandr --output HDMI1 --off --output HDMI2 --off --output eDP1 --auto && i3-msg restart
