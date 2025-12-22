{ config, lib, pkgs, ... }:

{
	nixpkgs.config = {
		allowUnfree = true;
		allowBroken = true;
		permittedInsecurePackages = [
			"mbedtls-2"
			"mbedtls-2.28.10"
			"libsoup-2"
			"libsoup-2.74.3"
			"libsoup"
		];
	};

	environment.systemPackages = [
		# Dev
		pkgs.git
		pkgs.gh

		# Depencencies
		pkgs.brightnessctl
		pkgs.playerctl
		pkgs.wine
		pkgs.shc
		pkgs.openssh

		# Tui
		pkgs.lazygit
		pkgs.yazi
		pkgs.spotify-player
		pkgs.fastfetch
		pkgs.nitch
		pkgs.cava
		pkgs.astroterm

		# Gui
		pkgs.nautilus
		pkgs.obsidian
		pkgs.vesktop
		pkgs.zed-editor
		pkgs.vscode
		pkgs.mpv
	];

	fonts.packages = with pkgs; [
		nerd-fonts.iosevka
		iosevka
		noto-fonts
	];
}
