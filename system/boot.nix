{ pkgs, ... }:
{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
      gfxmodeEfi = "1920x1080";
      splashImage = ../assets/images/wallpapers/hollow-knight.png;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  time.hardwareClockInLocalTime = true;
}
