{ pkgs, config, stylix, pkgs-iosevka-pin, ... }: {

  imports = [
    ../stylix/config.nix
  ];

  stylix.targets = {
    zen-browser.enable = false;
    kitty.enable = false;
  };
}
