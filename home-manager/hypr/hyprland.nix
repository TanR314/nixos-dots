{ config, pkgs, ... }:


{
  home.packages = with pkgs; [
    wofi
    swww
    grim
    slurp
    wf-recorder
    wl-clipboard
    swappy # snapshot editing tool
    swaynotificationcenter
    hyprpicker
  
    # For aylur's dotfiles
    asusctl
    supergfxctl
    fd
    bun
    dart-sass
    # matugen
    # Gtk Settings / Gnome settings
    # gnome-tweaks
    nautilus


    # !TODO: MUST HAVE==============================================================
    hyprpolkitagent
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {

      exec-once = [
        "systemctl --user start hyprpolkitagent"
        # "hyprctl setcursor Bibata-Modern-Classic 24"
        "hyprctl setcursor Qogir 24"
        "ignis init"
        # "ignis init"
        # "ibus-daemon"
        # "swww-daemon --format xrgb"
        # "swaync"
        "fcitx5 -d -r"
        "fcitx5-remote -r"
      ];

      monitor=",preferred,auto,auto";
      # https://wiki.hyprland.org/Configuring/Variables/#general
      general = {
        # gaps_in = 5;
        gaps_in = 0;
        gaps_out = 0;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };
      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration = {
        rounding = 10;

        # Change transparency of focused and unfocused windows
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        # drop_shadow = true;
        # shadow_range = 4;
        # shadow_render_power = 3;
        # "col.shadow" = "rgba(1a1a1aee)";

        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };
      # https://wiki.hyprland.org/Configuring/Variables/#animations
      animations = {
        enabled = "yes";
        # enabled = "no";
        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92" 
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
          "softAcDecel, 0.26, 0.26, 0.15, 1"
          "md2, 0.4, 0, 0.2, 1" # use with .2s duration
        ];
        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "windowsIn, 1, 3, md3_decel, popin 60%"
          "windowsOut, 1, 3, md3_accel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 3, md3_decel"
          "layersIn, 1, 3, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 4.5, menu_accel"
          "workspaces, 1, 7, menu_decel, slide"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };
      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
        # no_gaps_when_only = "yes";
      };
      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        # disable_splash_rendering = true;
        disable_hyprland_logo = true;
        # force_default_wallpaper = 1;
      };
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "yes";
          disable_while_typing = true;
          drag_lock = true;
          clickfinger_behavior = true;
        };
        sensitivity = 0;
        float_switch_override_focus = 2;
        repeat_rate = 35;
        repeat_delay = 250;
      };
      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures = {
        workspace_swipe = true;
        workspace_swipe_use_r = true;
      };

      "$mainMod"="SUPER";
      bind = 
      [
        "$mainMod, R, exec, wofi --show drun"
        "$mainMod, Q, exec, kitty"
        "$mainMod, Return, exec, kitty"
        "$mainMod, C, killactive"
        "$mainMod, M, exit"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"


        # Toggle Floating
        "$mainMod, V, togglefloating"

        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # "$mainMod, SPACE, exec, fcitx5-remote -t"
        "$mainMod, W, exec,zsh -c chromium --enable-features=UseOzonePlatform --enable-wayland-ime"


        "$mainMod SHIFT, B, exec, killall .ags-wrapped;ags"
        "$mainMod SHIFT, M, exec, killall ignis;ignis init"



        "$mainMod SHIFT, l, resizeactive, 10 0"
        "$mainMod SHIFT, h, resizeactive, -10 0"
        "$mainMod SHIFT, k, resizeactive, 0 -10"
        "$mainMod SHIFT, j, resizeactive, 0 10"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ",Print,exec,grim - | wl-copy" # Screenshot >> clipboard
      ];

      # Laptop multimedia keys for volume and LCD brightness
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
      ];
    };
    extraConfig = ''
      env = XCURSOR_SIZE,24
      env = HYPRCURSOR_SIZE,24

      # env = GLFW_IM_MODULE,fcitx
      # env = GTK_IM_MODULE,fcitx
      env = QT_IM_MODULE,fcitx5
      # env = XMODIFIERS,@im=fcitx5
      # env = IMSETTINGS_MODULE,fcitx5
      # env = INPUT_METHOD,fcitx5

      # env = GLFW_IM_MODULE,ibus
      # env = GTK_IM_MODULE,ibus
      # env = QT_IM_MODULE,ibus
      # env = XMODIFIERS,@im=ibus
      # env = IMSETTINGS_MODULE,ibus
      # env = INPUT_METHOD,ibus

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
      device {
        name = epic-mouse-v1
        sensitivity = -0.5
      }

      windowrulev2 = suppressevent maximize, class:.*

      # Fix some dragging issues with XWayland
      windowrulev2 = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0
      windowrule = pseudo, fcitx

      windowrule = center, title:^(All Files)(.*)$


      windowrule=float,title:^(All Files)(.*)$
    '';
  };
}
