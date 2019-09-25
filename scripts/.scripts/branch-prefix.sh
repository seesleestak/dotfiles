# !/bin/bash
CURR_BRANCH=$(git symbolic-ref HEAD --short)
if [[ -z $CURR_BRANCH ]]; then
  echo "No current branch. Exiting..."
  exit
fi

if [[ $CURR_BRANCH != "master" ]] || [[ $CURR_BRANCH != "develop" ]]; then
  git commit -m "$CURR_BRANCH: $1"
else
  git commit -m $1
fi
