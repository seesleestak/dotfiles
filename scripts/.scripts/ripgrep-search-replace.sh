#!/bin/bash
if [[ -n $1 ]] && [[ -n $2 ]]; then
  COUNT=$(rg $1 --count-matches | cut -d ':' -f 2 | awk '{s+=$1}END{print s}')
  if [[ $COUNT -gt 0 ]]; then
    rg $1 --replace $2
    echo "\n\033[0;33m$COUNT matches found"
    echo -n "\033[0;36mContinue? (y/n) \033[0;39m" 
    read ANSWER
    case $ANSWER in
      y|Y) 
        rg -l $1 | xargs sed -i '' "s|$1|$2|g"
        echo "\033[0;32mSuccessfully made $COUNT substitutions"
        ;;
      n|N|*) ;;
    esac
  else
    echo "\033[0;33mNo matches found"
  fi
else 
  echo "\033[0;31mNot enough arguments"
fi
