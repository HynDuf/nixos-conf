{ pkgs, lib, ... }:

{
    programs.kitty = {
        enable = true;
    };
    
    xdg.configFile."kitty" = {
        source = ./.;

        recursive = true;
    };
}