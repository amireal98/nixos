{ config, pkgs, inputs, ... }:

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
      l = "ls -l";
    };
  };

  home.packages = [
    pkgs.neovim
    pkgs.ripgrep
    pkgs.nil
    pkgs.nixpkgs-fmt
    pkgs.nodejs
    pkgs.gcc
    pkgs.ascii-image-converter
    inputs.zen-browser.packages.default
  ];

}
