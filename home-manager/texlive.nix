{ pkgs, ... }:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive)
    scheme-basic
    memoir
    xpatch # Required for memoir
    etoolbox # required for memoir
    booktabs # required for memoir

    xcolor

    # Footnotes
    mdwtools

    # Fancy Boxes
    thmtools
    tcolorbox

    # Unknown reaons
    pgf
    environ
    tikzfill
    listings
    pdfcol
    asymptote

    # icons
    fontawesome5
    fontspec

    # engines
    xelatex-dev
    latexmk;
      # dvisvgm dvipng # for preview and export as html
      # wrapfig amsmath ulem hyperref capt-of;
      #(setq org-latex-compiler "lualatex")
      #(setq org-preview-latex-default-process 'dvisvgm)
  });
in
{ # home-manager
  home.packages = with pkgs; [
    tex
  ];
  programs.zathura = {
    # Good resources: https://gist.github.com/michaelmrose/9595075b43f24aa903fa
    enable = true;
    options = {
      guioptions = "";
      "statusbar-v-padding" = 0;
      "statusbar-h-padding" = 0;
      "window-title-basename" = true;
      "incremental-search" = false;
      "synctex" = true;
      "selection-notification" = false;
      "sandbox" = "none";
      "vertical-center" = true;
      "adjust-open" = "best-fit";
      "scroll-page-aware" = "true";
      "smooth-scroll" = "true";
      "scroll-full-overlap" = 0.01;
      "scroll-step" = 100;
      "zoom-min" = 10;
      "render-loading" = "false";
      "font" = "UbuntuMono Nerd Font 15";
      # "scroll-step" = 50;
    };
  };
  home.sessionVariables = {
    TEXMFHOME = "~/.dotfiles/texmf";
  };

  home.file.".latexmkrc".text = ''
    sub asy {return system("asy -o '$_[0]' '$_[0]'");}
    add_cus_dep("asy","eps",0,"asy");
    add_cus_dep("asy","pdf",0,"asy");
    add_cus_dep("asy","tex",0,"asy");
    push @generated_exts, "pre", "%R-[0-9]*.pdf", "%R-[0-9]*.prc", "%R-[0-9]*.tex", "%R-[0-9]*.out", "%R-[0-9]*.pbsdat", "%R.pbsdat", "%R-[0-9]*.eps", "%R-*.asy"
  '';
}
