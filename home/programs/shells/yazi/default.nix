{ config, pkgs, ... }:
{
    programs.yazi = {
        enable = true;
        enableFishIntegration = true;
    };

    xdg.configFile."yazi/theme.toml" = {
        source = ./theme-mocha.toml;
    };
    xdg.configFile."yazi/catppuccin-mocha.tmTheme" = {
        source = ./catppuccin-mocha.tmTheme;
    };
}
