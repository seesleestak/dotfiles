# !/bin/bash
FILE_NAME=screen-record-$(date -u '+%Y-%m-%d-%H-%M-%S').mp4
SLOP=$(slop -f "%x %y %w %h %g %i") || exit 1
read -r X Y W H G ID <<< $SLOP

ffmpeg -f x11grab \
  -s "$W"x"$H" \
  -i :0.0+$X,$Y \
  -framerate 60 \
  /home/calvin/Videos/screen-record/${FILE_NAME}
