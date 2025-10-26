{

 description = "NixOS";

 inputs = {
  nixpkgs.url = "nixpkgs/nixos-25.05";
  nvf.url = "github:notashelf/nvf";
  home-manager = {
   url = "github:nix-community/home-manager/release-25.05";
   inputs.nixpkgs.follows = "nixpkgs";
  };
 };

 outputs = { self, nixpkgs, home-manager, nvf, ... }: {

  packages."x86_64-linux".default =
   (nvf.lib.neovimConfiguration {
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
    modules = [./nvf-configuration.nix];
   }).neovim;

  nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
   system = "x86_64-linux";
   modules = [
    ./configuration.nix
    nvf.nixosModules.default
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

