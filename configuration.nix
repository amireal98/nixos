{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "moon";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true;
  # };

  nixpkgs.config = {
    allowUnfree = true;
  };

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
  
  services.displayManager.ly.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };
  services.libinput.enable = true;

  users.users.amireal = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.firefox.enable = true;

  programs.git = {
    enable = true;
    config = {
      user.name = "amireal98";
      user.email = "amireal98@proton.me";
      init.defaultBranch = "main";
    };
  };

  environment.systemPackages = with pkgs; [
    # Dev
    git
    gh
    kitty

    # Dependencies
    vicinae
    brightnessctl
    playerctl
    hyprlock
    swww

    # Tui apps
    lazygit
    yazi
    spotify-player
    fastfetch
    nitch
    cava
    asciiquarium
    pipes-rs

    # Gui apps
    nautilus
    obsidian
    vesktop
    steam
    zed-editor
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term
    nerd-fonts.iosevka
  ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  system.stateVersion = "25.11"; # change = boom

}

