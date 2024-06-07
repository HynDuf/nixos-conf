{ config, pkgs, ... }:
{
    programs.rofi = {
        enable = true;
        plugins = [
            pkgs.rofi-emoji
        ];
    };

    xdg.configFile."rofi" = {
        source = ./.;
        # copy the scripts directory recursively
        recursive = true;
    };
}