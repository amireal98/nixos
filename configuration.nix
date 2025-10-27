{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = pkg: true;

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
   xwayland-satellite
   lazygit
   nitch
   fastfetch
   kitty
   waybar
   swww
   nautilus
   nwg-look
   rofi-wayland
   brightnessctl
   adwaita-icon-theme
   gemini-cli
   ollama
   onefetch
   yazi
   yaziPlugins.starship
   vesktop
   magnetic-catppuccin-gtk
   neofetch
   lutris
  ];

  fonts.packages = with pkgs; [
   nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05"; # DONT TOUCH

}

