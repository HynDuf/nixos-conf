{ pkgs, ... }:
{
  imports = [
    ./catppuccin
    ./gtk
    ./rofi
    ./xdg
    ./fonts.nix
  ];
}
