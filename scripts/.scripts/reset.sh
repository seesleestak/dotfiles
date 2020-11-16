#!/usr/bin/env bash
branch_name=$(git symbolic-ref --short HEAD)
has_origin=$(git branch -a | rg "origin/$branch_name")

if [[ -n $has_origin ]]; then
  git reset --hard "origin/$branch_name"
else
  git reset --hard $branch_name
fi
