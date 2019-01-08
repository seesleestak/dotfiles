# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Export ENV variables
export VISUAL=/usr/bin/vim
export EDITOR="$VISUAL"
export PATH=$PATH:$HOME/.scripts:~/.local/bin
export TERMINAL=/usr/bin/urxvt
export BROWSER=/usr/bin/google-chrome-stable

# Aliases
  # Directories
  alias hxad="cd ~/working/admin-web-client"
  alias hxen="cd ~/working/enrollme-web-client"
  alias hui="cd ~/working/hixme-ui"
  alias dot="cd ~/dotfiles"
  alias mor="cd ~/working/mor-web-client"
  alias bun="cd ~/working/bundle-service"

  # hiflow
  alias hic="hi commit"

  # Scripts
  alias car="sh cpp-compile.sh"
  alias standup="standup.sh"

  # For ls with bash
  alias ls="ls --color=always"

  # Git
  alias ga="git add"
  alias gcb="git checkout -b"
  alias gcd="git checkout develop"
  alias gcmsg="git commit -m"
  alias gco="git checkout"
  alias gd="git diff"
  alias gf="git fetch"
  alias ggl='git pull origin "$(git symbolic-ref --short HEAD)"'
  alias ggp='git push origin "$(git symbolic-ref --short HEAD)"'
  alias gss="git status -s"

if [[ $- == *i* ]]
then
  bind '"\e[A": history-search-backward'
  bind '"\e[B": history-search-forward'
fi

bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'

# Notes function stolen from https://aonemd.github.io/blog/how-i-take-notes
function note {
  source $HOME/.scripts/note.sh
}

# riplace - by Billy Montgomery
function riplace {
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

# vimstart - by Billy Montgomery
function vimstart {
  TOTAL=0
  for i in {1..20}
  do
    vim -c\ q --startuptime /tmp/vim.log
    VAL=$(tail -n1 /tmp/vim.log | awk '{print $1}')
    echo $VAL
    TOTAL=$(echo $VAL | awk '{print $1+"'$TOTAL'"}')
  done

  echo $TOTAL | awk '{print $1/20 " Average \n"}'
}

# PS1='[\u@\h \W]\$ '
# PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
# PROMPT_COMMAND='__git_ps1 "\u@\h \w" "\\n$ "'

# Git prompt config
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
# GIT_PS1_SHOWCOLORHINTS=1
PROMPT_COMMAND='__git_ps1 "$(tput bold)$(tput setaf 2)\u$(tput sgr0)@\h $(tput setaf 3)\w$(tput sgr0)" "\\n$ "'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
