{ pkgs, config, ... }:
{
    programs.bat = {
        enable = true;

        config = {
            theme = "TwoDark";
            paging = "never";
            style = "plain";
        };
    };

    # home.file.".config/btop/btop.conf" = {
    #     source = ./btop.conf;
    # };
}