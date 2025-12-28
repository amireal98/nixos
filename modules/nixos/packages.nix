{ config, lib, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    permittedInsecurePackages = [
      "mbedtls-2"
      "mbedtls-2.28.10"
      "libsoup-2"
      "libsoup-2.74.3"
      "libsoup"
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
    pkgs.openssh
    pkgs.killall

    # Tui
    pkgs.lazygit
    pkgs.yazi
    pkgs.fastfetch
    pkgs.nitch
    pkgs.cava
    pkgs.astroterm
    pkgs.btop
    pkgs.spotify-player

    # Gui
    pkgs.kitty
    pkgs.nautilus
    pkgs.obsidian
    pkgs.vesktop
    pkgs.zed-editor
    pkgs.mpv
    pkgs.feh
  ];

  fonts.packages = with pkgs; [
    # nerd-fonts.iosevka
    # iosevka
    nerd-fonts.symbols-only
    noto-fonts
  ];
}
