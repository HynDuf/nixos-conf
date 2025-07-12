{ pkgs, config, ... }:

{
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;

    settings = pkgs.lib.importTOML ./starship.toml;
  };
}
