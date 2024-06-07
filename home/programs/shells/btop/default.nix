{ pkgs, config, ... }:
{
    programs.btop = {
        enable = true; # replacement of htop/nmon

        extraConfig = builtins.readFile ./btop.conf;
    };
    xdg.configFile."btop" = {
        source = ./config;

        recursive = true;
    };

}