{ 
  lib,
  config,
  pkgs,
  ...
}:

# Dotfiles
let
  dotfiles = "${config.home.homeDirectory}/Nixos/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    git = "git";
    niri = "niri";
    hypr = "hypr";
    kitty = "kitty";
    nvim = "nvim";
  };
in

{
    xdg.configFile = builtins.mapAttrs
    (name: subpath: {
        source = create_symlink "${dotfiles}/${subpath}";
        recursive = true;
    }) configs;
}
