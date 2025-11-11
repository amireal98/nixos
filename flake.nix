{
 description = "NixOS";

 inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
    };

 };

 outputs = { 
  self, 
  nixpkgs, 
  stylix, 
  home-manager, 
  ... }: {
   nixosConfigurations.woof = nixpkgs.lib.nixosSystem {
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

