{ inputs, config, lib, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix # dont change

		./modules/nixos/stylix.nix
		./modules/nixos/packages.nix
		./modules/nixos/programs.nix
		./modules/nixos/xdg.nix
		./modules/nixos/services.nix
		./modules/nixos/audio.nix
		./modules/nixos/gaming.nix

		./suckless/suckless.nix

		inputs.home-manager.nixosModules.home-manager
	];

	boot.loader = {
		efi.canTouchEfiVariables = true;
		limine = {
			enable = true;
			efiSupport = true;
		};
	};

	networking.hostName = "moon";
	networking.networkmanager.enable = true;

	time.timeZone = "America/Mexico_City";
	console = {
		keyMap = "us";
	};
 
	services.displayManager.ly.enable = true;
	services.libinput.enable = true;
 
	users.users.amireal = { # its me
		isNormalUser = true;
		extraGroups = [ "wheel" ];
		packages = with pkgs; [
			tree
		];
	};

	home-manager = {
		extraSpecialArgs = { inherit inputs; };
		users = {
			amireal = import ./home.nix;
		};
	};

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
	system.stateVersion = "25.11"; # change = boom

}

