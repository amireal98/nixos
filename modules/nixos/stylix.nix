{ pkgs, config, stylix, ... }: # Configuration.nix

{
  stylix = {
    enable = true;
    image = ../../wallpapers/dark-lines.jpeg;
    autoEnable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal.yaml";
    polarity = "dark";

    fonts = {
      monospace = {
	package = pkgs.nerd-fonts.jetbrains-mono;
	name = "JetBrainsMono Nerd Font";
      };
      serif = {
	package = pkgs.noto-fonts;
	name = "noto serif";
      };
      sansSerif = {
	package = pkgs.inter;
	name = "inter";
      };
      emoji = {
	package = pkgs.noto-fonts-color-emoji;
	name = "Noto Color Emoji";
      };
    };

    targets = {
      gtk.enable = true;
      qt.enable = true;
      limine.enable = true;
    };
  };
}
