{configs, pkgs,...}:
{
  home.packages = with pkgs; [
    unzip
    gnome-font-viewer
    nodePackages_latest.nodejs
    fzf
    gparted
  ];
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "ayu";
      theme_background = true;
      vim_keys = false;
    };
  };


  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch;

    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        # source = "\$(find \\\"\${XDG_CONFIG_HOME:-\$HOME/.config}/fastfetch/pngs/\\\" -name \\\"*.png\\\" | shuf -n 1)";
        # source = ''$(find "${XDG_CONFIG_HOME:-$HOME/.config}/fastfetch/pngs/" -name "*.png" | shuf -n 1)'';
        # source = logoPath;
        # inherit source;
        source = "\$(ls \${XDG_CONFIG_HOME:-$HOME}/.dotfiles/home-manager/assets/logo/*.png | shuf -n 1)";
        height = 18;
        padding = {
          top = 2;
        };
      };
      display = {
        color = {
          keys = "green";
          title = "blue";
        };
        percent = {
          type = 9;
        };
        separator = " 󰁔 ";
      };
      modules = [
        {
          type = "custom";
          outputColor = "blue";
          format = ''┌──────────── OS Information ────────────┐'';
        }
        {
          type = "title";
          key = " ╭─ ";
          keyColor = "green";
          color = {
            user = "green";
            host = "green";
          };
        }
        {
          type = "os";
          key = " ├─ ";
          keyColor = "green";
        }
        {
          type = "kernel";
          key = " ├─ ";
          keyColor = "green";
        }
        {
          type = "packages";
          key = " ├─ ";
          keyColor = "green";
        }
        {
          type = "shell";
          key = " ╰─  ";
          keyColor = "green";
        }
        {
          type = "custom";
          outputColor = "blue";
          format = ''├───────── Hardware Information ─────────┤'';
        }
        {
          type = "display";
          key = " ╭─ 󰍹 ";
          keyColor = "blue";
          compactType = "original-with-refresh-rate";
        }
        {
          type = "cpu";
          key = " ├─ 󰍛 ";
          keyColor = "blue";
        }
        {
          type = "gpu";
          key = " ├─  ";
          keyColor = "blue";
        }
        {
          type = "disk";
          key = " ├─ 󱛟 ";
          keyColor = "blue";
        }
        {
          type = "memory";
          key = " ╰─  ";
          keyColor = "blue";
        }
        {
          type = "custom";
          outputColor = "blue";
          format = ''├───────── Software Information ─────────┤'';
        }
        {
          type = "wm";
          key = " ╭─  ";
          keyColor = "yellow";
        }
        {
          type = "terminal";
          key = " ├─  ";
          keyColor = "yellow";
        }
        {
          type = "font";
          key = " ╰─  ";
          keyColor = "yellow";
        }
        {
          type = "custom";
          outputColor = "blue";
          format = ''└────────────────────────────────────────┘'';
        }
        {
          type = "custom";
          format = "   {#39}   {#34}    {#36}    {#35}    {#34}    {#33}    {#32}    {#31} ";
        }
        "break"
      ];
    };
  };










}
