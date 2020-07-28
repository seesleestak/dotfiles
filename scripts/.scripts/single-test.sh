#!/usr/bin/env bash
FILE_SOURCE_PATH=$(fd -e js -E "*.test.js" -E "*.style.js" | fzf)
FILE_SOURCE_NAME=$(echo $FILE_SOURCE_PATH | cut -f1 -d'.')

TEST_FILE=$(fd $FILE_SOURCE_NAME -e "test.js" --max-results 1)

# Look for test named after directory if it's the index
if [ -z $TEST_FILE ] && [ "$(basename $FILE_SOURCE_PATH)" == "index.js" ]; then
  FILE_SOURCE_DIRNAME=$(dirname $FILE_SOURCE_PATH)
  TEST_FILE=$(fd --full-path "$FILE_SOURCE_DIRNAME/${FILE_SOURCE_DIRNAME##*/}.test.js")
fi

if [ -z $TEST_FILE ]; then
  echo -n "Search for test file? (y/n) "
  read
  if [ "$REPLY" == "y" ]; then
    TEST_FILE=$(fd -e "test.js" -E "*.style.js" | fzf)
  else
    echo "Exiting..."
  fi
fi

if [ -z $TEST_FILE ]; then
  echo "No test file found, exiting..."
  exit
fi

npx jest $TEST_FILE --watch --coverage --collectCoverageFrom $FILE_SOURCE_PATH
