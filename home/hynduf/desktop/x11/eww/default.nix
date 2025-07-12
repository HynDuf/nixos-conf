{ config, pkgs, ... }:
{
  programs.eww = {
    enable = true;
    configDir = ./config;
  };

  xdg.configFile."eww" = {
    source = ./config;
    recursive = true;
  };
}
