#!/usr/bin/env bash
# echo $@
CHECKOUT_SEARCH_STR=$(git --no-pager branch --all --no-color --format='%(refname:short)' | fzf --height 35% --reverse)

if [[ -n $CHECKOUT_SEARCH_STR ]]; then
  if [[ $1 -eq 0 ]]; then
    if [[ $(echo $CHECKOUT_SEARCH_STR | cut -d'/' -f 1) = "origin" ]]; then
      git switch --track $CHECKOUT_SEARCH_STR
    else
      git switch $CHECKOUT_SEARCH_STR
    fi
  elif [[ $1 -eq 1 ]]; then
    if [[ $(echo $CHECKOUT_SEARCH_STR | cut -d'/' -f 1) = "origin" ]]; then
      CHECKOUT_SEARCH_STR=$(echo $CHECKOUT_SEARCH_STR | cut -d'/' -f2-)
    fi
    echo $CHECKOUT_SEARCH_STR
  fi
fi
