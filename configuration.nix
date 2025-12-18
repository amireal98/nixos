{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ./modules/nixos/stylix.nix
      ./modules/nixos/packages.nix
      ./modules/nixos/programs.nix
      ./modules/nixos/services.nix
      ./modules/nixos/gaming.nix

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
  console = {
    keyMap = "us";
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
      amireal = import ./home.nix;
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  system.stateVersion = "25.11"; # change = boom

}

