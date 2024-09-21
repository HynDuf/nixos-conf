{ config, pkgs, ... }:
{
  catppuccin = {
    enable = false;
    flavor = "mocha";
    accent = "maroon";
    pointerCursor = {
      enable = true;
      accent = "blue";
      flavor = "mocha";
    };
  };
}
