{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    userName = "hynduf";
    userEmail = "chauhuynhnoc@gmail.com";
    delta = {
      enable = true;
    };
  };
}
