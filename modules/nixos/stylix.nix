{ pkgs, config, stylix, ... }: # Configuration.nix

{
  stylix = {
    enable = true;
    image = ../../wallpapers/dark-lines.jpeg;
    autoEnable = false;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    polarity = "dark";

    fonts = {
      monospace = {
	package = pkgs.nerd-fonts.jetbrains-mono;
	name = "JetBrainsMono Nerd Font";
      };
      serif = {
	package = pkgs.noto-fonts;
	name = "Noto Serif";
      };
      sansSerif = {
	package = pkgs.noto-fonts;
	name = "Noto";
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
      console.enable = true;
    };
  };
}
