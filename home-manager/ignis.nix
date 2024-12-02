{ pkgs, inputs, ... }:

{ # home-manager
  home.packages = with pkgs; [
    inputs.ignis.packages.${system}.ignis
    # python3 # Required for ignis
    # python312Packages.material-color-utilities
    # python312Packages.materialyoucolor
    # python312Packages.pillow
    # (pkgs.python312.withPackages (ppkgs: [
    #   ppkgs.materialyoucolor
    #   ppkgs.pillow
    # ]))
  ];
}
