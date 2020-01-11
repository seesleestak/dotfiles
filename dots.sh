#!/bin/bash
appendOld() {
  fileList=(
    ~/.tmux.conf \
    ~/.zprofile \
    ~/.zshrc \
    ~/.scripts \
    ~/.gitconfig \
    ~/.vim \
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
stow git

# Stow vim config and install plugins
stow vim && vim -c "PlugInstall | q | q"

# Setup and stow config directories
mkdir -p ~/.config
stow ranger
stow rofi
