# !/bin/sh
function compile_run() {
  files=$1

  # Logging
  echo -e "\033[1;33mCompiling:\033[0m"
  for k in ${files[@]}; do
    echo $k
  done
  echo "============================================="

  # Compile source files and run
  g++ -o prog ${files[@]} && ./prog
}

function find_files() {
  SOURCE_FILES=()
  # Loop over files in current directory and push to array
  for i in $(pwd)/*; do
    if [[ $i == *.cpp ]]; then
      SOURCE_FILES=("${SOURCE_FILES[@]}" "$i")
    fi
  done
}

# Run once before the inotifywait loop
find_files
compile_run "$SOURCE_FILES"

# Taken from https://exyr.org/2011/inotify-run/
while inotifywait -qre close_write --format "" .
do
  find_files
  compile_run "$SOURCE_FILES"
done

