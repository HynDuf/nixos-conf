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
    QT4_IM_MODULE = "ibus";
    CLUTTER_IM_MODULE = "ibus";
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
  services.thermald.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      START_CHARGE_THRESH_BAT1 = 40;
      STOP_CHARGE_THRESH_BAT1 = 80;
    };
  };
}
