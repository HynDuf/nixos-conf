{ config, lib, pkgs, inputs, ... }:

{
  services.illogical-flake = {
    enable = true;
    user = "hynduf";

    hyprland = {
      enable = true;
      ozoneWayland.enable = true;

      package = inputs.illogical-flake.inputs.hyprland.packages.${pkgs.system}.hyprland;
      xdgPortalPackage = inputs.illogical-flake.inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
