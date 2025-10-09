{ config, pkgs, ... }:
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
        exec = "${config.home.homeDirectory}/.config/bin/nvim_wrap %F";
        terminal = true;
        type = "Application";
        icon = "nvim";
        categories = [ "Utility" "TextEditor" ];
        mimeType = [
          "text/markdown"
          "text/plain"
          "text/javascript"
          "application/json"
          "text/x-python"
        ];
        startupNotify = false;
      };
    };

    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/markdown" = "nvim-wrap.desktop";
        "text/plain" = "nvim-wrap.desktop";
        "text/javascript" = "nvim-wrap.desktop";
        "application/json" = "nvim-wrap.desktop";
        "text/x-python" = "nvim-wrap.desktop";

        "x-scheme-handler/http" = "zen.desktop";
        "x-scheme-handler/https" = "zen.desktop";
        "x-scheme-handler/chrome" = "zen.desktop";
        "text/html" = "zen.desktop";
        "application/x-extension-htm" = "zen.desktop";
        "application/x-extension-html" = "zen.desktop";
        "application/x-extension-shtml" = "zen.desktop";
        "application/xhtml+xml" = "zen.desktop";
        "application/x-extension-xhtml" = "zen.desktop";
        "application/x-extension-xht" = "zen.desktop";
        "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
        "x-scheme-handler/tonsite" = "org.telegram.desktop.desktop";
        "x-scheme-handler/discord" = "vesktop.desktop";
        "x-scheme-handler/magnet" = "userapp-transmission-gtk-7DPKC3.desktop";
      };
    };
  };
}
