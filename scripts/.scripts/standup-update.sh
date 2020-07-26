#!/usr/bin/env bash
LOG_PATH="$HOME/log"
DOC_PATH="$LOG_PATH/standup.md"
if [ ! -e "$DOC_PATH" ]; then
  mkdir -p $LOG_PATH
  touch $DOC_PATH
fi

CURR_DATE=$(date "+%a %m-%d-%Y")
GREP_RES=$(grep "$CURR_DATE" $DOC_PATH)
if [ -z "$GREP_RES" ]; then
  echo -e "\n# $CURR_DATE\n- <"'!'"-- Content -->" >> $DOC_PATH
fi
