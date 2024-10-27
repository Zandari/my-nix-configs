{ config, pkgs, home, ... }:

{
  home.packages = with pkgs; [ 
    neovim 
    alacritty
    firefox
    gnome.nautilus
    vesktop
    kotatogram-desktop
    drawio
    pavucontrol
    quickemu
    spice-gtk
    shotman
    gnome.gnome-disk-utility
    yandex-disk
    okular
    samba
    libreoffice
    wl-clipboard
    xdg-utils
    qbittorrent
    gnome.simple-scan
    appimage-run
    xwayland
    xwayland-run
    prismlauncher
    vivaldi
    font-manager
    webcord
    ciscoPacketTracer8
    virtualbox

    # Latex stuff
    texliveFull
    python311Packages.pygments
    poppler_utils

    nnn
    tmux

    gcc
    pkg-config
    gnumake
    python3
    poetry
    openjdk

    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland
  ];

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  wayland.windowManager.hyprland = import ./hyprland {};

  services.hyprpaper = import ./hyprpaper { 
    wallpaper = "~/Pictures/wallpapers/wallpaper.jpg"; # пиздец
  };
  programs.alacritty = import ./alacritty {};
  programs.waybar    = import ./waybar {};
  programs.fuzzel    = import ./fuzzel {};

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
