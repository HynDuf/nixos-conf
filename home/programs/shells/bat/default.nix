{ pkgs, config, ... }:
{
  programs.bat = {
    enable = true;
    catppuccin.enable = true;
  };
}
