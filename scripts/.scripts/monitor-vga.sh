#!/bin/bash
xrandr --output HDMI1 --off --output LVDS1 --off --output VGA1 --auto && i3-msg restart
