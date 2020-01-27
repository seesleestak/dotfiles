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
  alias mor="cd ~/repos/mor-web-client"
  alias mora="cd ~/repos/mor-api"
  alias dot="cd ~/dotfiles"
  alias vui="cd ~/repos/viking-ui-kit"
  alias mvj="cd ~/repos/mvj-client"
  alias olb="cd ~/repos/olb-client"

  # ls color always
  if [[ $(uname -s) = "Darwin" ]]; then
    alias ls="ls -G"
  else
    alias ls="ls --color=always"
  fi
  alias ll="ls -al"

  # Homebrew vim alias
  if [[ $(uname -s) = "Darwin" ]]; then
    alias vim="/usr/local/Cellar/vim/8.1.2000/bin/vim"
  fi

  # Shell scripts
  alias note="source $HOME/.scripts/note.sh"
  alias vimstart="source $HOME/.scripts/vimstart.sh"
  alias rsr="source $HOME/.scripts/ripgrep-search-replace.sh"
  alias hic="source $HOME/.scripts/branch-prefix.sh"

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
  alias glg="git log --oneline --no-merges"
  alias gsr="git symbolic-ref --short HEAD"
  alias gss="git status -s"

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files '

# emacs mode
bindkey -e
bindkey '\e[1;5C' vi-forward-word   # C-Right
bindkey '\e[1;5D' vi-backward-word  # C-Left

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
