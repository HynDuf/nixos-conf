{ config, pkgs, ... }:
{
  programs.zathura = {
    enable = true;
    # catppuccin = {
    #     enable = true;
    #     flavor = "mocha";
    # };
  };
  xdg.configFile."zathura/zathurarc" = {
    source = ./zathurarc;
  };
}
