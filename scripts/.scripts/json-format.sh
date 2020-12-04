#!/usr/bin/env bash
echo -n "format (f) or minify (m): "
read -rsn1 selection
case $selection in
  f)
    pbpaste | jj -np | pbcopy
    ;;
  m)
    pbpaste | echo $(jj -nu) | pbcopy
    ;;
esac
