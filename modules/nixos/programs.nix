{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      user.name = "amireal98";
      user.email = "amireal98@proton.me";
      init.defaultBranch = "main";
    };
  };

  programs.starship = {
    enable = true;
    presets = [ "nerd-font-symbols" ];
  };

  programs.steam.enable = true;

  programs.nautilus.enable = true;
  programs.obsidian.enable = true;
  programs.vesktop.enable = true;
  programs.zed-editor.enable = true;
  programs.vscode.enable = true;
  programs.firefox.enable = true;
}
