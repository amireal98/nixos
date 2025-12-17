{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    # Dev
    pkgs.git
    pkgs.gh
    pkgs.kitty

    # Dependencies
    pkgs.vicinae
    pkgs.brightnessctl
    pkgs.playerctl
    pkgs.hyprlock
    pkgs.swww

    # Tui apps
    pkgs.lazygit
    pkgs.yazi
    pkgs.spotify-player
    pkgs.fastfetch
    pkgs.nitch
    pkgs.cava
    pkgs.asciiquarium
    pkgs.pipes-rs
  ];
}
