# !/bin/bash
CURR_BRANCH=$(git symbolic-ref HEAD --short)
BLACKLIST=("master" "develop")
PREFIX=""

if [[ -n $CURR_BRANCH ]]; then
  if [[ -n $JIRA_PREFIX ]]; then
    PREFIX=$(echo $CURR_BRANCH | grep -o -e "$JIRA_PREFIX-[0-9]*")
  fi

  if [[ -z $PREFIX ]] || [[ $(echo "${BLACKLIST[@]}" | grep --word-regexp "$CURR_BRANCH") ]]; then
    git commit -m $1 "${@:2}"
  else
    git commit -m "$PREFIX: $1" "${@:2}"
  fi
fi
