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

  #boot.kernelParams = ["nvidia-drm.fbdev=1"];

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
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
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

  console.useXkbConfig = true;

  users.users.zandari = {
    isNormalUser = true;
    description = "zandari";
    extraGroups = [ "networkmanager" "wheel" "audio" "scanner" "lp"];
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
    liberation_ttf
  ];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
    opengl.driSupport = true; 
    opengl.driSupport32Bit = true; 

    nvidia = {
     modesetting.enable = true; 
    #powerManagement.enable = false; 
    #powerManagement.finegrained = false; 
    #open = true; 
     nvidiaSettings = true; 
     package = config.boot.kernelPackages.nvidiaPackages.stable; 
    };

    pulseaudio.enable = false;
    pulseaudio.support32Bit = true;

    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;

    sane.enable = true;
  };


  system.stateVersion = "24.05"; 
}
