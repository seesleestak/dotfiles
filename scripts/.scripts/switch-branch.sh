#!/usr/bin/env bash
CHECKOUT_SEARCH_STR=$(git --no-pager branch --all --no-color --format='%(refname:short)' | fzf --height 25%)

if [[ -n $CHECKOUT_SEARCH_STR ]]; then
  if [[ $(echo $CHECKOUT_SEARCH_STR | cut -d'/' -f 1) = "origin" ]]; then
    git switch --track $CHECKOUT_SEARCH_STR
  else
    git switch $CHECKOUT_SEARCH_STR
  fi
fi
