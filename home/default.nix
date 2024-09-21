{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./programs
    ./shell
    ./visuals
    ./fonts
  ];

  home = {
    # This value determines the home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update home Manager without changing this value. See
    # the home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "23.11";

    file."bin" = {
      source = ../bin;

      recursive = true;

      executable = true;
    };

    file."Pictures" = {
      source = ./images;

      recursive = true;
    };

    file.".local/share/fonts".source = ./custom_fonts;
  };

  # Let home Manager install and manage itself.
  # programs.home-manager.enable = true;
}
