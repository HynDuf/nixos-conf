{ config, pkgs, ... }:
{
    home.pointerCursor = {
        size = 30;
        package = pkgs.capitaine-cursors;
        name = "capitaine-cursors";

        x11 = {
            enable = true;
            defaultCursor = "left_ptr";
        };
    };
}