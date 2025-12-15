{ inputs, pkgs, config, ... }:

let
  username = "amireal";
in

{
  imports = [
    ./home-manager/dotfiles.nix

    inputs.zen-browser.homeModules.beta
  ];
  
  home = {
    username = "amireal";
    homeDirectory = "/home/amireal";
    stateVersion = "25.11";
    backupFileExtension = "bak";
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
