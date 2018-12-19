# !/bin/sh
TITLE='Timer done'
while getopts ":d:t:" opt; do
  case ${opt} in
    d )
      TITLE=$OPTARG
      ;;
    t ) 
      TIME_SECONDS=$OPTARG
      ;;
    \? ) echo "Usage: cmd [-h] [-t]"
      exit
      ;;
  esac
done

date1=$((`date +%s` + $TIME_SECONDS))

while [ "$date1" -ge `date +%s` ]; do
  echo -ne "$(date -u --date @$(($date1 - `date +%s` )) +%T)\r";
done && notify-send "$TITLE" -t 0

