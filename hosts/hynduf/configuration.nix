# /yoru/hosts/hynduf/configuration.nix

{ config, pkgs, ... }:

{
  imports = [
    ../../system/base.nix
    ../../system/boot.nix
    ../../system/desktop.nix
    ../../system/programs.nix

    ./hardware-configuration.nix
  ];

  system.stateVersion = "25.05";
}
