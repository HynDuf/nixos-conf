{ pkgs, config, ... }:
{
  services.espanso = {
    enable = true;
  };
  xdg.configFile."espanso" = {
    source = ./config;
    recursive = true;
  };
}
