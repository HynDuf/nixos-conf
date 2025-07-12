{ pkgs, config, ... }:
{
  xdg.configFile."clangd/config.yaml" = {
    source = ./config.yaml;
  };
}
