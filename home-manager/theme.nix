{
  pkgs,
  config,
  inputs,
  ...
}: let
  nerdfonts = pkgs.nerdfonts.override {
    fonts = [
      "Ubuntu"
      "UbuntuMono"
      "CascadiaCode"
      "FantasqueSansMono"
      "FiraCode"
      "Mononoki"
      "JetBrainsMono"
    ];
  };

  theme = {
    name = "adw-gtk3-dark";
    package = pkgs.adw-gtk3;
  };
  # theme = {
  #   name = "Adwaita-dark";
  #   package = pkgs.gnome-themes-extra;
  # };

  font = {
    name = "Ubuntu Nerd Font";
    package = nerdfonts;
    size = 11;
  };
  cursorTheme = {
    name = "Qogir";
    size = 24;
    package = pkgs.qogir-icon-theme;
    # package = pkgs.bibata-cursors;
    # name = "Bibata-Modern-Classic";
    # size = 24;
  };
  iconTheme = {
    name = "MoreWaita";
    package = pkgs.morewaita-icon-theme.overrideAttrs {
      src = inputs.morewaita;
    };
  };
  # cursorTheme = {
  #   package = pkgs.orchis-theme;
  #   name = "Orchis-Purple";
  #   size = 24;
  # };
  # theme = {
  #   package = pkgs.orchis-theme;
  #   name = "Orchis-Purple";
  # };
in {
  home = {
    packages = with pkgs; [
      cantarell-fonts
      font-awesome
      theme.package
      font.package
      cursorTheme.package
      iconTheme.package
      adwaita-icon-theme
      papirus-icon-theme
    ];
    sessionVariables = {
      XCURSOR_THEME = cursorTheme.name;
      XCURSOR_SIZE = "${toString cursorTheme.size}";
    };
    pointerCursor =
      cursorTheme
      // {
        gtk.enable = true;
      };
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "adw-gtk3-dark";
    };
  };
  # dconf.settings = {
  #    ...
  #     "org/gnome/desktop/interface" = {
  #       color-scheme = "prefer-dark";
  #       gtk-theme = "adw-gtk3-dark";
  #     };
  # };

  fonts.fontconfig.enable = true;

  gtk = {
    inherit font cursorTheme iconTheme;
    # theme.name = theme.name;
    enable = true;
  };

  # qt = {
  #   enable = true;
  #   platformTheme.name = "kde";
  # };
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  home.file.".local/share/flatpak/overrides/global".text = let
    dirs = [
      "/nix/store:ro"
      "xdg-config/gtk-3.0:ro"
      "xdg-config/gtk-4.0:ro"
      "${config.xdg.dataHome}/icons:ro"
    ];
  in ''
    [Context]
    filesystems=${builtins.concatStringsSep ";" dirs}
  '';
}
