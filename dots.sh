#!/bin/bash
appendOld() {
  fileList=(
    ~/.tmux.conf \
    ~/.zprofile \
    ~/.zshrc \
    ~/.scripts \
    ~/.urxvt   \
    ~/.xinitrc \
    ~/.Xresources \
    ~/.gitconfig \
    ~/.vim \
    ~/.config/dunst \
    ~/.config/gtk-3.0 \
    ~/.gtkrc-2.0 \
    ~/.config/i3 \
    ~/.config/polybar \
    ~/.config/ranger \
    ~/.config/rofi
  )

  for i in ${fileList[@]}
  do
    if [[ -e $i ]]; then
      echo "$i exists, moving..."
      mv $i "$i.old"
    fi
  done
}

appendOld

# Stow home directory config files
stow tmux
stow zsh
stow scripts
stow X11
stow git

# Stow vim config and install plugins
stow vim && vim -c PlugInstall -c q -c q

# Setup and stow config directories
mkdir -p ~/.config
stow dunst
stow gtk
stow i3
stow polybar
stow ranger
stow rofi
