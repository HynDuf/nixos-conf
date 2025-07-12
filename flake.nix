{
  description = "NixOS flake of HynDuf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-pin.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    catppuccin.url = "github:catppuccin/nix";
    zen-browser.url = "github:HynDuf/zen-browser-flake";
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
