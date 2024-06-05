{ config, pkgs}:
{
    services.dunst = {
        enable = true;

        # extraConfig = builtins.readFile ./sxhkdrc;
    };
}