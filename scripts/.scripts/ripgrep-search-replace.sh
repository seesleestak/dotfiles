#!/usr/bin/env bash
if [[ -n $1 ]] && [[ -n $2 ]]; then
  COUNT=$(rg $1 --count-matches | cut -d ':' -f 2 | awk '{s+=$1}END{print s}')
  if [[ $COUNT -gt 0 ]]; then
    rg $1 --replace $2
    echo -e "\n\e[33m$COUNT matches found"
    echo -e -n "\e[36mContinue? (y/n) \e[39m" 
    read ANSWER
    case $ANSWER in
      y|Y) 
        if [[ $(uname -s) = "Darwin" ]]; then
          rg -l $1 | xargs sed -i '' "s|$1|$2|g"
        else
          rg -l $1 | xargs sed -i'' "s|$1|$2|g"
        fi
        echo -e "\e[32mSuccessfully made $COUNT substitutions"
        ;;
      n|N|*) 
        echo "Exiting..."
        ;;
    esac
  else
    echo -e "\e[33mNo matches found"
  fi
else 
  echo -e "\e[31mNot enough arguments"
fi
