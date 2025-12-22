{ pkgs, config, stylix, ... }: # Home.nix

{
	stylix = {
		autoEnable = false;
		targets = {
			zen-browser.enable = false;
			kitty.enable = false;
		};
	};
}
