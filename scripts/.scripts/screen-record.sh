# !/bin/bash
FILE_NAME=screen-record-$(date -u '+%Y-%m-%d-%H-%M-%S').mp4
SLOP=$(slop -f "%x %y %w %h") || exit 1
read -r X Y W H <<< $SLOP

echo "X: $X"
echo "Y: $Y"
echo "W: $W"
echo "H: $H"

# https://stackoverflow.com/questions/20847674/ffmpeg-libx264-height-not-divisible-by-2
ffmpeg -f x11grab \
  -s "$W"x"$H" \
  -i :0.0+$X,$Y \
  -vcodec h264 \
  -pix_fmt yuv420p \
  -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" \
  /home/calvin/Videos/screen-record/${FILE_NAME}
