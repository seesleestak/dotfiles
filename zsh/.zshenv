export VISUAL="/usr/local/bin/vim"
export EDITOR=$VISUAL

export FZF_DEFAULT_COMMAND='fd --type file --color=always'
export FZF_DEFAULT_OPTS="--ansi --border"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export PATH=$PATH:$HOME/.scripts:$HOME/.local/bin:$HOME/.cargo/bin
