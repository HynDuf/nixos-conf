{ config, pkgs, ...}:
{
    gtk = {
        enable = true;
        catppuccin = {
            enable = true;
            flavor = "mocha";
            accent = "maroon";
            size = "standard";
            tweaks = [ "rimless" ];
        };
        font = {
            name = "JetBrainsMono Nerd Font";
            size = 11;
        };
    };
}