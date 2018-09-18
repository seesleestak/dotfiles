# !/bin/sh
rm -fv ~/.tmux.conf && stow tmux
rm -fv ~/.zprofile ~/.zshrc && stow zsh
cp ./.oh-my-zsh/themes/sleestak.zsh-theme ~/.oh-my-zsh/themes/
rm -rfv ~/.scripts && stow scripts
rm -rfv ~/.urxvt && rm -fv ~/.xinitrc ~/.Xresources && stow X11
rm -fv ~/.gitconfig && stow git

# Stow vim config and install plugins
rm -rfv ~/.vim && stow vim && vim -c PlugInstall -c q -c q

if [ ! -d ~/.config ]; then
  mkdir ~/.config
fi
rm -rfv ~/.config/dunst && stow dunst
rm -rfv ~/.config/gtk-3.0 ~/.gtkrc-2.0 && stow gtk
rm -rfv ~/.config/i3 && stow i3
rm -rfv ~/.config/polybar && stow polybar
rm -rfv ~/.config/ranger && stow ranger
rm -rfv ~/.config/rofi && stow rofi
