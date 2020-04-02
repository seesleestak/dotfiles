#!/bin/bash
CURR_PERCENT=$(xbacklight -get)

if [[ -n $1 ]]; then
  if [[ $1 -eq 0 ]]; then
    xbacklight -inc 10
  else
    xbacklight -dec 10
  fi

  NEW_PERCENT=$(xbacklight -get)

  if [[ $NEW_PERCENT != $CURR_PERCENT ]]; then
    CURR_PERCENT=$(xbacklight -get | cut -d "." -f 1)
    notify-send "Brightness $CURR_PERCENT%" --app-name=brightness --hint=string:synchronous:brightness
  fi
else
  echo "Please provide an argument, 0 or 1"
fi

