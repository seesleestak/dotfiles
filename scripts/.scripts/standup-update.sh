#!/usr/bin/env bash
DOC_PATH="$HOME/log/standup.md"
CURR_DATE=$(date "+%a %m-%d-%Y")
GREP_RES=$(grep "$CURR_DATE" $DOC_PATH)
if [ -z "$GREP_RES" ]; then
  echo -e "\n# $CURR_DATE\n- <"'!'"-- Content -->" >> $DOC_PATH
fi
