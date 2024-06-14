{ config, xdg, ... }:
{
    xdg = {
        enable = true;
        cacheHome = config.home.homeDirectory + "/.local/cache";

        userDirs = {
            enable = false;
            createDirectories = false;
        };
        desktopEntries = {
            nvim-wrap = {
                name = "Neovim Wrapper";
                exec = "/home/hynduf/bin/nvim_wrap %F";
                terminal = true;
                type = "Application";
                icon = "nvim";
                categories = [ "Utility" "TextEditor" ];
                mimeType = [ "text/markdown" "text/plain" "text/javascript" "application/json" "text/x-python" ];
                startupNotify = false;
            };
        };

    };
}