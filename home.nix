{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./modules/home-manager/dots.nix
  ];

  home.username = "amireal";
  home.homeDirectory = "/home/amireal";
  home.stateVersion = "25.05";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use NixOS, btw";
      l = "ls -l";
      nrs = "sudo nixos-rebuild switch --flake ~/Nixos#nixos";
    };

  };

}
