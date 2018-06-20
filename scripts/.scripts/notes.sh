# !/bin/sh
note() {
  local notes_dir="~/working/notes/misc"
  case "$1" in
    c)
      cd "$notes_dir"
      ;;
    l)
      ls "$notes_dir"
      ;;
    *)
      vim "$notes_dir/$1"
  esac
}
