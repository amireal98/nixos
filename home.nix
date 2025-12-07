{ config, pkgs, ... }:

{
  imports = [
    ./home-manager/dots.nix
  ];
  
  home = {
    username = "amireal";
    homeDirectory = "/home/amireal";
    stateVersion = "25.11";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use NixOS";
      nrs = "sudo nixos-rebuild switch --flake ~/Nixos#moon";
    };
  };

  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
  ];
}
