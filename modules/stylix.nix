{ pkgs, config, stylix, ... }:

{
  stylix = {
    enable = true;
    image = ../wallpapers/0008.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    polarity = "dark";
    fonts = {
      monospace = {
	package = pkgs.nerd-fonts.iosevka;
	name = "Iosevka Nerd Font";
      };
      serif = {
	package = pkgs.poppins;
	name = "Poppins";
      };
      sansSerif = {
	package = pkgs.poppins;
	name = "Poppins";
      };
      emoji = {
	package = pkgs.noto-fonts-emoji;
	name = "Noto Color Emoji";
      };
    };
    targets = {
      qt.enable = true;
      gtk.enable = true;
      limine.enable = true;
    };
  };
}
