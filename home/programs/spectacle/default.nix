{
  config,
  pkgs,
  xdg,
  lib,
  ...
}:
{
  xdg.configFile."spectaclerc" = {
    source = lib.mkForce ./spectaclerc;
  };
}
