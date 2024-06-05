{ config, pkgs, ...}:
{
    gtk = {
        enable = true;
        catppuccin = {
            enable = true;
            flavor = "mocha";
            accent = "blue";
            size = "standard";
            tweaks = [ "normal" ];
        };
    };
}