{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./nvf.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Mexico_City";

  programs.hyprland = {
   enable = true;
   xwayland.enable = true;
  };
  services.displayManager.ly.enable = true;
  services.libinput.enable = true;

  users.users.amireal = {
   isNormalUser = true;
   extraGroups = [ "wheel" ];
   packages = with pkgs; [
    tree
   ];
  };

  programs.git = {
   enable = true;
   config = {
    user.name = "amireal98";
    user.email = "amireal98@proton.me";
    init.defaultBranch = "main";
   };
  };

  programs.starship = {
   enable = true;
   presets = [
    "nerd-font-symbols"
   ];
  };
  
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
   vim
   helix
   neovim
   xwayland-satellite
   lazygit
   nitch
   fastfetch
   kitty
   ghostty
   waybar
   swww
   nautilus
   nwg-look
   rofi-wayland
   brightnessctl
   adwaita-icon-theme
   gemini-cli
   ollama
   vscodium
   onefetch
   yazi
   yaziPlugins.starship
  ];

  fonts.packages = with pkgs; [
   nerd-fonts.jetbrains-mono
   scientifica
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05"; # DONT TOUCH

}

