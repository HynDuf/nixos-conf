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
}
