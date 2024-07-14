{ wallpaper, ... }:

{
  ipc = "off";
  preload = [ wallpaper ];
  wallpaper = [ ",${wallpaper}" ];
}
