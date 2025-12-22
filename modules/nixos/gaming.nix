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
			amdgpuBusId = "PCI:07:00:0"; # integrated gpu
			nvidiaBusId = "PCI:01:00:0"; # dedicated gpu
		};
	};

	environment.systemPackages = [
		pkgs.gamemode
		pkgs.lutris
		pkgs.prismlauncher
		pkgs.mcpelauncher-ui-qt
	];

	programs.steam = {
		enable = true;
	};
}
