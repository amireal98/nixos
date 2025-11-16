{ inputs, lib, config, pkgs, ... }:

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
  networking.hostName = "nixos"; # Any problem with it?
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
    vim
    neovim
    gh
    nitch
    fastfetch
    yazi
    lazygit
    tmux
    cava
    peaclock
 
    # Hyprland
    kitty
    waybar
    swww
    brightnessctl
    playerctl
    rofi
    gamemode
    power-profiles-daemon

    # Apps
    steam
    vscode
    firefox
    lutris
    speedcrunch
    nautilus

    # Develop
    shc # SH compiler
    gcc # C compiler
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove # My favorite font
  ];

  # Essential Nixos & Nix features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  system.stateVersion = "25.05"; # Dont touch or everything will explode

}

