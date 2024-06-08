{ config, pkgs, libs, ... }:

{
    # Packages that should be installed to the user profile.
    home.packages = with pkgs; [
        # here is some command line tools I use frequently
        # feel free to add your own or remove some of them

        # archives
        zip
        xz
        unzip
        p7zip
        rar

        # utils
        ripgrep # recursively searches directories for a regex pattern
        eza # A modern replacement for ‘ls’
        fzf # A command-line fuzzy finder
        fd
        bat # A "cat" drop-in replacement

        # misc
        file
        which
        tree
        lshw
        trash-cli

        # misc ui
        kdePackages.spectacle
        catppuccin-gtk
        pavucontrol

        imagemagick
        xclip
        maim
        syncthing

        # app
        obsidian
        discord
        zotero

        # monitor
        btop 

        # system tools
        pciutils # lspci
        usbutils # lsusb

        gcc
        telegram-desktop
        xlsx2csv
        atool
        exiftool
        inkscape
        pandoc
        mpv
        jq
        libreoffice-qt
        poppler_utils

        anki-bin
        pinta
        qimgv
        ueberzugpp

        conda
        xorg.xhost
    ];

    programs = {
        feh.enable = true; # image viewer
        zoxide.enable = true;
    };

    services = {
        network-manager-applet.enable = true;
        copyq.enable = true;
    };
}