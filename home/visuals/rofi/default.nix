{ config, pkgs, ... }:
{
    programs.rofi = {
        enable = true;
        plugins = [
            pkgs.rofi-emoji
        ];
        configPath = "./config.rasi";
    };

    xdg.configFile.rofi = {
        source = ./config;
        recursive = true;
    };
}