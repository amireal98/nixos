{ pkgs, ... }:

{

 stylix.polarity = "dark";
 
 stylix.fonts = {
  monospace = {
   package = maple-mono.NF;
   name = "Maple Mono Mono";
  };
  sansSerif = {
   package = maple-mono.NF;
   name = "Maple Mono Sans";
  };
  Serif = {
   package = maple-mono.NF;
   name = "Maple Mono Serif";
  };
  sizes = {
   applications = 12;
   terminal = 15;
   desktop = 10;
   popups = 10;
  };
 };

 stylix.opacity = {
  applications = 1.0;
  terminal = 0.9;
  desktop = 1.0;
  popups = 1.0;
 };
 
}
