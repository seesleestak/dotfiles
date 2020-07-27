#!/usr/bin/env bash
FILE_TEST_PATH=$(fd -e js -E "*.test.js" -E "*.style.js" | fzf)
FILE_TEST_NAME=$(basename $FILE_TEST_PATH | cut -f1 -d'.')
TEST_FILE=$(fd $FILE_TEST_NAME -e "test.js" --max-results 1)

if [ -z $TEST_FILE ]; then
  echo "No test file found"
  exit
fi

npx jest $TEST_FILE --watch --coverage --collectCoverageFrom $FILE_TEST_PATH
