# !/bin/sh
SOURCE_FILES=()

# Loop over files in current directory and push to array
for i in $(pwd)/*; do
  if [[ $i == *.cpp ]]; then
    SOURCE_FILES=("${SOURCE_FILES[@]}" "$i")
  fi
done

# Logging
echo "Compiling:"
for k in ${SOURCE_FILES[@]}; do
  echo $k
done
echo "============================================="
printf "\n"

# Compile source files and run
g++ -o prog ${SOURCE_FILES[@]} && ./prog
