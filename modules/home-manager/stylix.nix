{ pkgs, config, stylix, ... }: # Home.nix

{
  stylix = {
    enable = true;
    
    targets = {
      gtk.enable = true;
      qt.enable = true;
      vicinae.enable = true;
      obsidian.enable = true;
      zen-browser = {
	enable = false;
	profileNames = [ "default" "amireal" ];
      };
    };
  };
}
