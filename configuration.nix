{ config, lib, pkgs, ... }: {

  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "lazy";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Mexico_City";

  services.displayManager.ly.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  users.users.amireal = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [ tree ];
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    git
    kitty
    swww
    waybar
    nitch
    fastfetch
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    font-awesome
  ];

  nix-settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";

}
