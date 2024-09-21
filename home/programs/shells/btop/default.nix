{ pkgs, config, ... }:
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "adapta";
    };
  };
}
