{ config, pkgs, lib, ... }:
{
    imports = [
        ./programs
        ./shell
        ./visuals
        ./fonts
    ];

    # link the configuration file in current directory to the specified location in home directory
    # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

    # link all files in `./scripts` to `~/.config/i3/scripts`
    # home.file.".config/i3/scripts" = {
    #   source = ./scripts;
    #   recursive = true;   # link recursively
    #   executable = true;  # make all files executable
    # };

    # encode the file content in nix configuration file directly
    # home.file.".xxx".text = ''
    #     xxx
    # '';

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
            source = ./wallpapers;

            recursive = true;
        };

        file.".local/share/fonts".source = ./custom_fonts;
    };

    # Let home Manager install and manage itself.
    # programs.home-manager.enable = true;
}