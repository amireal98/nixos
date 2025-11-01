{ config, pkgs, ... }:

# Dotfiles and configs
let
 dotfiles = "${config.home.homeDirectory}/nixos-dots/config";
 create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
 configs = {
  kitty = "kitty";
  ghostty = "ghostty";
  waybar = "waybar";
  hypr = "hypr";
  niri = "niri";
  yazi = "yazi";
  neofetch = "neofetch";
  helix = "helix";
  zellij = "zellij";
 };
in

# User
{
 home.username = "amireal";
 home.homeDirectory = "/home/amireal";
 programs.gh.enable = true;
 programs.git.enable = true;
 home.stateVersion = "25.05";
 programs.nushell.enable = true;
 programs.bash = {
  enable = true;
  shellAliases = {
   nrs = "sudo nixos-rebuild switch --flake ~/nixos-dots#nixos-btw";
   l = "ls -l";
   gitp = "onefetch && git push -u origin main";
   y = "yazi";
  };
 };

 xdg.configFile = builtins.mapAttrs
  (name: subpath: {
   source = create_symlink "${dotfiles}/${subpath}";
   recursive = true;
  }) configs;
}

