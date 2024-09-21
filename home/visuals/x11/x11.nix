{ config, pkgs, ... }:
{
  home.file.".xinitrc" = {
    source = ./.xinitrc;
  };
}
