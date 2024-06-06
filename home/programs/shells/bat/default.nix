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
}