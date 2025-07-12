{ config, pkgs, ... }:
{
  catppuccin = {
    gtk = {
      enable = true;
      flavor = "mocha";
      accent = "maroon";
    };
    enable = false;
    flavor = "mocha";
    accent = "maroon";
    cursors = {
      enable = true;
      accent = "blue";
      flavor = "mocha";
    };
  };
}
