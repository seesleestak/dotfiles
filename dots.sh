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
cp -R ~/dotfiles/.config/* ~/.config/
