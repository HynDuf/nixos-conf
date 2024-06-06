{ config, pkgs, ... }:
{
    home.pointerCursor = {
        size = 30;
        package = pkgs.catppuccin-cursors.mochaBlue;
        name = "Catppuccin-Mocha-Blue-Cursors";
    };
}