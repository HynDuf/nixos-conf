{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    curl
    vim
    killall
    xdotool
    brightnessctl
    libnotify
    networkmanagerapplet
    i3lock-color
  ];

  programs.dconf.enable = true;
  programs.adb.enable = true;
  programs.fish.enable = true;
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  security.pam.services.i3lock.enable = true;
}
