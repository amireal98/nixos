{ pkgs, config, stylix, pkgs-iosevka-pin, ... }: {
  stylix = {
    enable = true;
    image = ../../wallpapers/dark-lines.jpeg;
    autoEnable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-dark-funeral.yaml";
    polarity = "dark";

    cursor = {
      package = pkgs.volantes-cursors;
      name = "volantes_cursors";
      size = 12;
    };    

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.iosevka;
        name = "Iosevka Custom Extended";
      };
      serif = {
        package = pkgs.nerd-fonts.iosevka;
        name = "Iosevka Etoile";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.iosevka;
        name = "Iosevka Aile";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 11;
      };
    };
  };
}
