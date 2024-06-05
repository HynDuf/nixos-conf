{ config, pkgs, ...}:
{
    gtk = {
        enable = true;
        catppuccin = {
            enable = true;
            flavor = "mocha";
            accent = "red";
            size = "standard";
            tweaks = [ "rimless" ];
        };
    };
}