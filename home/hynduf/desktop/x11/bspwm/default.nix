{
  config,
  pkgs,
  xdg,
  lib,
  ...
}:
{
  xsession = {
    windowManager = {
      bspwm = {
        enable = true;
        extraConfigEarly = builtins.readFile ./bspwmrc;
      };
    };
  };

  services.sxhkd = {
    enable = true;
    extraConfig = builtins.readFile ./sxhkdrc;
  };

  programs.feh.enable = true;
}
