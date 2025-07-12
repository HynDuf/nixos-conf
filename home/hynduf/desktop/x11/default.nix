{ pkgs, ... }:
{
  imports = [
    ./bspwm
    ./picom
    ./polybar
    ./eww
    ./resources
  ];
}
