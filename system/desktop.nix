{ pkgs, ... }:
{
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
  
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;

  console.useXkbConfig = true;

  services.libinput.enable = true;
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-bamboo
      fcitx5-gtk
      libsForQt5.fcitx5-qt
      kdePackages.fcitx5-configtool
    ];
  };

  environment.sessionVariables = {
    QT_IM_MODULE  = "fcitx";
    XMODIFIERS    = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
  };
  services.xserver.desktopManager.runXdgAutostartIfNone = true;

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
  services.upower.enable = true;
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
  boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];

  systemd.services.lock-before-sleep = {
    description = "Lock X screen before sleep";
    wantedBy = [ "sleep.target" ];
    after     = [ "sleep.target" ];
    path = with pkgs; [ bash coreutils i3lock-color ];

    serviceConfig = {
      Type = "oneshot";
      User = "hynduf";
      Environment = [
        "DISPLAY=:0"
        "XAUTHORITY=/home/hynduf/.Xauthority"
        "HOME=/home/hynduf"
      ];
      ExecStart = "${pkgs.bash}/bin/bash /home/hynduf/.config/bin/lockscreen";
    };
  };
}
