autoload -U colors && colors

# Git branch auto completion
autoload -U compinit
compinit

# # VCS info - https://dustri.org/b/my-zsh-configuration.html
# autoload -Uz vcs_info
# zstyle ':vcs_info:git*' enable git
# zstyle ':vcs_info:git*' check-for-changes true
# zstyle ':vcs_info:git*' formats "(%{$fg_bold[cyan]%}%b%{$reset_color%}) %{$fg[red]%}%u%{$reset_color%}%{$fg[red]%}%m%{$reset_color%}%{$fg[green]%}%c%{$reset_color%}"
# zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

# # Untracked changes
# +vi-git-untracked() {
#   if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
#      git status --porcelain | grep -m 1 '^??' &>/dev/null
#   then
#     hook_com[misc]='?'
#   fi
# }

# precmd() { vcs_info }
#

function gitBranchPrompt {
  if [[ -e "$(pwd)/.git" ]]; then
    echo "($(git symbolic-ref --short HEAD))"
  fi
}


# Prompt - https://dustri.org/b/my-zsh-configuration.html
setopt PROMPT_SUBST     # allow funky stuff in prompt
# color="green"
# if [ "$USER" = "root" ]; then
#     color="red"         # root is red, user is green
# fi;
# PROMPT="%{$fg_bold[$color]%}%n%{$reset_color%}@%m%{$reset_color%}%u %{$fg[yellow]%}%~%b%{$reset_color%} "'${vcs_info_msg_0_}'$'\n'"$ "
PROMPT="[%{$fg_bold[white]%}%n%{$reset_color%}@%m% %u %{$fg[green]%}%c%{$reset_color%}]$ "
RPROMPT='$(gitBranchPrompt)'

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

  # ls color always
  alias ls="ls --color=always"

  # Git
  alias ga="git add"
  alias gb="git branch"
  alias gbd="git for-each-ref --sort=committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)'"
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

# emacs mode
bindkey -e

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

# History - https://dustri.org/b/my-zsh-configuration.html
HISTFILE=~/.zsh_history         # where to store zsh history
HISTSIZE=1024                   # big history
SAVEHIST=1024                   # big history
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit 
setopt share_history            # share hist between sessions

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/calvin/working/report-service/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/calvin/working/report-service/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/calvin/working/report-service/node_modules/tabtab/.completions/sls.zsh ]] && . /home/calvin/working/report-service/node_modules/tabtab/.completions/sls.zsh
