#!/bin/bash
# Notes function stolen from https://aonemd.github.io/blog/how-i-take-notes
local notes_dir="$HOME/repos/notes"
local notes_dropbox_dir="$HOME/Dropbox/notes"
case "$1" in
  c)
    cd "$notes_dir"
    ;;
  l)
    ls -al "$notes_dir"
    ;;
  p)
    pushd "$notes_dir"
    msg="Regenerated at $(date -u '+%Y-%m-%d %H:%M:%S') UTC"
    git add .
    git commit -m "$msg"
    git push origin master
    popd
    ;;
  n) 
    vim "$notes_dir/misc/$2"
    ;;
  d)
    vim "$notes_dropbox_dir/$(date -u '+%Y-%m-%d-%H-%M-%S')"
    ;;
  *)
    vim "$notes_dir/misc/$(date -u '+%Y-%m-%d-%H-%M-%S')"
esac
