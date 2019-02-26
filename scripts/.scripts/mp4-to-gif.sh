# !/bin/sh
EXTENSIONLESS=$(echo $1 | cut -d\. -f1)

ffmpeg -y \
  -i $1 \
  -vf fps=10,scale=1000:-1:flags=lanczos,palettegen palette.png

ffmpeg -y -i $1 -i palette.png -filter_complex \
  "fps=10,scale=1000:-1:flags=lanczos[x];[x][1:v]paletteuse" ${EXTENSIONLESS}.gif

rm palette.png
