{ pkgs, config, stylix, ... }:

{
  stylix = {
    enable = true;
    image = ../wallpapers/0008.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/zenbones.yaml";
    polarity = "dark";
    fonts = {
      monospace = {
	package = pkgs.nerd-fonts.iosevka;
	name = "Iosevka Nerd Font";
      };
    };
    targets = {
      qt.enable = true;
      gtk.enable = true;
    };
  };
}
