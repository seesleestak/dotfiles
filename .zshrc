# Path to oh-my-zsh installation
export ZSH=/Users/Calvin/.oh-my-zsh

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

  # hiflow
  alias hic="hi commit"
  alias hico="hi checkout"

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

# function echo_color() {
#   printf "$1\033[0m\n"
# }
# echo_color "c-f  Move forward"
# echo_color "c-b  Move backward"
# echo_color "c-p  Move up"
# echo_color "c-n  Move down"
# echo_color "c-a  Jump to beginning of line"
# echo_color "c-e  Jump to end of line"
# echo_color "c-d  Delete forward"
# echo_color "c-h  Delete backward"
# echo_color "c-k  Delete forward to end of line"
# echo_color "c-u  Delete entire line"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
