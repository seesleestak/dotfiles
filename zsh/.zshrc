# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="sleestak"

# Load plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Aliases
  # npm
  alias ys="yarn start"
  alias ns="npm start"
  alias nrf="rm -rfv node_modules && npm install"

  # Directories
  alias hxad="cd ~/working/admin-web-client"
  alias hxen="cd ~/working/enrollme-web-client"
  alias hxui="cd ~/working/hixme-ui"
  alias hui="cd ~/working/hixme-ui-github"
  alias dot="cd ~/dotfiles"
  alias mor="cd ~/working/mor-web-client"

  # hiflow
  alias hic="hi commit"
  alias hico="hi checkout"

  # Video outputs
  alias vga="monitor-vga.sh"
  alias hdmi="monitor-hdmi.sh"
  alias bimon="monitor-built-in.sh"

  # nmcli
  alias woff="nmcli radio wifi off"
  alias won="nmcli radio wifi on"

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files '
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# 10ms timeout to avoid delays with vim
KEYTIMEOUT=1

# vimstart - by Billy Montgomery
function vimstart() {
  PURPLE="\033[0;35m"
  ORANGE="\033[0;33m"

  echo $ORANGE
  TOTAL=0
  for i in {1..10}
  do
    vim -c\ q --startuptime /tmp/vim.log
    VAL=$(tail -n1 /tmp/vim.log | awk '{print $1}')
    echo $VAL
    TOTAL=$(echo $VAL | awk '{print $1+"'$TOTAL'"}')
  done

  echo $PURPLE
  echo $TOTAL | awk '{print $1/10 " Average \n"}'
}

# Notes function stolen from https://aonemd.github.io/blog/how-i-take-notes
function note() {
  local notes_dir="/home/calvin/working/notes/misc"
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
    -n) 
      vim "$notes_dir/$1"
      ;;
    *)
      vim "$notes_dir/$(date -u '+%Y-%m-%d-%H:%M:%S').md"
  esac
}

# riplace - by Billy Montgomery
function riplace() {
  if [ ${#1} -eq 0 ]; then
    read "a?Search: "
  else
    a=${#1}
  fi

  if [ ${#2} -eq 0 ]; then
    read "b?Replace: "
  else
    b=${#2}
  fi

  rg -l "$a" | xargs sed -i"" "s|$a|$b|g"
}

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/calvin/working/report-service/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/calvin/working/report-service/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/calvin/working/report-service/node_modules/tabtab/.completions/sls.zsh ]] && . /home/calvin/working/report-service/node_modules/tabtab/.completions/sls.zsh
