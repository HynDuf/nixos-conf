{ config, pkgs, ... }:
{
  catppuccin = {
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
