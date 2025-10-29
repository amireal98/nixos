{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  nixpkgs.config = {
   allowUnfree = true;
   permittedInsecurePackages = [
    "mbedtls_2"
    "mbedtls-2.28.10"
   ];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Mexico_City";

  services.xserver.videoDrivers = ["nvidia" "amdgpu"];
  hardware.nvidia = {
   open = true;
   modesetting.enable = true;
   prime = {
    offload = {
     enable = true;
     enableOffloadCmd = true;
    };
    amdgpuBusId = "PCI:07:00:0";
    nvidiaBusId = "PCI:01:00:0";
   };
  };

  services.displayManager.ly.enable = true;
  services.libinput.enable = true;
  programs.hyprland = {
   enable = true;
   xwayland.enable = true;
  };
  programs.niri = {
   enable = true;
  };

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

  programs.steam = {
   enable = true;
  };

  environment.systemPackages = with pkgs; [
   vim
   neovim
   helix
   lazygit
   nitch
   fastfetch
   kitty
   kitty-img
   ghostty
   xwayland-satellite
   waybar
   swww
   nautilus
   nwg-look
   rofi
   brightnessctl
   adwaita-icon-theme
   magnetic-catppuccin-gtk
   gemini-cli
   ollama
   onefetch
   yazi
   vesktop
   lutris
   wine
   gamemode
   ncspot
   cava
   hyprlock
   figlet
   obsidian
   shc
   chromium
   power-profiles-daemon
   playerctl
   zed-editor
   vscodium
   neofetch
  ];

  fonts.packages = with pkgs; [
   nerd-fonts.caskaydia-cove
   maple-mono.NF
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05"; # Dont touch plz

}

