{ config, lib, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    permittedInsecurePackages = [
      "mbedtls_2"
      "mbedtls-2.28.10"
    ];
  };

  environment.systemPackages = [
    # Dev
    pkgs.git
    pkgs.gh
    pkgs.kitty
    pkgs.alacritty

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
}
