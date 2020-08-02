#!/usr/bin/env bash
LOG_PATH="$HOME/log/standup"
mkdir -p $LOG_PATH

MONTH_FILENAME=$(date "+%m-%Y")
STANDUP_DOC_PATH="$LOG_PATH/$MONTH_FILENAME.md"
if [ ! -e "$STANDUP_DOC_PATH" ]; then
  touch $STANDUP_DOC_PATH
fi

CURR_DATE=$(date "+%a %m-%d-%Y")
GREP_RES=$(grep "$CURR_DATE" $STANDUP_DOC_PATH)

if [ -z "$GREP_RES" ]; then
  echo -e "\n# $CURR_DATE\n- <"'!'"-- Content -->" >> $STANDUP_DOC_PATH
fi

echo $STANDUP_DOC_PATH
