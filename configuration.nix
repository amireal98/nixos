{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix # Dont touch this file or everything will implode
    ];

  # Stytemd bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname, NetworkManager and localization
  networking.hostName = "woof"; # Any problem with it?
  networking.networkmanager.enable = true;
  time.timeZone = "America/Mexico_City"; # Tacos
  i18n.defaultLocale = "en_US.UTF-8"; # Bang bang

  # Gpu settings & Nvidia prime
  services.xserver.videoDrivers = ["nvidia" "amdgpu"]; # The dedicated and integrated graphics drivers
  hardware.nvidia = {
    open = true; # I love open source, fuck nvidia
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

  # Window manager (Niri) & Display manager (Ly)
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.niri = { # Niri my beloved
    enable = true;
  };
  services.displayManager.ly.enable = true; # Ly display manager
  services.libinput.enable = true; # Trackpad

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
    allowUnfree = true; # Not open source D:
    permittedInsecurePackages = [
      "mbedtls_2" # Required for lutris
      "mbedtls-2.28.10" # Also required for lutris
    ];
  };
  environment.systemPackages = with pkgs; [
    # Tui
    vim # Vim > Emacs
    gh # Github
    nitch # I use NixOs btw
    fastfetch # I use NixOs btw
 
    # Niri
    kitty # Kitty term my beloved
    waybar # A bar in wayland
    lazygit # Im to lazy to use git cli
    swww # Wallpaper
    brightnessctl # I can/cant see anything
    playerctl # Pause and play
    xwayland-satellite # X programs in wayland for niri
    rofi # App launcher

    # Keyboard
    qmk
    via
    hid-tools
    hidapi

    # Apps
    vscode # I dont wanted telemetry, but i needed that Ridiculous Coding addon
    firefox # Fox are canids also
    lutris # Yay
    speedcrunch # I hate Batiz / Odio Batiz
    nautilus # Files
    steam # Yay x2
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove # My favorite font
  ];

  # Essential Nixos & Nix features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  system.stateVersion = "25.05"; # Dont touch or everything will explode

}

