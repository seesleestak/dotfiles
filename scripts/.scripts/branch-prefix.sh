# !/bin/bash
CURR_BRANCH=$(git symbolic-ref HEAD --short)

if [[ -n $CURR_BRANCH ]]; then
  if [[ $CURR_BRANCH != "master" ]] || [[ $CURR_BRANCH != "develop" ]]; then
    git commit -m "$CURR_BRANCH: $1"
  else
    git commit -m $1
  fi
fi
