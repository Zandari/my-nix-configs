{
  # Defining monitor
  monitor = ",preferred,auto,auto";
  
  # Defining programs
  "$terminal" = "alacritty";
  "$browser" = "firefox";
  "$fileManager" = "nautilus";
  "$menu" = "fuzzel";

  exec-once = "waybar";

  general = {
    border_size = 2;
    gaps_in = 0;
    gaps_out = 0;
    "col.active_border" = "rgba(8933a2bb) rgba(d752ffbb) 45deg";
    "col.inactive_border" = "rgba(1d1f21d2) rgba(1d1f21d2)";
    resize_on_border = true;

    layout = "dwindle";
  };

  #windowrulev2 = "noborder, focus:0";

  decoration = {
    rounding = 1;

    active_opacity = 1.0;
    inactive_opacity = 1.0;
    drop_shadow = true; # TODO fix required
    shadow_range = 20;
    shadow_render_power = 4;
    shadow_ignore_window = true;
    "col.shadow" = "0x700f0f0f";

    blur = { # TODO
      enabled = true;
      size = 8;
      passes = 2;
      new_optimizations = true;
    };
  };

  animations = {
    enabled = false;
    # TODO
  };

  input = {
    kb_layout = "us,ru";
    kb_options = "ctrl:nocaps,grp:shifts_toggle";
    follow_mouse = 2;
  };


  # KEY BINDINGS

  "$mod" = "SUPER";

  bind = [
    "$mod, Q, exec, $terminal"
    "$mod, B, exec, $browser"
    "$mod, G, exec, $fileManager"
    "$mod, M, exec, $menu"
    "$mod, C, killactive, "
#   "$mod, K, exit, "
    "$mod, F, togglefloating, "
    "$mod, N, pseudo, "
    "$mod, S, togglesplit, "

    "$mod, left, movefocus, l"
    "$mod, right, movefocus, r"
    "$mod, up, movefocus, u"
    "$mod, down, movefocus, d"
    "$mod, h, movefocus, l"
    "$mod, l, movefocus, r"
    "$mod, k, movefocus, u"
    "$mod, j, movefocus, d"

    "$mod, 1, workspace, 1"
    "$mod, 2, workspace, 2"
    "$mod, 3, workspace, 3"
    "$mod, 4, workspace, 4"
    "$mod, 5, workspace, 5"
    "$mod, 6, workspace, 6"
    "$mod, 7, workspace, 7"
    "$mod, 8, workspace, 8"
    "$mod, 9, workspace, 9"
    "$mod, 0, workspace, 0"

    "$mod SHIFT, 1, movetoworkspace, 1"
    "$mod SHIFT, 2, movetoworkspace, 2"
    "$mod SHIFT, 3, movetoworkspace, 3"
    "$mod SHIFT, 4, movetoworkspace, 4"
    "$mod SHIFT, 5, movetoworkspace, 5"
    "$mod SHIFT, 6, movetoworkspace, 6"
    "$mod SHIFT, 7, movetoworkspace, 7"
    "$mod SHIFT, 8, movetoworkspace, 8"
    "$mod SHIFT, 9, movetoworkspace, 9"
    "$mod SHIFT, 0, movetoworkspace, 0"
  ];

  bindm = [
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
  ];

}
