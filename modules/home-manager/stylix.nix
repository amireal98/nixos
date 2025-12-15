{ pkgs, config, stylix, ... }: # Home.nix

{
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal.yaml";
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
