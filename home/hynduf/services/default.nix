{ ... }:
{
  imports = [
    ./redshift/default.nix
    ./espanso/default.nix
  ];

  services = {
    network-manager-applet.enable = true;
    copyq.enable = true;
  };
}
