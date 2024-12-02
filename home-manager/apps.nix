{config,pkgs,...}:
{
  home.packages = with pkgs; [
    obsidian
    telegram-desktop
    spotify
    (discord.override {
      # withOpenASAR = true; # can do this here too
      withVencord = true;
    })
    # gnome-disk-utility
    geogebra6
  ];
}
