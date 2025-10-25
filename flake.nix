{
 description = "NixOS";
 inputs = {
  nvf.url = "github:notashelf/nvf";
  nixpkgs.url = "nixpkgs/nixos-25.05";
  home-manager = {
   url = "github:nix-community/home-manager/release-25.05";
   inputs.nixpkgs.follows = "nixpkgs";
  };
 };
 outputs = { self, nixpkgs, home-manager, ... }: {
  nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
   system = "x86_64-linux";
   modules = [
    ./configuration.nix
    nvf.homeManagerModules.default
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

