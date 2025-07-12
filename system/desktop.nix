{ pkgs, ... }:
let
  bamboo = pkgs.callPackage ../pkgs/ibus-bamboo.nix { };
in {
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;

  services.xserver = {
    enable = true;
    dpi = 130;
    windowManager.bspwm.enable = true;
    desktopManager.xterm.enable = false;
    displayManager.startx.enable = true;
    xkb.options = "caps:swapescape";
  };
  services.displayManager.defaultSession = "none+bspwm";
  console.useXkbConfig = true;

  # Input
  services.libinput.enable = true;
  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = [ bamboo pkgs.ibus-engines.anthy ];
  };
  environment.variables = {
    GTK_IM_MODULE = "ibus";
    QT_IM_MODULE = "ibus";
    XMODIFIERS = "@im=ibus";
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    font-awesome
    newcomputermodern

    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    config.common.default = "*";
  };
  services.printing.enable = true;
}
