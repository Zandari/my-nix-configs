{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  boot.kernelParams = ["nvidia-drm.fbdev=1"];

 # Nvidia drivers
 #services.xserver.videoDrivers = [ "nvidia" ];
 #services.xserver.dpi = 166;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  services = {
    gvfs.enable = true;
    udisks2.enable = true;
    blueman.enable = true;
    pipewire = {
      enable = true;
      wireplumber.enable = true;
    };

    xserver = {
      xkb = {
        layout = "us,ru";
        variant = "";
        options = "ctrl:nocaps,grp:shifts_toggle";
      };
      videoDrivers = [ "nvidia" ];
    };
  };

  virtualisation.waydroid.enable = true;

  console.useXkbConfig = true;

  users.users.zandari = {
    isNormalUser = true;
    description = "zandari";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.systemPackages = with pkgs; [
    wget
    vim
    git
    curl
    qemu
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = ["CascadiaMono"]; })
  ];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;

    pulseaudio.enable = true;
    pulseaudio.support32Bit = true;

    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };


  system.stateVersion = "24.05"; 
}
