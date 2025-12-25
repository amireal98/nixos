{ pkgs, config, stylix, ... }: # Home.nix

{
	stylix = {
		enable = true;
		image = ../../wallpapers/dark-lines.jpeg;
		autoEnable = true;

		base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-medium.yaml";
		polarity = "dark";

		fonts = {
			monospace = {
				package = pkgs.nerd-fonts.jetbrains-mono;
				name = "JetBrainsMono Nerd Font";
			};
			serif = {
				package = pkgs.nerd-fonts.jetbrains-mono;
				name = "JetBrainsMono Nerd Font";
			};
			sansSerif = {
				package = pkgs.nerd-fonts.jetbrains-mono;
				name = "JetBrainsMono Nerd Font";
			};
			emoji = {
				package = pkgs.noto-fonts-color-emoji;
				name = "Noto Color Emoji";
			};

			sizes = {
				applications = 12;
			};
		};

		targets = {
			zen-browser.enable = false;
			kitty.enable = true;
		};
	};
}
