{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    font = {
      name = "MonoLisa";
      size = 11;
    };
    # iconTheme = {
    #   name = "Papirus";
    #   package = pkgs.papirus-icon-theme;
    # };
    gtk3.extraConfig = {
      "gtk-im-module" = "fcitx";
    };
    gtk4.extraConfig = {
      "gtk-im-module" = "fcitx";
    };
  };
  home.pointerCursor.size = 42;
}
