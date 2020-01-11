#!/bin/bash
pacmanFonts() {
  sudo pacman -S --needed \
    ttf-bitstream-vera \
    ttf-dejavu \
    ttf-font-awesome \
    ttf-freefont \
    ttf-liberation \
    ttf-roboto
}

pacmanUtilities() {
  sudo pacman -S --needed \
    acpi \
    avahi \
    cups \
    cups-pdf \
    git \
    gvfs \
    i3 \
    imagemagick \
    network-manager-applet \
    networkmanager \
    pavucontrol \
    playerctl \
    powertop \
    pulseaudio \
    system-config-printer \
    thunar \
    thunar-volman \
    w3m \
    xorg-server \
    xorg-xev \
    xorg-xinit \
    xorg-xrandr
}

pacmanPreferredPrograms() {
  sudo pacman -S --needed \
    arc-gtk-theme \
    dunst \
    feh \
    gvim \
    neofetch \
    nodejs \
    npm \
    ranger \
    ripgrep \
    rofi \
    scrot \
    slop \
    stow \
    telegram-desktop \
    tmux \
    xclip \
    xsel \
    yad \
    zathura \
    zathura-pdf-poppler \
    zathura-ps \
    zsh

  # Change shell to zsh
  # chsh -s $(which zsh)
}

pacmanSetup() {
  # Refresh repos and update system
  sudo pacman -Syyu

  # Install a whole bunch of programs
  pacmanUtilities

  # Install preferred packages
  pacmanPreferredPrograms

  # Install fonts from Arch repositories
  pacmanFonts

  # Get packages from AUR
  aurPackages

  # Get all the rest that don't depend on pacman/AUR
  distroAgnosticSetup
}

aurPackages() {
  # Clone some stuff from AUR
  mkdir -p ~/aur && cd ~/aur
  git clone https://aur.archlinux.org/rxvt-unicode-truecolor.git && cd rxvt-unicode-truecolor && makepkg -isr && cd ..
  git clone https://aur.archlinux.org/spotify.git && cd spotify && makepkg -isr && cd ..
  git clone https://aur.archlinux.org/google-chrome.git && cd google-chrome && makepkg -isr && cd ..
  git clone https://aur.archlinux.org/paper-icon-theme.git && cd paper-icon-theme && makepkg -isr && cd ..
  git clone https://aur.archlinux.org/menu-calc.git && cd menu-calc && makepkg -isr && cd ..
  git clone https://aur.archlinux.org/ttf-meslo.git && cd ttf-meslo && makepkg -isr && cd ..
  git clone https://aur.archlinux.org/dropbox.git && cd dropbox && makepkg -isr && cd ~
}

aptSetup() {
  sudo apt install \
    git \
    npm \
    ranger \
    ripgrep \
    rofi \
    stow \
    telegram-desktop \
    tmux \
    xclip \
    xsel

  # Get all the rest that don't depend on apt
  distroAgnosticSetup
}

distroAgnosticSetup() {
  # Install global npm packages
  sudo npm i -g \
    eslint \
    gatsby \
    prettier

  # Create directories
  mkdir -p ~/repos
  mkdir -p ~/Pictures/screenshots
  mkdir -p ~/Videos/screen-record

  # Install custom suckless builds
  # cd ~/repos && git clone https://github.com/seesleestak/st.git && cd st && make && sudo make install
  # cd ~/repos && git clone https://github.com/seesleestak/dmenu.git && cd dmenu && make && sudo make install
}

case $1 in
  -a)
    aptSetup
    ;;
  -p)
    pacmanSetup
    ;; 
  -pp)
    pacmanPreferredPrograms
    ;; 
  -pa)
    aurPackages
    ;; 
  -pf)
    pacmanFonts
    ;; 
  -da)
    distroAgnosticSetup
    ;; 
  *)
    echo "Please specify an install flag: "
    echo "   -a  (apt)"
    echo "   -p  (pacman)"
    echo "   -pp (preferred pacman packages)"
    echo "   -pa (AUR packages)"
    echo "   -pf (pacman font packages)"
    echo "   -da (distro agnostic packages)"
    exit
    ;;
esac
