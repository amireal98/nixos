{ pkgs, config, stylix, ... }: # Home.nix

{
  stylix = {
    targets = {
      gtk.enable = true;
      qt.enable = true;
      vicinae.enable = true;
      obsidian.enable = true;
      vscode.enable = true;
      zen-browser = {
	enable = false;
	profileNames = [ "default" "amireal" ];
      };
    };
  };
}
