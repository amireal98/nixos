{ config, lib, pkgs, ... }:

{
  services.xserver.videoDrivers = ["nvidia" "amdgpu"];
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

  environment.systemPackages = [
    pkgs.gamemode
    pkgs.lutris
  ];

  programs.steam = {
    enable = true;
  };
}
