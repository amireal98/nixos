{ pkgs, config, stylix, ... }: # Configuration.nix

{
  stylix = {
    enable = true;
    image = ../../wallpapers/dark-lines.jpeg;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal.yaml";
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
	package = pkgs.noto-fonts-color-emoji;
	name = "Noto Color Emoji";
      };
    };

    targets = {
      limine.enable = true;
    };
  };
}
