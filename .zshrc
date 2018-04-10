# Path to oh-my-zsh installation
export ZSH=/Users/$USER/.oh-my-zsh

ZSH_THEME="schminitz"

# Load plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Aliases
  alias vi="vim"

  # npm
  alias ys="yarn start"
  alias nrf="rm -rf node_modules && npm install"

  # Lerna 
  alias lb="lerna bootstrap"
  alias lc="lerna clean --yes"
  alias lrf="lc && lb"

  # Directories
  alias hxad="cd ~/working/admin-web-client"
  alias hxen="cd ~/working/enrollme-web-client"
  alias hxui="cd ~/working/hixme-ui"
  alias hui="cd ~/working/hixme-ui-github"
  alias dot="cd ~/working/dotfiles"
  alias mor="cd ~/working/mor-web-client"

  # hiflow
  alias hic="hi commit"
  alias hico="hi checkout"

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files '
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/Calvin/Documents/working/report-service/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/Calvin/Documents/working/report-service/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/Calvin/Documents/working/report-service/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/Calvin/Documents/working/report-service/node_modules/tabtab/.completions/sls.zsh

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

# riplace - by Billy Montgomery
function riplace() {
  if [ ${#1} -eq 0 ]; then
    read "a?Search: "
  else
    a=${#1}
  fi

  if [ ${#2} -eq 0 ]; then
    read "b?Replace:"
  else
    b=${#2}
  fi

  rg -l "$a" | xargs sed -i "" "s|$a|$b|g"
}
