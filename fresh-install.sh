# !/bin/sh
pacmanFonts() {
  sudo pacman -S \
    ttf-bitstream-vera \
    ttf-dejavu \
    ttf-font-awesome \
    ttf-freefont \
    ttf-liberation \
    ttf-roboto \
    ttf-ubuntu-font-family
}

pacmanUtilities() {
  sudo pacman -S \
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
    thunar \
    thunar-volman \
    w3m \
    xorg-server \
    xorg-xev \
    xorg-xinit \
    xorg-xrandr
}

pacmanPreferredPrograms() {
  sudo pacman -S \
    arc-gtk-theme \
    dunst \
    feh \
    gvim \
    neofetch \
    nodejs \
    npm \
    ranger \
    ripgrep \
    polybar \
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
  git clone https://aur.archlinux.org/spotify.git && cd spotify && makepkg -isr && cd ..
  git clone https://aur.archlinux.org/google-chrome.git && cd google-chrome && makepkg -isr && cd ..
  git clone https://aur.archlinux.org/paper-icon-theme.git && cd paper-icon-theme && makepkg -isr && cd ..
  git clone https://aur.archlinux.org/menu-calc.git && cd menu-calc && makepkg -isr && cd ..
  git clone https://aur.archlinux.org/dropbox.git && cd dropbox && makepkg -isr && cd ~
}

aptSetup() {
  # Get all the rest that don't depend on apt
  sudo apt-get install \
    git \
    stow \
    tmux \
    vim \
    xclip \
    xsel

  distroAgnosticSetup
}

distroAgnosticSetup() {
  # Install global npm packages
  sudo npm i -g \
    eslint \
    gatsby \
    hiflow \
    jest
    lerna \
    prettier \
    ripsr \
    serverless

  # Create directories
  mkdir -p ~/working
  mkdir -p ~/Pictures/screenshots
  mkdir -p ~/Videos/screen-record

  # Install custom suckless builds
  cd ~/working && git clone https://github.com/seesleestak/st.git && cd st && make && sudo make install
  cd ~/working && git clone https://github.com/seesleestak/dmenu.git && cd dmenu && make && sudo make install

  # Install oh-my-zsh
  # sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

case $1 in
  -d)
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
  -da)
    distroAgnosticSetup
    ;; 
  *)
    echo "Please specify an install falg: "
    echo "   -a  (apt)"
    echo "   -p  (pacman)"
    echo "   -pp (preferred pacman packages)"
    echo "   -da (distro agnostic packages)"
    exit
    ;;
esac
