# !/bin/bash
NUM_COMMITS=$1

if [[ -n $NUM_COMMITS ]]; then
  git log --oneline "HEAD~$NUM_COMMITS"..HEAD
else
  git log --oneline
fi
