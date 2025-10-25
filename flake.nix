{
  description = "NixOS flake of HynDuf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    nixpkgs-pin.url = "github:NixOS/nixpkgs/cec68a0f528c1eb4cdb9fedaada9747000d9e944";
    home-manager.url = "github:nix-community/home-manager";
    catppuccin.url = "github:catppuccin/nix";
    zen-browser = {
      url = "github:HynDuf/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dotfiles = {
      url = "github:HynDuf/dots-hyprland";
      flake = false;
    };
    illogical-flake = {
      url = "github:HynDuf/illogical-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
      inputs.dotfiles.follows = "dotfiles";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-pin, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      hostname = "yoru";
      username = "hynduf";

      pkgs-unstable = import nixpkgs-pin {
        inherit system;
        config.allowUnfree = true;
      };

    in {
      nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs username hostname;
          pkgs-unstable = pkgs-unstable;
        };
        modules = [
          ./hosts/hynduf/configuration.nix

          inputs.catppuccin.nixosModules.catppuccin
          inputs.illogical-flake.nixosModules.default

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs username hostname;
                pkgs-unstable = pkgs-unstable;
              };
              users."${username}".imports = [
                ./home/hynduf

                inputs.catppuccin.homeModules.catppuccin
              ];
            };
          }
        ];
      };
    };
}
