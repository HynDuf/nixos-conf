{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    plugins = [
      pkgs.rofi-emoji
    ];
  };

  xdg.configFile.rofi = {
    source = ./config;
    recursive = true;
  };
}
