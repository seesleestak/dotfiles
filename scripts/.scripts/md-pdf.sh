pandoc --variable mainfont:"DejaVu Sans Mono" --variable fontsize:"20pt" --pdf-engine xelatex $1 -o $(echo $1 | cut -d '.' -f 1).pdf
