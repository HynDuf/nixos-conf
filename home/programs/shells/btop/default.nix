{ pkgs, config, ... }:
{
    programs.btop = {
        enable = true; # replacement of htop/nmon

        extraConfig = builtins.readFile ./btop.conf;
    };

    # home.file.".config/btop/btop.conf" = {
    #     source = ./btop.conf;
    # };
}