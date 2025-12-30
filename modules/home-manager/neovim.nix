{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.neovim
    pkgs.ripgrep
    pkgs.nil
    pkgs.nixpkgs-fmt
    pkgs.nodejs
    pkgs.gcc
  ];
}
