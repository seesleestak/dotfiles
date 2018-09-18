# !/bin/sh
CURRENT_DIR=$(pwd)
SOURCE_FILES=()

for i in $CURRENT_DIR/*; do
  if [[ $i == *.cpp ]]; then
    SOURCE_FILES=("${SOURCE_FILES[@]}" "$i")
  fi
done

# Compile source files and run
g++ -o prog ${SOURCE_FILES[@]} && ./prog
