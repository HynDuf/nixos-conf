{ config, pkgs, ... }:

let
  unstable = import
    (builtins.fetchTarball {
      name = "unstable";
      url = "https://github.com/nixos/nixpkgs/archive/55043dbf08ba864dddd3c884101eb1d81cc2ff71.tar.gz";
      sha256 = "02axd3q3329ql58v3vfry9a8b1c6r12lllzyl1z6c75w9r3ixd86";
    }) {
      system = pkgs.system;
      config.allowUnfree = true;
    };
in {
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    package = unstable.yazi;
  };

  xdg.configFile."yazi" = {
    source = ./config;
    recursive = true;
  };
}
