{
 description = "NixOS";

 inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

 };

 outputs = { 
  self, 
  nixpkgs, 
  home-manager, 
  stylix, 
  ... }: {
   nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./configuration.nix
      stylix.nixosModules.stylix
      home-manager.nixosModules.home-manager
      {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.amireal = import ./home.nix;
        backupFileExtension = "backup";
       };
      }
    ];
   };
 };
}

