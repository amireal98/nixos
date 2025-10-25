{ config, pkgs, ... }:

let
 dotfiles = "${config.home.homeDirectory}/nixos-dots/config";
 create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
 configs = {
  hypr = "hypr";
  kitty = "kitty";
  waybar = "waybar";
  niri = "niri";
 };
in

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
   btw = "echo I use NixOS, btw";
   nrs = "sudo nixos-rebuild switch --flake ~/nixos-dots#nixos-btw";
   l = "tree";
   gitp = "onefetch && git push -u origin main";
  };
 };

 xdg.configFile = builtins.mapAttrs
  (name: subpath: {
   source = create_symlink "${dotfiles}/${subpath}";
   recursive = true;
  }) configs;

}

