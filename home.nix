{ inputs, pkgs, config, ... }:

let
  username = "amireal";
in

{
  imports = [
    ./modules/home-manager/dotfiles.nix
    #./modules/home-manager/stylix.nix

    inputs.zen-browser.homeModules.beta
    #inputs.stylix.homeModules.stylix
  ];
  
  home = {
    username = "amireal";
    homeDirectory = "/home/amireal";
    stateVersion = "25.11";
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs.home-manager.enable = true;
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use NixOS";
      nrs = "sudo nixos-rebuild switch --flake ~/Nixos#moon";
      l = "ls -l";
    };
  };
  programs.zen-browser = {
    enable = true;
    profiles = {
      ${username} = {
	id = 0;
	name = "${username}.default";
	isDefault = true;
      };
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
  ];

}
