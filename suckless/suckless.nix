{ inputs, config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs {
	src = ./dwm;
      };
    };
  };

}
