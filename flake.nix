{
  description = "amireal98 NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = { # my browser
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-iosevka-pin = {
      url = "github:nixos/nixpkgs/ac35b104800bff9028425fec3b6e8a41de2bbfff";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, nixpkgs-iosevka-pin, ... }@inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    nixosConfigurations.moon = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
	inherit inputs;
	pkgs-iosevka-pin = import nixpkgs-iosevka-pin {
	  system = system;
	  config.allowUnfree = true;
	};
      };
      modules = [
	./configuration.nix
	stylix.nixosModules.stylix
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.backupFileExtension = "bak";
	  stylix.homeManagerIntegration.autoImport = false;
	  stylix.homeManagerIntegration.followSystem = true;
	}
      ];
    };
  };
}
