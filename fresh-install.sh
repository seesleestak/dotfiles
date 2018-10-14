# !/bin/sh

# Refresh repos and update system
sudo pacman -Syyu --noconfirm

# Install a whole bunch of programs
sudo pacman -S --noconfirm \
  acpi \
  arc-gtk-theme \
  dunst \
  evince \
  feh \
  git \
  gvfs \
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
  rofi \
  rxvt-unicode \
  scrot \
  slop \
  stow \
  telegram-desktop \
  thunar \
  thunar-volman \
  tmux \
  ttf-bitstream-vera \
  ttf-dejavu \
  ttf-font-awesome \
  ttf-freefont \
  ttf-liberation \
  ttf-roboto \
  ttf-ubuntu-font-family \
  urxvt-perls \
  w3m \
  xorg-server \
  xorg-xev \
  xorg-xinit \
  xorg-xrandr \
  zsh \

# Install global npm packages
sudo npm i -g hiflow ripsr prettier vtop eslint lerna serverless gatsby jest

# Create directories
mkdir ~/working
mkdir -p ~/Pictures/screenshots
mkdir -p ~/Videos/screen-record

# Clone some stuff from AUR
mkdir ~/aur && cd ~/aur
git clone https://aur.archlinux.org/polybar.git && cd polybar && makepkg -isr && cd ..
git clone https://aur.archlinux.org/spotify.git && cd spotify && makepkg -isr && cd ..
git clone https://aur.archlinux.org/snapd.git && cd snapd && makepkg -isr && cd ..
git clone https://aur.archlinux.org/google-chrome.git && cd google-chrome && makepkg -isr && cd ..
git clone https://aur.archlinux.org/paper-icon-theme.git && cd paper-icon-theme && makepkg -isr && cd ..
git clone https://aur.archlinux.org/menu-calc.git && cd menu-calc && makepkg -isr && cd ..
git clone https://aur.archlinux.org/dropbox.git && cd dropbox && makepkg -isr && cd ~

# Install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
