{ config, lib, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = [
    pkgs.vicinae
    pkgs.brightnessctl
    pkgs.playerctl
    pkgs.hyprlock
    pkgs.swww
    pkgs.wine
  ];
}
