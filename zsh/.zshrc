# Load colors
autoload -U colors && colors

# Git branch auto completion
autoload -U compinit
compinit

# Prompt - https://dustri.org/b/my-zsh-configuration.html
setopt PROMPT_SUBST     # allow funky stuff in prompt
PROMPT="[%{$fg_bold[white]%}%n%{$reset_color%}@%m% %u %{$fg[green]%}%c%{$reset_color%}]$ "

# Aliases
  # Directories
  alias re="cd ~/repos"
  alias dot="cd ~/dotfiles"
  alias mor="cd ~/repos/mor-web-client"
  alias mora="cd ~/repos/mor-api"
  alias ui="cd ~/repos/qpp-ui"
  alias sty="cd ~/repos/qpp-style"

  # ls color always
  if [[ $(uname -s) = "Darwin" ]]; then
    alias ls="ls -G"
  else
    alias ls="ls --color=always"
  fi
  alias ll="ls -al"

  # Shell scripts
  alias vimstart="source $HOME/.scripts/vimstart.sh"
  alias rsr="source $HOME/.scripts/ripgrep-search-replace.sh"
  alias hic="source $HOME/.scripts/ah-branch-prefix.sh"
  alias vpn="anyconnect split"
  alias cov="open ./coverage/lcov-report/index.html"

  # Git
  alias ga="git add"
  alias gb="git branch"
  alias gcb="git checkout -b"
  alias gcmsg="git commit -m"
  alias gco="git checkout"
  alias gd="git diff"
  alias gdc="git diff --compact-summary"
  alias gds="git diff --staged"
  alias gf="git fetch"
  alias ggl='git pull origin "$(git symbolic-ref --short HEAD)"'
  alias ggp='git push origin "$(git symbolic-ref --short HEAD)"'
  alias glg="git log --oneline --no-merges"
  alias gres='git reset --hard origin/"$(git symbolic-ref --short HEAD)"'
  alias gsr="git symbolic-ref --short HEAD"
  alias gss="git status -s"

# Complete history on arrow up/down
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Workaround for reverse cycling through tab completion
# https://github.com/ohmyzsh/ohmyzsh/issues/8468
bindkey '^[[Z' reverse-menu-complete

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
