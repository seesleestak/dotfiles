#!/usr/bin/env bash
CHECKOUT_SEARCH_STR=$(git --no-pager branch --all --no-color --format='%(refname:short)' | fzf --height 25%)
if [[ -n $CHECKOUT_SEARCH_STR ]]; then
  git checkout $CHECKOUT_SEARCH_STR
fi
