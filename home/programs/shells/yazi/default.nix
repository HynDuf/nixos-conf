{ config, pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };

  xdg.configFile."yazi" = {
    source = ./config;
    recursive = true;
  };
}
