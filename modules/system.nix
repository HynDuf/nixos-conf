# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  lib,
  ...
}:
let
  username = "hynduf";
  bamboo = pkgs.callPackage ./pkgs/ibus-bamboo.nix { };
in
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "docker"
      "adbusers"
    ];
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  nix.settings.trusted-users = [ "root" "hynduf" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "xpdf-4.05"
    "openssl-1.1.1w"
  ];

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nix.settings.auto-optimise-store = true;

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "en_US.UTF-8";
  };

  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = [
      bamboo
      pkgs.ibus-engines.anthy
    ];
  };

  # ibus
  environment.variables.GTK_IM_MODULE = "ibus";
  environment.variables.QT_IM_MODULE = "ibus";
  environment.variables.QT4_IM_MODULE = "ibus";
  environment.variables.CLUTTER_IM_MODULE = "ibus";
  environment.variables.GLFW_IM_MODULE = "ibus";
  environment.variables.XMODIFIERS = "@im=ibus";

  # direnv shell
  environment.variables.DIRENV_WARN_TIMEOUT = 0;

  services.xserver = {
    enable = true;

    windowManager.bspwm = {
      enable = true;
    };

    displayManager = {
      startx = {
        enable = true;
      };
    };
  };

  systemd = {
    targets = {
      sleep = {
        enable = false;
        unitConfig.DefaultDependencies = "no";
      };
      suspend = {
        enable = false;
        unitConfig.DefaultDependencies = "no";
      };
      hibernate = {
        enable = false;
        unitConfig.DefaultDependencies = "no";
      };
      "hybrid-sleep" = {
        enable = false;
        unitConfig.DefaultDependencies = "no";
      };
    };
  };

  # services.getty = {
  #     autologinUser = username;
  # };

  # wm
  services.displayManager = {
    defaultSession = "none+bspwm";
  };

  # touchpad config
  services.libinput = {
    enable = true;

    touchpad = {
      tapping = true;
      middleEmulation = true;
    };
  };

  fonts = {
    packages = with pkgs; [
      # normal fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      newcomputermodern

      # nerdfonts
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono

    ];

    # use fonts specified by user rather than default ones
    enableDefaultPackages = false;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = [
        "Noto Serif"
        "Noto Color Emoji"
      ];
      sansSerif = [
        "Noto Sans"
        "Noto Color Emoji"
      ];
      monospace = [
        "JetBrainsMono Nerd Font"
        "Noto Color Emoji"
      ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  programs.dconf.enable = true;
  programs.adb.enable = true;

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Install firefox.
  # programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    curl
    git
    sysstat
    lm_sensors # for `sensors` command

    # network
    networkmanagerapplet

    # audio
    libpulseaudio

    # display
    brightnessctl

    # for customization
    bsp-layout
    sxhkd
    i3lock-color

    # utils
    killall
    xdotool

    # libs
    bc
    libgcc
    go

    libnotify
    amdgpu_top
  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  environment.etc."current_system_packages".text =
    let
      packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
      sortedUnique = builtins.sort builtins.lessThan (lib.unique packages);
      formatted = builtins.concatStringsSep "\n" sortedUnique;
    in
    formatted;

  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  programs.noisetorch = {
    enable = true;
  };

  # enable docker
  virtualisation.docker.enable = true;

  # use docker without Root access (Rootless docker)
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;

    settings = {
      General = {
        Name = "yoru";
        ControllerMode = "dual";
        FastConnectable = "true";
        Experimental = "true";
        Enable = "Source,Sink,Media,Socket";
      };

      Policy = {
        AutoEnable = "true";
      };
    };
  };
  services.blueman.enable = true;
  hardware.keyboard.qmk.enable = true;
  services.udev.packages = [ pkgs.via ];
  services.flatpak.enable = true;
  xdg.portal.enable = true;
  xdg.mime.defaultApplications = {
    "image/png" = [
      "qimgv.desktop"
    ];
    "image/jpeg" = [
      "qimgv.desktop"
    ];
    "image/jpg" = [
      "qimgv.desktop"
    ];
  };
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
}
