{ pkgs, config, stylix, ... }: # Home.nix

{
	stylix = {
		targets = {
			zen-browser.enable = false;
			kitty.enable = false;
		};
	};
}
