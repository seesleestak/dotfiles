# !/bin/bash
CURR_BRANCH=$(git symbolic-ref HEAD --short)
BLACKLIST=("master" "develop")

if [[ -n $CURR_BRANCH ]]; then
  if [[ $(echo "${BLACKLIST[@]}" | grep --word-regexp "$CURR_BRANCH") ]]; then
    git commit -m $1 "${@:2}"
  else
    git commit -m "$CURR_BRANCH: $1" "${@:2}"
  fi
fi
