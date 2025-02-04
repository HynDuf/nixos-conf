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
      url = "https://github.com/nixos/nixpkgs/archive/7e44df498f1e99e9e67babe31bc375911ae30368.tar.gz";
      sha256 = "0m5fpbr7x6am2wqzjxlfmvmh37s97schska16kf4xlx0n2rbyiqb";
    }) {
      system = "x86_64-linux";
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
    syncthing

    # app
    unstable.obsidian
    zotero

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
    microsoft-edge
    python3
    playerctl
    pamixer
    typst
    tinymist
    typstfmt
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
    qgis
    mediainfo
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
