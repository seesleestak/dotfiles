export EDITOR=/usr/bin/vim
export PATH=$PATH:$HOME/.scripts
export TERMINAL=/usr/bin/urxvt

# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/google-chrome-stable

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi
