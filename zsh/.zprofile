export EDITOR=/usr/bin/vim
export PATH=$PATH:$HOME/.scripts

# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/chromium

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi
