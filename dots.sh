#!/bin/bash
mkdir -p ~/.config

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
    ~/.config/ranger
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

stow tmux
stow zsh
stow scripts
stow git
stow vim && vim -c "PlugInstall | q | q"
stow ranger
