# !/bin/sh
# Install a whole bunch of programs
sudo pacman -S \
  dunst \
  feh \
  git \
  gvim \
  i3 \
  imagemagick \
  neofetch \
  network-manager-applet \
  networkmanager \
  nodejs \
  npm \
  pavucontrol \
  playerctl \
  powertop \
  pulseaudio \
  ranger \
  ripgrep \
  rxvt-unicode \
  scrot \
  stow \
  telegram-desktop \
  tmux \
  ttf-dejavu \
  ttf-freefont \
  ttf-liberation \
  urxvt-perls \
  xorg-server \
  xorg-xinit \
  xorg-xrandr \
  zsh \

# Install global npm packages
sudo npm i -g hiflow ripsr prettier vtop eslint lerna serverless

# Create repos dir
mkdir ~/working

# Clone some stuff from AUR
mkdir ~/aur && cd ~/aur
git clone https://aur.archlinux.org/polybar.git && cd polybar && makepkg -si && cd ..
git clone https://aur.archlinux.org/spotify.git && cd spotify && makepkg -si && cd ..
git clone https://aur.archlinux.org/snapd.git && cd snapd && makepkg -si && cd ..
git clone https://aur.archlinux.org/google-chrome.git && cd google-chrome && makepkg -si && cd ..
git clone https://aur.archlinux.org/dropbox.git && cd dropbox && makepkg -si && cd ~

# Install slack with snap instead of AUR
sudo snap install slack --classic

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
