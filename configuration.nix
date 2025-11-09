{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix # Dont touch this file or everything will implode
    ];

  # Stytemd bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Host name and NetworkManager
  networking.hostName = "woof";
  networking.networkmanager.enable = true;
  time.timeZone = "America/Mexico_City";

  # Gpu settings & Nvidia prime
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

  # Window manager (Niri) & Display manager (Ly)
  programs.hyprland = {
   enable = true;
   xwayland.enable = true;
  };
  programs.niri = {
    enable = true;
  };
  services.displayManager.ly.enable = true;
  services.libinput.enable = true;

  # User (me) and git
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

  # Nixpkgs
  nixpkgs.config = {
   allowUnfree = true;
   permittedInsecurePackages = [
    "mbedtls_2"
    "mbedtls-2.28.10"
   ];
  };
  environment.systemPackages = with pkgs; [
    # Tui
    vim
    gh
    nitch
    fastfetch
 
    # Niri
    kitty
    waybar
    lazygit
    swww
    brightnessctl
    playerctl
    xwayland-satellite

    # Keyboard
    qmk
    via
    hid-tools
    hidapi

    # Apps
    vscode
    firefox
    lutris
    speedcrunch
    nautilus
    steam
  ];
  fonts.packages = with pkgs; [
   nerd-fonts.caskaydia-cove
  ];

  # Nix commands & Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05"; # Dont touch or everything will explode

}

