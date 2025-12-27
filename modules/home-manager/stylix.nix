{ pkgs, config, stylix, ... }: # Home.nix

{
	stylix = {
		enable = true;
		image = ../../wallpapers/dark-lines.jpeg;
		autoEnable = true;

		base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
		polarity = "dark";

		fonts = {
			monospace = {
				package = pkgs.nerd-fonts._0xproto;
				name = "0xProto Nerd Font";
			};
			serif = {
				package = pkgs.nerd-fonts._0xproto;
				name = "0xProto Nerd Font";
			};
			sansSerif = {
				package = pkgs.nerd-fonts._0xproto;
				name = "0xProto Nerd Font Propo";
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
			kitty.enable = false;
		};
	};
}
