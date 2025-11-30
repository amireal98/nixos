{ config, pkgs, ... }:

{
 home.username = "amireal";
 home.homeDirectory = "/home/amireal";
 programs.git.enable = true;
 home.stateVersion = "25.05";
 programs.bash = {
  enable = true;
  shellAliases = {
   n = "neovim";
   btw = "echo I use NixOS, btw";
   l = "ls -l";
  };
 };
}
