{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (pkgs.st.overrideAttrs (_: {
      src = ./st;
      patches = [ ];
    }))

    (pkgs.dmenu.overrideAttrs (_: {
      src = ./dmenu;
      patches = [ ];
    }))

    slock
    surf
  ];

}
