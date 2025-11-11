{ 
  inputs,
  lib,
  config,
  pkgs,
  ...
}:

{

 imports = [
    # Nix files
    ./modules/home-manager/dots.nix

    # Inputs
    # inputs.zen-browser.homeModules.beta
 ];

 home.username = "amireal";
 home.homeDirectory = "/home/amireal";
 home.stateVersion = "25.05";
 programs.bash = {
  enable = true;
  shellAliases = {
   btw = "echo I use NixOS, btw";
   l = "ls -l";
   nrs = "sudo nixos-rebuild switch --flake ~/Nixos#woof";
  };
 };

}
