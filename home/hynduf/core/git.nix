{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "hynduf";
        email = "chauhuynhnoc@gmail.com";
      };
    };
  };
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };
}
