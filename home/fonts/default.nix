{
  config,
  pkgs,
  libs,
  ...
}:
{
  home.packages = with pkgs; [
    (pkgs.nerdfonts.override {
      fonts = [
        "FiraCode"
        "JetBrainsMono"
        "Iosevka"
      ];
    })
  ];

  fonts.fontconfig.enable = true;
}
