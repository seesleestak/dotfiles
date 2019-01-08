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
  alias gf="git fetch"
  alias ggl='git pull origin "$(git symbolic-ref --short HEAD)"'
  alias ggp='git push origin "$(git symbolic-ref --short HEAD)"'
  alias gss="git status -s"

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files '
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Use emacs mode for navigation
bindkey -e

# 10ms timeout to avoid delays with vim
# KEYTIMEOUT=1

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# vimstart - by Billy Montgomery
function vimstart {
  PURPLE="\033[0;35m"
  ORANGE="\033[0;33m"

  echo $ORANGE
  TOTAL=0
  for i in {1..20}
  do
    vim -c\ q --startuptime /tmp/vim.log
    VAL=$(tail -n1 /tmp/vim.log | awk '{print $1}')
    echo $VAL
    TOTAL=$(echo $VAL | awk '{print $1+"'$TOTAL'"}')
  done

  echo $PURPLE
  echo $TOTAL | awk '{print $1/20 " Average \n"}'
}

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

# Complete history on arrow up/down
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Prompt
source ~/.git-prompt.sh
autoload -U colors && colors
GIT_PS1_SHOWDIRTYSTATE=1
precmd () { __git_ps1 "%{$fg_bold[green]%}%n%{$reset_color%}@%m %{$fg[yellow]%}%~%{$reset_color%}" $'\n'"$ " " (%s)" }

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/calvin/working/report-service/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/calvin/working/report-service/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/calvin/working/report-service/node_modules/tabtab/.completions/sls.zsh ]] && . /home/calvin/working/report-service/node_modules/tabtab/.completions/sls.zsh
