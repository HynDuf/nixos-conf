{
  config,
  pkgs,
  xdg,
  lib,
  ...
}:
{
  # bspwm
  xsession = {
    numlock.enable = true;

    windowManager = {
      bspwm = {
        enable = true;

        extraConfigEarly = builtins.readFile ./bspwmrc;
      };
    };
  };

  # sxhkd
  services.sxhkd = {
    enable = true;

    extraConfig = builtins.readFile ./sxhkdrc;
  };

  # xdg.configFile."sxhkd/sxhkdrc" = {
  #     source = lib.mkForce ./sxhkdrc;
  # };
}
