{ pkgs, config, stylix, pkgs-iosevka-pin, ... }: {

  imports = [
    ../stylix/config.nix
  ];

  stylix.targets = {
    gtk.enable = true;
    qt.enable = true;
    limine.enable = true;
    console.enable = true;
  };
}
