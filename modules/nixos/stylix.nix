{ pkgs, config, stylix, pkgs-iosevka-pin, ... }: {
  stylix = {
    enable = true;
    image = ../../wallpapers/dark-lines.jpeg;
    autoEnable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.iosevka;
        name = "Iosevka Custom Extended";
      };
      serif = {
        package = pkgs.iosevka;
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
        applications = 12;
      };
    };

    targets = {
      gtk.enable = true;
      qt.enable = true;
      limine.enable = true;
      console.enable = true;
    };
  };
}
