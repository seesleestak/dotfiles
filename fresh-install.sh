# !/bin/sh
# Install a whole bunch of programs
sudo pacman -S --noconfirm \
  acpi \
  dunst \
  evince \
  feh \
  git \
  gpicview \
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
  tmux \
  ttf-dejavu \
  ttf-font-awesome \
  ttf-freefont \
  ttf-liberation \
  urxvt-perls \
  w3m \
  xorg-server \
  xorg-xev \
  xorg-xinit \
  xorg-xrandr \
  zsh \

# Install global npm packages
sudo npm i -g hiflow ripsr prettier vtop eslint lerna serverless gatsby

# Create repos dir
mkdir ~/working
mkdir -p ~/Pictures/screenshots

# Clone some stuff from AUR
mkdir ~/aur && cd ~/aur
git clone https://aur.archlinux.org/polybar.git && cd polybar && makepkg -si && cd ..
git clone https://aur.archlinux.org/spotify.git && cd spotify && makepkg -si && cd ..
git clone https://aur.archlinux.org/snapd.git && cd snapd && makepkg -si && cd ..
git clone https://aur.archlinux.org/google-chrome.git && cd google-chrome && makepkg -si && cd ..
git clone https://aur.archlinux.org/dropbox.git && cd dropbox && makepkg -si && cd ~

# Install slack with snap instead of AUR
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install slack --classic

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
