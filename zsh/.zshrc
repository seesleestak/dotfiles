# Load colors
autoload -U colors && colors

# Git branch auto completion
autoload -U compinit
compinit

# Prompt info - https://dustri.org/b/my-zsh-configuration.html
PROMPT="[%{$fg_bold[white]%}%n%{$reset_color%} %{$fg[green]%}%c%{$reset_color%}]$ "

SCRIPTS_DIR="$HOME/.scripts"

# Aliases
  # Directories
  alias re="cd ~/repos"
  alias dot="cd ~/dotfiles"
  alias mor="cd ~/repos/mor-web-client"
  alias mora="cd ~/repos/mor-api"
  alias ui="cd ~/repos/qpp-ui"
  alias sty="cd ~/repos/qpp-style"
  alias gr="cd ~/repos/grading"

  # ls color always
  if [[ $(uname -s) = "Darwin" ]]; then
    alias ls="ls -G"
  else
    alias ls="ls --color=always"
  fi
  alias ll="ls -al"

  # Shell scripts
  alias rsr="$SCRIPTS_DIR/ripgrep-search-replace.sh"
  alias hic="$SCRIPTS_DIR/ah-branch-prefix.sh"
  alias vpn="anyconnect split"
  alias cov="open ./coverage/lcov-report/index.html"
  alias jf="$SCRIPTS_DIR/json-format.sh"

  # Git
  alias ga="git add"
  alias gb="git branch"
  alias gcb="git checkout -b"
  alias gcmsg="git commit -m"
  alias gco="git checkout"
  alias gd="git diff ${@}"
  alias gdc="git diff ${@} --compact-summary"
  alias gds="git diff ${@} --staged"
  alias gf="git fetch"
  alias ggl='git pull origin "$(git branch --show-current)"'
  alias ggp='git push origin "$(git branch --show-current)"'
  alias glg="git log --oneline --no-merges"
  alias gsr="git branch --show-current"
  alias gss="git status -sb"
  alias ch="$SCRIPTS_DIR/switch-branch.sh"
  alias rst="$SCRIPTS_DIR/reset.sh"

  alias stnd="vim $(standup-update.sh)"

# emacs mode
bindkey -e

# Complete history on arrow up/down
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# History - https://dustri.org/b/my-zsh-configuration.html
HISTFILE=~/.zsh_history         # where to store zsh history
HISTSIZE=2048                   # big history
SAVEHIST=2048                   # big history
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit 
setopt share_history            # share hist between sessions

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
