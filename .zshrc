# Path to oh-my-zsh installation
# export ZSH=/Users/Calvin/.oh-my-zsh

ZSH_THEME="gitster"

# Load plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Aliases
  alias vi="vim"

  # npm
  alias ys="yarn start"
  alias nrf="rm -rf node_modules && npm i && ys"

  # Lerna 
  alias lb="lerna bootstrap"
  alias lc="lerna clean"
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
