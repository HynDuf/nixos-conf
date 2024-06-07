{ config, pkgs, ... }:
{
    programs.joshuto = {
        enable = true;
    };

    xdg.configFile."joshuto" = {
        source = ./config;

        recursive = true;
    };
}