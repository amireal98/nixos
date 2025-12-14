{ pkgs, config, stylix, ... }:

{
  stylix = {
    enable = true;
    image = ../wallpapers/0008.png;
    base24Scheme = "${pkgs.base24-schemes}/share/themes/catppuccin-mocha.yaml";
    polarity = "dark";
    fonts = {
      monospace = {
	package = pkgs.nerd-fonts.iosevka;
	name = "Iosevka Nerd Font";
      };
    };
    # targets = {
    #   qt.enable = true;
    #   gtk.enable = true;
    # };
  };
}
