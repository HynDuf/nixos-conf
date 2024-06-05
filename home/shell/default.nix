{config, ...}:
{
    imports = [
        ./kitty
        ./zsh
        ./starship
    ];

    home.sessionVariables = {
        EDITOR = "nvim";
        BROWSER = "firefox";
        TERMINAL = "kitty";
    };
}