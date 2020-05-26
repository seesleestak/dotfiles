# !/bin/bash
CURR_BRANCH=$(git symbolic-ref HEAD --short)

if [[ -n $CURR_BRANCH ]]; then
  PREFIX=$(echo $CURR_BRANCH | grep -o -e "[a-zA-Z]*-[0-9]*")

  if [[ -n $PREFIX ]]; then
    FORMATTED_PREFIX=$(echo $PREFIX | awk '{print toupper($0)}')
    git commit -m "$FORMATTED_PREFIX: $1" "${@:2}"
  else
    git commit -m "$1" "${@:2}"
  fi
fi
