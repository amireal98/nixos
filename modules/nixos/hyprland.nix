{ config, lib, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = [
    pkgs.vicinae
    pkgs.hyprlock
    pkgs.hyprshot
    pkgs.swaynotificationcenter
    pkgs.swww
  ];
}
