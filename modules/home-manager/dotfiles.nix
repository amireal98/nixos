{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/Nixos/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = { # dotfiles here
    gh = "gh";
    nvim = "nvim";
    spotify-player = "spotify-player";
    hypr = "hypr";
    kitty = "kitty";
  };
in {
  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;
}
