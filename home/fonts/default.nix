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
    font-awesome
  ];

  fonts.fontconfig.enable = true;
}
