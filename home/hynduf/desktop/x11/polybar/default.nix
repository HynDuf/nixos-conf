{
  config,
  pkgs,
  xdg,
  lib,
  ...
}:
{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      alsaSupport = true;
      githubSupport = true;
      mpdSupport = true;
      pulseSupport = true;
    };
    script = builtins.readFile ../../../../../assets/bin/launch.sh;
  };

  xdg.configFile."polybar" = {
    source = ./config;

    recursive = true;
  };
}
