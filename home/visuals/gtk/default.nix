{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    font = {
      name = "MonoLisa";
      size = 11;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };
  home.pointerCursor.size = 42;
}
