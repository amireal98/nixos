{ 
  inputs,
  lib,
  config,
  pkgs,
  ...
}:

{
  imports =
    [
      ./hardware-configuration.nix # Dont touch this file or everything will implode
      ./modules/nixos/stylix.nix # Theming
    ];

  # Limine bootloader
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.limine = {
    enable = true;
    efiSupport = true;
  };

  # Hostname, NetworkManager and localization
  networking.hostName = "woof"; # Any problem with it?
  networking.networkmanager.enable = true;
  time.timeZone = "America/Mexico_City";

  # Graphics
  services.xserver.videoDrivers = ["nvidia" "amdgpu"]; # Dedicated and integrated video drivers
  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    amdgpuBusId = "PCI:07:00:0"; # Integrated graphics
    nvidiaBusId = "PCI:01:00:0"; # Dedicated graphics
   };
  };

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  # Window manager
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.niri = { # Niri my beloved
    enable = true;
  };
  services.displayManager.ly.enable = true; # Ly display manager
  services.libinput.enable = true; # Trackpad enabled

  # User (me) and git
  users.users.amireal = { # Thats me :D
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
   ];
  };
  programs.git = {
    enable = true;
    config = {
      user.name = "amireal98"; # Thats also me :D
      user.email = "amireal98@proton.me"; # My email
      init.defaultBranch = "main";
    };
  };

  # Nixpkgs
  nixpkgs.config = {
    allowUnfree = true; # Allow not open source packages
    permittedInsecurePackages = [
      "mbedtls_2" # Required for lutris
      "mbedtls-2.28.10" # Also required for lutris
    ];
  };
  environment.systemPackages = with pkgs; [
    # Tui
    vim # Vim > Emacs
    neovim
    gh # Github
    nitch # I use NixOs btw
    fastfetch # I use NixOs btw
    yazi # Terminal file manager
    lazygit # Im to lazy to use git cli
    tmux # Terminal multiplexer
    cava
    clock-rs
 
    # Hyprland and niri
    kitty # Kitty terminal my beloved
    waybar # A bar in wayland
    swww # Animated wallpapers
    brightnessctl # I can/cant see anything
    playerctl # Pause and play
    xwayland-satellite # X programs in wayland for niri
    rofi # App launcher
    gamemode # Optimization for games

    # Apps
    vscode
    firefox
    lutris
    speedcrunch # Odio Batiz, saquenme de Batiz
    nautilus # Gui file manager

    # Develop
    shc
    gcc
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove # My favorite font
  ];


  # Some programs configs
  programs.steam = {
    enable = true;
  };

  # Essential Nixos & Nix features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  system.stateVersion = "25.05"; # Dont touch or everything will explode

}

