{ pkgs, config, stylix, ... }: # Home.nix

{
	stylix = {
		autoEnable = true;
		targets = {
			gtk.enable = true;
			qt.enable = true;
			zen-browser.enable = false;
			kitty.enable = false;
		};
	};
}
