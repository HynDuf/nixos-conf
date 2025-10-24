{ pkgs, config, ... }:
{
  services.redshift = {
    enable = true;
    temperature = {
      day = 6000;
      night = 2700;
    };
    dawnTime = "07:30-08:30";
    duskTime = "19:50-20:50";
  };
}
