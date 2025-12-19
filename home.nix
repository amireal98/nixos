{ inputs, pkgs, config, ... }:

let
  username = "amireal";
in

{
  imports = [
    ./modules/home-manager/dotfiles.nix

    ./suckless/suckless-hm.nix

    inputs.zen-browser.homeModules.beta
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
  programs.fish.enable = true;
  programs.zsh.enable = true;
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use NixOS";
      nrs = "sudo nixos-rebuild switch --flake ~/Nixos#moon";
      l = "ls -l";
      n = "clear && nvim";
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
  ];

}
