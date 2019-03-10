# !/bin/sh
echo $1
echo $2
if [[ -z $1 ]]; then
  echo "Search argument is required"
  exit
fi

DIR=""
if [[ -z $2 ]]; then
  DIR="-- $2"
fi

git grep $1 $(git rev-list --all $DIR) $DIR
