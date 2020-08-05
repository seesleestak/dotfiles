#!/usr/bin/env bash
FILE_SOURCE_PATH=$(fd -e js -E "*.test.js" -E "*.style.js" | fzf)
if [ -z $FILE_SOURCE_PATH ]; then
  exit
fi
FILE_BASENAME=$(basename $FILE_SOURCE_PATH)
EXTENSIONLESS_BASENAME=$(echo $FILE_BASENAME | cut -f1 -d'.')

# Look for test named after directory if it's the index
if [ "$FILE_BASENAME" == "index.js" ]; then
  FILE_SOURCE_DIRNAME=$(dirname $FILE_SOURCE_PATH)
  TEST_FILE=$(fd --full-path "$FILE_SOURCE_DIRNAME/${FILE_SOURCE_DIRNAME##*/}.test.js")
else
  TEST_FILE=$(fd $EXTENSIONLESS_BASENAME -e 'test.js' --max-results 1)
fi

# If the test can't be found, provide a search prompt
if [ -z $TEST_FILE ]; then
  echo -n "Search for test file? (y/n) "
  read
  if [ "$REPLY" == "y" ]; then
    TEST_FILE=$(fd -e "test.js" -E "*.style.js" | fzf)
  else
    echo "Exiting..."
    exit
  fi
fi

if [ -z $TEST_FILE ]; then
  echo "No test file found, exiting..."
  exit
fi

echo "Test file found. Running..."
npx jest $TEST_FILE --watch --coverage --collectCoverageFrom $FILE_SOURCE_PATH
