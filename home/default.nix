{ config, pkgs, home, ... }:

{
  home.packages = with pkgs; [ 
    neovim 
    alacritty
    firefox
    obsidian
    gnome.nautilus
    vesktop
    kotatogram-desktop
    drawio
    pavucontrol
    quickemu
    spice-gtk
    shotman

    gcc
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
