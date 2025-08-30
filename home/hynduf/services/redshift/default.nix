{ pkgs, config, ... }:
{
  services.redshift = {
    enable = true;
    temperature = {
      day = 6000;
      night = 3200;
    };
    dawnTime = "06:30-07:30";
    duskTime = "21:00-22:00";
  };
}
