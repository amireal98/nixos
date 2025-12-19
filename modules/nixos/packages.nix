{ config, lib, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    permittedInsecurePackages = [
      "mbedtls_2"
      "mbedtls-2.28.10"
      "libsoup-2"
    ];
  };

  environment.systemPackages = [
    # Dev
    pkgs.git
    pkgs.gh

    # Depencencies
    pkgs.brightnessctl
    pkgs.playerctl
    pkgs.wine

    # Tui
    pkgs.lazygit
    pkgs.yazi
    pkgs.spotify-player
    pkgs.fastfetch
    pkgs.nitch
    pkgs.cava
    pkgs.asciiquarium

    # Gui
    pkgs.nautilus
    pkgs.obsidian
    pkgs.vesktop
    pkgs.zed-editor
    pkgs.vscode
    pkgs.mpv
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
