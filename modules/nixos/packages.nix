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

		# Tui
		pkgs.lazygit
		pkgs.yazi
		pkgs.spotify-player
		pkgs.fastfetch
		pkgs.nitch
		pkgs.cava
		pkgs.asciiquarium

		# Gui
		pkgs.nautilus
		pkgs.obsidian
		pkgs.vesktop
		pkgs.zed-editor
		pkgs.vscode
		pkgs.mpv
	];

	fonts.packages = with pkgs; [
		nerd-fonts.jetbrains-mono
		noto-fonts
	];
}
