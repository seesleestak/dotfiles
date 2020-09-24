#!/usr/bin/env bash
CHECKOUT_SEARCH_STR=$(branch)

if [[ -n $CHECKOUT_SEARCH_STR ]]; then
  if [[ $(echo $CHECKOUT_SEARCH_STR | cut -d'/' -f 1) = "origin" ]]; then
    git switch --track $CHECKOUT_SEARCH_STR
  else
    git switch $CHECKOUT_SEARCH_STR
  fi
fi
