{ config, lib, pkgs, ...}:

{
	services.power-profiles-daemon.enable = true;
	services.flatpak.enable = true;
}
