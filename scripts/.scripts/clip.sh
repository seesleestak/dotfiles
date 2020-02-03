#!/bin/bash
FILE_NAME=clip-$(date -u '+%Y-%m-%d-%H:%M:%S').png
SLOP=$(slop -f "%g") || exit 1
import -window root -crop $SLOP "$HOME/Pictures/screenshots/$FILE_NAME"
