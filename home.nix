{ 
  inputs,
  lib,
  config,
  pkgs,
  ...
}:

{

 imports = [
    # Nix files
    ./modules/home-manager/dots.nix

    # Inputs
    # inputs.zen-browser.homeModules.beta
 ];

 home.username = "amireal";
 home.homeDirectory = "/home/amireal";
 home.stateVersion = "25.05";
 programs.bash = {
  enable = true;
  shellAliases = {
   btw = "echo I use NixOS, btw";
   l = "ls -l";
   nrs = "sudo nixos-rebuild switch --flake ~/Nixos#woof";
  };
  initExtra = ''
    export PS1="\[\e[38;5;75m\]\u@\h \[\e[38;5;113m\]\w \[\e[38;5;189m\]\$ \[\e[0m\]"
  '';
 };

}
