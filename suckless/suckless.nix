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

	environment.systemPackages = with pkgs; [
		(pkgs.st.overrideAttrs (_: {
			src = ./st;
			patches = [ ];
		}))

		(pkgs.dmenu.overrideAttrs (_: {
			src = ./dmenu;
			patches = [ ];
		}))

		picom
	];
}
