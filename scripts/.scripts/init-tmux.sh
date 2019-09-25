# !/bin/bash
tmux new-session -d -n 1 'vim'
tmux split-window -h
tmux split-window -v
tmux selectp -t 0
tmux -2 attach-session
