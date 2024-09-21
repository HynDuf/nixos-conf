{ config, pkgs, ... }:
{
  gtk = {
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "maroon";
    };
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
}
