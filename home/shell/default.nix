{config, ...}:
{
    imports = [
        ./kitty
        ./fish
        ./starship
    ];

    home.sessionVariables = {
        EDITOR = "nvim";
        BROWSER = "firefox";
        TERMINAL = "kitty";
    };
}