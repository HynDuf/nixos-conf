{ pkgs, inputs, ... }:

{
  imports = [
    ./core
    ./desktop
    ./editors
    ./apps
    ./services
  ];

  home = {
    stateVersion = "25.05";
    username = "hynduf";
    homeDirectory = "/home/hynduf";

    file.".local/share/fonts".source = ../../assets/fonts;
    file.".config/bin" = {
      source = ../../assets/bin;
      recursive = true;
      executable = true;
    };
    file."Pictures" = {
      source = ../../assets/images;
      recursive = true;
    };

    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "zen"; 
      TERMINAL = "kitty";
    };

    packages = [ inputs.zen-browser.packages.x86_64-linux.specific ];
  };
}
