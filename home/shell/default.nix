{ config, ... }:
{
  imports = [
    ./kitty
    ./fish
    ./starship
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "zen";
    TERMINAL = "kitty";
  };

  home.sessionPath = [
    "$HOME/Projects/aptos/bin"
  ];
}
