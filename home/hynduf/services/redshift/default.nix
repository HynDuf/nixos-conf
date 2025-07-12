{ pkgs, config, ... }:
{
  services.redshift = {
    enable = true;
    temperature = {
      day = 6000;
      night = 3200;
    };
    latitude = 18.0;
    longitude = 110.0;
  };
}
