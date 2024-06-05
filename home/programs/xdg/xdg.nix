{ config, xdg, ... }:
{
    xdg = {
        enable = true;
        cacheHome = config.home.homeDirectory + "/.local/cache";

        userDirs = {
            enable = false;
            createDirectories = false;
        };
    };
}