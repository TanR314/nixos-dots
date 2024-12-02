{ config, pkgs, ... }:
{ # home-manager
  home.packages = with pkgs; [
    ripgrep
    lua-language-server
    texlab
    pyright
    nixd
    typescript-language-server
    # vimPlugins.nvim-treesitter-parsers.latex
    tree-sitter
  ];
}
