{ config, pkgs, ... }:
{
    programs.rofi = {
        enable = true;
    };

    home.file.".config/rofi" = {
        source = ./.;
        # copy the scripts directory recursively
        recursive = true;
    };
}