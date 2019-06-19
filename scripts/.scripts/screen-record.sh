#!/bin/bash
FILE_NAME=screen-record-$(date -u '+%Y-%m-%d-%H-%M-%S')
BASE_PATH=/home/calvin/Videos/screen-record
mkdir -p $BASE_PATH

SLOP=$(slop -f "%x %y %w %h") || exit 1
read -r X Y W H <<< $SLOP

echo "X: $X"
echo "Y: $Y"
echo "W: $W"
echo "H: $H"

function mp4Screengrab {
  # https://stackoverflow.com/questions/20847674/ffmpeg-libx264-height-not-divisible-by-2
  ffmpeg -f x11grab \
    -s "$W"x"$H" \
    -i :0.0+$X,$Y \
    -vcodec h264 \
    -pix_fmt yuv420p \
    -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" \
    ${BASE_PATH}/${FILE_NAME}.mp4
}

function convertToGif {
  notify-send 'Screen capture' 'Converting to gif...'
  mp4-to-gif.sh ${BASE_PATH}/${FILE_NAME}.mp4
  mv ${BASE_PATH}/${FILE_NAME}.gif ${BASE_PATH}/gif/${FILE_NAME}.gif
  notify-send 'Screen capture' 'Complete'
}

case $1 in
  -g|--gif)
    mp4Screengrab
    convertToGif
    ;;
  *)
    mp4Screengrab
    ;;
esac
