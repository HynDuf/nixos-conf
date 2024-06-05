{ config, pkgs, libs, ... }:
{
    home.packages = with pkgs; [
        # "feather"

        (
            pkgs.nerdfonts.override {
                fonts = [
                    "FiraCode"
                    "JetBrainsMono"
                    "Iosevka"
                ];
            }
        )
    ];


    fonts.fontconfig.enable = true;
}