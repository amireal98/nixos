{ pkgs, config, stylix, ... }: # Home.nix

{
	stylix = {
		targets = {
			zen-broser.enable = false;
			kitty.enable = false;
		};
	};
}
