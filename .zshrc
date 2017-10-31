# Path to oh-my-zsh installation
export ZSH=/Users/Calvin/.oh-my-zsh

# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="agnoster"

# Load plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ys="yarn start"
alias hxad="cd ~/Documents/working/admin-web-client"
alias hxen="cd ~/Documents/working/enrollme-web-client"
alias hxui="cd ~/Documents/working/hixme-ui"
alias dot="cd ~/Documents/working/dotfiles"
alias vi="vim"
alias nrf="rm -rf node_modules && npm i && ys"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files '
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

