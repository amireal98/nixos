{ config, lib, pkgs, ... }: {
  environment.systemPackages = [
    pkgs.neovim
    pkgs.ripgrep
    pkgs.nil
    pkgs.nixpkgs-fmt
    pkgs.nodejs
    pkgs.gcc
  ];
}
