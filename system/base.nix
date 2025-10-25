{ config, lib, pkgs, username, hostname, ... }:

{
  # Define a user account
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "docker" "adbusers" ];
  };
  users.defaultUserShell = pkgs.fish;

  # Networking
  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  # Time and Locale
  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "en_US.UTF-8";
  };

  # Nix settings
  nix = {
    settings = {
      substituters = ["https://hyprland.cachix.org"];
      trusted-substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "${username}" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "xpdf-4.05" "openssl-1.1.1w" ];
    overlays = [
      (final: prev: {
        ibus-bamboo = final.callPackage ../../pkgs/ibus-bamboo.nix {};
      })
    ];
  };

  # For tools like `sensors`
  hardware.enableRedistributableFirmware = true;
}
