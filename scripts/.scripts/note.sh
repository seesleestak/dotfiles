# !/bin/sh
local notes_dir="/home/calvin/repos/notes/misc"
local notes_dropbox_dir="/home/calvin/Dropbox/notes"
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
    vim "$notes_dir/$2"
    ;;
  d)
    vim "$notes_dropbox_dir/$(date -u '+%Y-%m-%d-%H-%M-%S')"
    ;;
  *)
    vim "$notes_dir/$(date -u '+%Y-%m-%d-%H-%M-%S')"
esac
