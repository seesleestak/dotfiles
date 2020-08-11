#!/usr/local/bin/bash
# Requires bash version that handles color codes
SEARCH_COMMAND_FZF="fzf --height 25% --layout=reverse --border"
FILE_SOURCE_PATH=$(fd -e js -E "*.test.js" -E "*.style.js" | $SEARCH_COMMAND_FZF)
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
    TEST_FILE=$(fd -e "test.js" -E "*.style.js" | $SEARCH_COMMAND_FZF)
  else
    echo "Exiting..."
    exit
  fi
fi

if [ -z $TEST_FILE ]; then
  echo "No test file found, exiting..."
  exit
fi

echo -e "Test file found: \e[32m$TEST_FILE\e[0m"
echo "Running..."
npx jest $TEST_FILE --watch --coverage --collectCoverageFrom $FILE_SOURCE_PATH
