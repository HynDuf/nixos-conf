{ pkgs, config, pkgs-unstable, ... }:
{
  imports = [
    ./bat
    ./btop
    ./direnv
    ./eza
    ./fdzf
    ./fish
    ./git.nix
    ./ssh.nix
    ./kitty
    ./starship
    ./tmux
    ./yazi
  ];
}
