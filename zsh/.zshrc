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

  # ls color always
  if [[ $(uname -s) = "Darwin" ]]; then
    alias ls="ls -G"
  else
    alias ls="ls --color=always"
  fi

  # Homebrew vim alias
  if [[ $(uname -s) = "Darwin" ]]; then
    alias vim="/usr/local/Cellar/vim/8.1.1750/bin/vim"
  fi

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
  alias gsr="git symbolic-ref --short HEAD"
  alias gss="git status -s"

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files '

# emacs mode
bindkey -e
bindkey '\e[1;5C' vi-forward-word   # C-Right
bindkey '\e[1;5D' vi-backward-word  # C-Left

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

function note {
  source $HOME/.scripts/note.sh
}

function rsr {
  if [[ -n $1 ]] && [[ -n $2 ]]; then
    rg $1 --replace $2
    echo -n "\n\033[0;36mContinue? (y/n) \033[0;39m" 
    read ANSWER
    case $ANSWER in
      y|Y) 
        COUNT=$(rg -l $1 | wc -l | xargs)
        rg -l $1 | xargs sed -i '' "s|$1|$2|g"
        echo "\033[0;32mSuccessfully made $COUNT substitutions"
        ;;
      n|N|*) ;;
    esac
  else 
    echo "\033[0;31mNot enough arguments"
  fi
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
HISTSIZE=2048                   # big history
SAVEHIST=2048                   # big history
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit 
setopt share_history            # share hist between sessions

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/calvin/repos/report-service/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/calvin/repos/report-service/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/calvin/repos/report-service/node_modules/tabtab/.completions/sls.zsh ]] && . /home/calvin/repos/report-service/node_modules/tabtab/.completions/sls.zsh
