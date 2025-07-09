{
  config,
  pkgs,
  libs,
  ...
}:
let
  unstable = import
    (builtins.fetchTarball {
      name = "unstable";
      url = "https://github.com/nixos/nixpkgs/archive/55043dbf08ba864dddd3c884101eb1d81cc2ff71.tar.gz";
      sha256 = "02axd3q3329ql58v3vfry9a8b1c6r12lllzyl1z6c75w9r3ixd86";
    }) {
      system = pkgs.system;
      config.allowUnfree = true;
    };
in {
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
    unstable.syncthing

    # app
    unstable.obsidian
    unstable.zotero

    # monitor
    btop

    # system tools
    pciutils # lspci
    usbutils # lsusb

    gcc
    cmake
    telegram-desktop
    xlsx2csv
    atool
    exiftool
    inkscape
    pandoc
    mpv
    jq
    libreoffice-qt
    poppler
    ffmpegthumbnailer
    unar
    unstable.anki-bin
    qimgv
    conda
    xorg.xhost
    qalculate-gtk
    vesktop
    simplescreenrecorder
    screenkey
    dua
    duf
    ffmpeg
    python3
    playerctl
    pamixer
    unstable.typst
    unstable.tinymist
    unstable.typstfmt
    websocat
    transmission_4-gtk
    nautilus
    via
    rustdesk-flutter
    pkg-config
    beekeeper-studio
    ngrok
    postman
    teams-for-linux
    openssl
    nvtopPackages.nvidia
    mediainfo
    unstable.google-chrome
    socat
    unstable.slack
    unstable.qutebrowser-qt5
  ];

  programs = {
    feh.enable = true;
    zoxide.enable = true;
  };

  services = {
    network-manager-applet.enable = true;
    copyq.enable = true;
  };
}
