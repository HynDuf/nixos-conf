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
            name = "MonoLisa";
            size = 11;
        };
        iconTheme = {
            name = "Papirus";
            package = pkgs.papirus-icon-theme;
        };
    };
}
