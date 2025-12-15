{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/stylix.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    limine = {
      enable = true;
      efiSupport = true;
    };
  };

  networking.hostName = "moon";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "mbedtls_2"
    ];
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
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  users.users.amireal = { # its me
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      amireal = import ./home.nix
    };
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
    presets = [ "nerd-font-symbols" ];
  };

  environment.systemPackages = [
    # Dev
    pkgs.git
    pkgs.gh
    pkgs.kitty

    # Dependencies
    pkgs.vicinae
    pkgs.brightnessctl
    pkgs.playerctl
    pkgs.hyprlock
    pkgs.swww

    # Tui apps
    pkgs.lazygit
    pkgs.yazi
    pkgs.spotify-player
    pkgs.fastfetch
    pkgs.nitch
    pkgs.cava
    pkgs.asciiquarium
    pkgs.pipes-rs

    # Gui apps
    pkgs.nautilus
    pkgs.obsidian
    pkgs.vesktop
    pkgs.steam
    pkgs.zed-editor
    pkgs.vscodium
    pkgs.firefox
  ];

  fonts.packages = [
    pkgs.nerd-fonts.iosevka-term
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  system.stateVersion = "25.11"; # change = boom

}

