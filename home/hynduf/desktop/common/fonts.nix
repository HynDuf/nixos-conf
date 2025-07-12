{
  config,
  pkgs,
  libs,
  ...
}:
{
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
  ];

  fonts.fontconfig.enable = true;
}
