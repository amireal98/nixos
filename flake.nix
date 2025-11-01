{

 description = "NixOS";

 inputs = {
  nixpkgs.url = "nixpkgs/nixos-unstable";
  home-manager = {
   url = "github:nix-community/home-manager";
   inputs.nixpkgs.follows = "nixpkgs";
  };
  stylix.url = "github:danth/stylix",
 };

 outputs = { self, nixpkgs, home-manager, stylix, ... }: {

  nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
   system = "x86_64-linux";
   modules = [
    ./configuration.nix
    inputs.stylix.nixosModules.stylix
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

