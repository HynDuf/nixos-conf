{ pkgs, config, ... }:
{
    programs.eza = {
        enable = true;

        icons = true;
    };
}