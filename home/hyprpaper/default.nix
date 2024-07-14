# Everything here unreasonable and stupid


{ wallpaper, ... }:

{
  enable = true;
  settings = import ./config.nix {inherit wallpaper; };
}
