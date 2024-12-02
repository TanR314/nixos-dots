{ config, pkgs, inputs, ags, astal, system, ... }:
{
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./shell.nix
    ./tmux.nix
    ./system.nix
    ./theme.nix
    ./neovim.nix
    ./hypr/hyprland.nix
    ./ignis.nix
    ./texlive.nix
    ./apps.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tanr314";
  home.homeDirectory = "/home/tanr314";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  # home.file = {
  # };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
