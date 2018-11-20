# !/bin/sh
archPackages() {
  # Refresh repos and update system
  sudo pacman -Syyu

  # Install a whole bunch of programs
  sudo pacman -S \
    acpi \
    arc-gtk-theme \
    avahi \
    cups \
    cups-pdf \
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
    w3m \
    xorg-server \
    xorg-xev \
    xorg-xinit \
    xorg-xrandr \
    xsel \
    yad \
    zsh \

  # Get packages from AUR
  aurPackages

  # Get all the rest that don't depend on pacman/AUR
  distroAgnosticSetup
}

aurPackages() {
  # Clone some stuff from AUR
  mkdir -p ~/aur && cd ~/aur
  git clone https://aur.archlinux.org/polybar.git && cd polybar && makepkg -isr && cd ..
  git clone https://aur.archlinux.org/spotify.git && cd spotify && makepkg -isr && cd ..
  git clone https://aur.archlinux.org/google-chrome.git && cd google-chrome && makepkg -isr && cd ..
  git clone https://aur.archlinux.org/paper-icon-theme.git && cd paper-icon-theme && makepkg -isr && cd ..
  git clone https://aur.archlinux.org/menu-calc.git && cd menu-calc && makepkg -isr && cd ..
  git clone https://aur.archlinux.org/dropbox.git && cd dropbox && makepkg -isr && cd ~
}

debianPackages() {
  # Get all the rest that don't depend on apt
  # distroAgnosticSetup
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
    serverless \

  # Create directories
  mkdir ~/working
  mkdir -p ~/Pictures/screenshots
  mkdir -p ~/Videos/screen-record

  # Install custom suckless builds
  cd ~/working && git clone git@github.com:seesleestak/st.git && cd st && make && sudo make install
  cd ~/working && git clone git@github.com:seesleestak/dmenu.git && cd dmenu && make && sudo make install

  # Install oh-my-zsh
  # sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

case $1 in
  -d)
    debianPackages
    ;;
  -a)
    archPackages
    ;; 
  *)
    echo "Please specify which distro to install packages for: "
    echo "   -d (Debian-based distro)"
    echo "   -a (Arch-based distro)"
    exit
    ;;
esac
