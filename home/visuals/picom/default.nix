{
  config,
  inputs,
  pkgs,
  xdg,
  lib,
  ...
}:
{
  services.picom = {
    enable = true;

    # package = pkgs.fetchFromGitHub {
    #     owner = "FT-Labs";
    #     repo = "picom";
    #     rev = "df4c6a3d9b11e14ed7f3142540babea4c775ddb1";
    #     hash = "sha256-FmORxY7SLFnAmtQyC82sK36RoUBa94rJ7BsDXjXUCXk=";
    # };
  };

  xdg.configFile."picom/picom.conf" = {
    source = lib.mkForce ./picom.conf;
  };
}
