export VISUAL="/usr/local/bin/vim"
export EDITOR=$VISUAL

export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_DEFAULT_OPTS="--ansi --border"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_OPTS="--ansi --border --reverse"

export PATH=$PATH:$HOME/.scripts:$HOME/.local/bin:$HOME/.cargo/bin
