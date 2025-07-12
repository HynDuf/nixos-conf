{ config, pkgs, ... }:
{
  home.file.".xinitrc" = {
    source = ./.xinitrc;
  };

  home.file.".Xresources" = {
    source = ./.Xresources;
  };
}
