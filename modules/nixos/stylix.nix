{ pkgs, config, stylix, ... }: # Configuration.nix

{
	stylix = {
		enable = true;
		image = ../../wallpapers/dark-lines.jpeg;
		autoEnable = true;

		base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
		polarity = "dark";

		fonts = {
			monospace = {
				package = pkgs.nerd-fonts.iosevka;
				name = "Iosevka Nerd Font";
			};
			serif = {
				package = pkgs.nerd-fonts.iosevka-term-slab;
				name = "IosevkaTermSlab Nerd Font";
			};
			sansSerif = {
				package = pkgs.iosevka;
				name = "Iosevka";
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
