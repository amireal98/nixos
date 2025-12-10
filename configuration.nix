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
  
  services.displayManager.ly.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.libinput.enable = true;

  users.users.amireal = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.niri = {
    enable = true;
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
    xwayland-satellite
    vicinae
    brightnessctl
    playerctl

    # Tui apps
    lazygit
    yazi
    spotify-player
    fastfetch

    # Gui apps
    nautilus
    obsidian
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.zed-mono
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

