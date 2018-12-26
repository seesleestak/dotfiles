export VISUAL=/usr/bin/vim
export EDITOR="$VISUAL"
export PATH=$PATH:$HOME/.scripts
export TERMINAL=/usr/bin/urxvt
# export TERMINAL=/usr/local/bin/st

# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/google-chrome-stable

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi
