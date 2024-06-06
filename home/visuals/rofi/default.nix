{ config, pkgs, ... }:
{
    programs.rofi = {
        enable = true;
        plugins = [
            pkgs.rofi-emoji
        ];
    };

    home.file.".config/rofi" = {
        source = ./.;
        # copy the scripts directory recursively
        recursive = true;
    };
}