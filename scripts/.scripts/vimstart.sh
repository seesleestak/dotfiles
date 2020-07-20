#!/usr/bin/env bash
# vimstart - by Billy Montgomery
PURPLE="\033[0;35m"
ORANGE="\033[0;33m"

echo $ORANGE
TOTAL=0
for i in {1..20}
do
  vim -c\ q --startuptime /tmp/vim.log
  VAL=$(tail -n1 /tmp/vim.log | awk '{print $1}')
  echo $VAL
  TOTAL=$(echo $VAL | awk '{print $1+"'$TOTAL'"}')
done

echo $PURPLE
echo $TOTAL | awk '{print $1/20 " Average \n"}'
