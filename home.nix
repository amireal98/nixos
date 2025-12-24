{ inputs, pkgs, config, ... }:

let
	username = "amireal";
in

{
	imports = [
		./modules/home-manager/dotfiles.nix
		# ./modules/home-manager/stylix.nix

		# ./suckless/suckless-hm.nix

		inputs.zen-browser.homeModules.beta
		# inputs.stylix.homeModules.stylix
	];
  
	home = {
		username = "amireal";
		homeDirectory = "/home/amireal";
		stateVersion = "25.11";
		sessionVariables = {
			EDITOR = "nvim";
		};
	};

	programs.home-manager.enable = true;
	programs.bash = {
		enable = true;
		shellAliases = {
			nrs = "sudo nixos-rebuild switch --flake ~/Nixos#moon";
			l = "ls -l";
			n = "clear && nvim";
			yz = "yazi && clear";
			at = "astroterm --color --constellations --speed 10000 --fps 60 && clear";
		};
	};
	programs.zen-browser = {
		enable = true;
		profiles = {
			${username} = {
				id = 0;
				name = "${username}.default";
				isDefault = true;
			};
		};
	};

	home.packages = [
		pkgs.neovim
		pkgs.ripgrep
		pkgs.nil
		pkgs.nixpkgs-fmt
		pkgs.nodejs
		pkgs.gcc
	];

}
