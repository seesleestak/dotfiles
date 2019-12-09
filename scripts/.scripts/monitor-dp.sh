#!/bin/bash
xrandr --output HDMI1 --auto --output eDP1 --off --output HDMI2 --off
i3-msg restart
