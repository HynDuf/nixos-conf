{config, ...}:
{
    imports = [
        ./terminals.nix
        ./fish.nix
        ./starship
    ];

    home.sessionVariables = {
        EDITOR = "vim";
        BROWSER = "firefox";
        TERMINAL = "kitty";
    };
}