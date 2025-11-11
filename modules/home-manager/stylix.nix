{ 
  lib,
  config,
  pkgs,
  stylix,
  ...
}:

{
    stylix.targets = {
        kitty.enable = true;
    }
}