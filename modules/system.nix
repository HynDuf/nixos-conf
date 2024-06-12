# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:
let 
	username = "hynduf";
	bamboo = pkgs.callPackage ./pkgs/ibus-bamboo.nix {};
in {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.${username} = {
        isNormalUser = true;
        description = username;
        extraGroups = [ "networkmanager" "wheel" "video" "audio" "docker" ];
    };

    nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];

    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.permittedInsecurePackages = [
        "xpdf-4.05"
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
        enabled = "ibus";
        ibus.engines = [
            bamboo
        ];
    };

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
            naturalScrolling = true;
        };
    };

    fonts = {
        packages = with pkgs; [
            # normal fonts
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji

            # nerdfonts
            (
                nerdfonts.override {
                    fonts = [
                        "FiraCode"
                        "JetBrainsMono"
                    ];
                }
            )

        ];

        # use fonts specified by user rather than default ones
        enableDefaultPackages = false;

        # user defined fonts
        # the reason there's Noto Color Emoji everywhere is to override DejaVu's
        # B&W emojis that would sometimes show instead of some Color emojis
        fontconfig.defaultFonts = {
            serif = ["Noto Serif" "Noto Color Emoji"];
            sansSerif = ["Noto Sans" "Noto Color Emoji"];
            monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
            emoji = ["Noto Color Emoji"];
        };
    };

    programs.dconf.enable = true;

    programs.fish.enable = true;
    users.defaultUserShell = pkgs.fish;

    # Install firefox.
    programs.firefox.enable = true;

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
        # pipewire
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

    sound.enable = true;
    # hardware.pulseaudio.enable = true;
    services = {
        pipewire = {
            enable = true;
            audio.enable = true;
            pulse.enable = true;
            alsa = {
                enable = true;
                support32Bit = true;
            };
            jack.enable = true;
        };
    };
    security.rtkit.enable = true;

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
    hardware.bluetooth.enable = true; # enables support for Bluetooth
    hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
    services.blueman.enable = true;
}
